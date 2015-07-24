require 'serverspec'

set :backend, :exec

describe service('codedeploy-agent') do
  it { should be_running }
end

describe command('ps -ax | grep "codedeploy-agent: InstanceAgent"') do
  its(:stdout) { should match /codedeploy-agent: InstanceAgent/ }
end
