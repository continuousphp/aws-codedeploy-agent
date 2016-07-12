require 'chefspec'

at_exit { ChefSpec::Coverage.report! }

describe 'aws-codedeploy-agent::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  # Fix for ohai
  @dummy_config = Tempfile.new 'chef-config'
  Chef::Config[:config_file] = @dummy_config.path

  #it 'creates the codedeploy-agent link' do
  #  stub_command("test -f /opt/codedeploy-agent").and_return(true)
  #  expect(chef_run).to create_link('/opt/codedeploy-agent')
  #end

  it 'set the codedeploy-agent permissions' do
    stub_command('test -f /opt/codedeploy-agent').and_return(true)
    expect(chef_run).to create_file('/opt/codedeploy-agent/bin/codedeploy-agent').with(
      user:   'root',
      group:  'root',
      mode:   '0755'
    )
  end

  it 'creates the ruby2.0 link' do
    stub_command('test -f /opt/codedeploy-agent').and_return(true)
    expect(chef_run).to create_link('/usr/bin/ruby2.0')
  end

  it 'creates the init.d codedeploy-agent link' do
    stub_command('test -f /opt/codedeploy-agent').and_return(true)
    expect(chef_run).to create_link('/etc/init.d/codedeploy-agent')
  end

  it 'creates the codedeploy-agent conf directory' do
    stub_command('test -f /opt/codedeploy-agent').and_return(true)
    expect(chef_run).to create_directory('/etc/codedeploy-agent/conf')
  end

  it 'creates the deployment root directory' do
    stub_command('test -f /opt/codedeploy-agent').and_return(true)
    expect(chef_run).to create_directory('/opt/codedeploy-agent/deployment-root')
  end

  it 'creates the codedeploy agent conf link' do
    stub_command('test -f /opt/codedeploy-agent').and_return(true)
    expect(chef_run).to create_link('/etc/codedeploy-agent/conf/codedeployagent.yml')
  end

  it 'starts the codedeploy-agent service' do
    stub_command('test -f /opt/codedeploy-agent').and_return(true)
    expect(chef_run).to start_service('codedeploy-agent')
  end
end
