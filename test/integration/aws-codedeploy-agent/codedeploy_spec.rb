require 'serverspec'

set :backend, :exec

describe service('codedeploy-agent') do
  it { should be_running }
end

describe command('ps -ax | grep "codedeploy-agent: master" | grep -v grep') do
  its(:stdout) { should match /codedeploy-agent: master/ }
end
