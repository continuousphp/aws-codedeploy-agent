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

Chef::Log.debug('Platform:' + node['platform'])
Chef::Log.debug('Platform:' + node['platform_version'])

case node['platform']
when 'ubuntu'
  execute 'apt-get-update-periodic' do
    command 'apt-get update'
    ignore_failure true
  end

  case node['platform_version']
  when '16.04'
    %w(unzip rsync ruby2.3).each do |pkg|
      package pkg
    end
    download_installer
  when '14.04'
    %w(unzip rsync ruby2.0).each do |pkg|
      package pkg
    end
    download_installer
  when '12.04'
    %w(unzip rsync ruby).each do |pkg|
      package pkg
    end
    download_installer
  end
  service 'codedeploy-agent' do
    action [:enable, :start]
  end

when 'fedora'
  %w(unzip rsync ruby tar openssl-devel readline-devel zlib-devel initscripts).each do |pkg|
    package pkg
  end
  download_installer
  service 'codedeploy-agent' do
    action [:enable,:start]
    #provider Chef::Provider::Service::Init
  end

when 'centos'
  %w(unzip rsync ruby tar openssl-devel readline-devel zlib-devel bzip2 initscripts).each do |pkg|
    package pkg
  end
  manual_installer
  service 'codedeploy-agent' do
    action [:enable,:start]
    Chef::Provider::Service::Upstart
  end

when 'debian'
  execute 'apt-get-update-periodic' do
    command 'apt-get update'
    ignore_failure true
  end
  %w(unzip rsync ruby tar).each do |pkg|
    package pkg
  end
  download_installer
  service 'codedeploy-agent' do
    action [:enable,:start]
  end

when 'amazon'
  %w(ruby aws-cli).each do |pkg|
    package pkg
  end
  amazon_installer
  service 'codedeploy-agent' do
    action [:start]
    provider Chef::Provider::Service::Init
  end
else
  %w(unzip rsync ruby tar openssl-devel readline-devel zlib-devel).each do |pkg|
    package pkg
  end
  manual_installer
  service 'codedeploy-agent' do
    action [:enable,:start]
  end
end
