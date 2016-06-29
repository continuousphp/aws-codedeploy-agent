# ~FC015
define :manual_installer do
  include_recipe 'ohai'
  include_recipe 'build-essential'
  include_recipe 'rbenv::default'
  include_recipe 'rbenv::ruby_build'
  include_recipe 'awscli'

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

  %w(simple_pid gli logging zip).each do |gem|
    rbenv_gem gem do
      ruby_version node['aws-codedeploy-agent']['ruby-version']
    end
  end

  rbenv_gem 'aws-sdk-core' do
    ruby_version node['aws-codedeploy-agent']['ruby-version']
    version '2.3.17'
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
    action [:enable, :start]
  end
end
