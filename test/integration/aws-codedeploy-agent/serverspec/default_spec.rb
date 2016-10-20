require 'serverspec'

set :backend, :exec

describe service('codedeploy-agent') do
  it { should be_enabled }
end

describe command('ps -ax | grep "codedeploy-agent: InstanceAgent" | grep -v grep') do
  its(:stdout) { should match /codedeploy-agent: InstanceAgent/ }
end
