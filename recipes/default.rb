#
# Cookbook Name:: aws-codedeploy-agent
# Recipe:: default
#
# Copyright 2015, continuousphp.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

Chef::Log.info('Platform:' + node['platform'])

case node['platform']
when 'ubuntu'
  execute 'apt-get-update-periodic' do
    command 'apt-get update'
    ignore_failure true
    only_if do
      File.exist?('/var/lib/apt/periodic/update-success-stamp') &&
      File.mtime('/var/lib/apt/periodic/update-success-stamp') < Time.now - 86400
    end
  end
  %w(unzip rsync ruby).each do |pkg|
    package pkg
  end
when 'fedora'
  %w(unzip rsync ruby tar openssl-devel readline-devel zlib-devel).each do |pkg|
    package pkg
  end
when 'debian'
  %w(unzip rsync ruby tar).each do |pkg|
    package pkg
  end
else
  %w(unzip rsync ruby tar openssl-devel readline-devel zlib-devel).each do |pkg|
    package pkg
  end
end

include_recipe 'ohai'
include_recipe 'build-essential'
include_recipe 'rbenv::default'
include_recipe 'rbenv::ruby_build'

ark 'download-codedeploy' do
  url 'https://github.com/aws/aws-codedeploy-agent/archive/master.zip'
  path '/opt'
  action :put
end

link '/opt/codedeploy-agent' do
  to '/opt/download-codedeploy'
  not_if 'test -f /opt/codedeploy-agent'
end

file '/opt/codedeploy-agent/bin/codedeploy-agent' do
  mode '0755'
  owner 'root'
  group 'root'
end

rbenv_ruby node['aws-codedeploy-agent']['ruby-version'] do
  ruby_version node['aws-codedeploy-agent']['ruby-version']
  global true
end

link '/usr/bin/ruby2.0' do
  to '/opt/rbenv/versions/2.0.0-p645/bin/ruby'
end

link '/etc/init.d/codedeploy-agent' do
  to '/opt/codedeploy-agent/init.d/codedeploy-agent'
end

%w(/opt/codedeploy-agent/deployment-root /etc/codedeploy-agent/conf).each do |dir|
  directory dir do
    action :create
    recursive true
  end
end

link '/etc/codedeploy-agent/conf/codedeployagent.yml' do
  to '/opt/codedeploy-agent/conf/codedeployagent.yml'
end

service 'codedeploy-agent' do
  provider Chef::Provider::Service::Init
  action [:start]
end
