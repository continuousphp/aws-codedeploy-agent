require 'serverspec'

set :backend, :exec

describe service('codedeploy-agent') do
  it { should be_enabled }
  it { should be_running }
end
