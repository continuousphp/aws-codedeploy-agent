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
  manual_installer
when 'fedora'
  %w(unzip rsync ruby tar openssl-devel readline-devel zlib-devel).each do |pkg|
    package pkg
  end
  manual_installer
when 'debian'
  %w(unzip rsync ruby tar).each do |pkg|
    package pkg
  end
  manual_installer
when 'amazon'
  %w(ruby aws-cli).each do |pkg|
    package pkg
  end
  amazon_installer
else
  %w(unzip rsync ruby tar openssl-devel readline-devel zlib-devel).each do |pkg|
    package pkg
  end
  manual_installer
end
