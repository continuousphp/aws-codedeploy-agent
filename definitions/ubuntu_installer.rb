define :ubuntu_installer do

  include_recipe 'cloudcli'

  remote_file "#{Chef::Config[:file_cache_path]}/codedeploy-agent_all.deb" do
    source 'https://s3.amazonaws.com/aws-codedeploy-us-east-1/latest/codedeploy-agent_all.deb'
    action :create
  end

  dpkg_package 'codedeploy-agent' do
    source "#{Chef::Config[:file_cache_path]}/codedeploy-agent_all.deb"
    action :install
  end
end
