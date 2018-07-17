# Encoding: utf-8
# frozen_string_literal: true

#
# Cookbook:: aws-codedeploy-agent
# Recipe:: default
#
# Copyright 2018, continuous.lu
# Author: Tomasina Pierre (pierre.tomasina@continuous.lu)
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

remote_file '/tmp/codedeploy-agent-setup' do
  source "https://aws-codedeploy-#{node['aws-codedeploy-agent']['aws_region']}.s3.amazonaws.com/latest/install"
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'install-codedeploy-agent' do
    command '/tmp/codedeploy-agent-setup auto'
end

service 'codedeploy-agent' do
  priority 40
  action [:enable, :start]
end

