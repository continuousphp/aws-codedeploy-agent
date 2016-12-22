# ~FC015
define :download_installer do
  include_recipe 'ohai'
  include_recipe 'build-essential'
  include_recipe 'ruby_rbenv::system'
  include_recipe 'ruby_build'
  include_recipe 'cloudcli'

  ark 'download-codedeploy' do
    url "https://github.com/aws/aws-codedeploy-agent/archive/#{node['aws-codedeploy-agent']['aws_codedeploy_agent-version']}.zip"
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

  rbenv_plugin 'rbenv-download' do
    git_url 'https://github.com/garnieretienne/rvm-download.git'
  end

  rbenv_ruby node['aws-codedeploy-agent']['rbenv_ruby-version'] do
    #action :install
    rbenv_action 'download'
  end

  rbenv_global node['aws-codedeploy-agent']['rbenv_ruby-version']

  %w(simple_pid gli logging zip).each do |gem|
    rbenv_gem gem do
      rbenv_version node['aws-codedeploy-agent']['rbenv_ruby-version']
    end
  end

  rbenv_gem 'aws-sdk-core' do
    rbenv_version node['aws-codedeploy-agent']['rbenv_ruby-version']
    version node['aws-codedeploy-agent']['aws_sdk_core-version']
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

end
