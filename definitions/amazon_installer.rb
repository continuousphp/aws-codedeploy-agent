define :amazon_installer do
  remote_file "#{Chef::Config[:file_cache_path]}/codedeploy-agent.noarch.rpm" do
    source 'https://s3.amazonaws.com/aws-codedeploy-us-east-1/latest/codedeploy-agent.noarch.rpm'
    action :create
  end

  rpm_package 'codedeploy-agent' do
    source "#{Chef::Config[:file_cache_path]}/codedeploy-agent.noarch.rpm"
    action :install
  end
end
