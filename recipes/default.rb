# Encoding: utf-8
# frozen_string_literal: true

#
# Cookbook:: aws-codedeploy-agent
# Recipe:: default
#

include_recipe 'aws-codedeploy-agent::dependencies'
include_recipe 'aws-codedeploy-agent::codedeploy_agent'
