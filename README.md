aws-codedeploy-agent Cookbook
===================
Important Note: This cookbook is under development. Contribution is welcome!

Install AWS aws-codedeploy-agent

Requirements
------------
The following platforms are supported by this cookbook.

* Ubuntu 12.04/14.04/16.04
* CentOs 7 
* Fedora 21
* Debian 8 
* Amazon Linux AMI 2015.03

#### packages
- `aws-codedeploy-agent` - install aws-codedeploy-agent 

Attributes
----------
Customize the version of aws-codedeploy-agent to be installed and the version of the ruby and aws-sdk-core dependencies

#### aws-codedeploy-agent::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>node['aws-codedeploy-agent']['rbenv_ruby-version']</tt></td>
    <td>string</td>
    <td>Set the default ruby version of code deploy</td>
    <td><tt>2.1.5</tt></td>
  </tr>
  <tr>
    <td><tt>node['aws-codedeploy-agent']['aws_sdk_core-version']</tt></td>
    <td>string</td>
    <td>Set the version of aws-sdk-core gem. See <a href="https://rubygems.org/gems/aws-sdk-core/versions/2.3.17">rubygems for alternate release versions.</a></td>
    <td><tt>2.6.11</tt></td>
  </tr>
  <tr>
    <td><tt>node['aws-codedeploy-agent']['aws_codedeploy_agent-version']</tt></td>
    <td>string</td>
    <td>Set the version of the code deploy agent to be installed. Tracks master, other options include &quot;v1.0-1011&quot; or see <a href="https://github.com/aws/aws-codedeploy-agent/releases">the release archive for available, tagged versions</a> </td>
    <td><tt>master</tt></td>
  </tr>
</table>


Usage
-----
#### aws-codedeploy-agent::default

Just include `aws-codedeploy-agent` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[aws-codedeploy-agent]"
  ]
}
```

Testing
-------
Default .kitchen.yml test the cookbook in docker containers.

To test locally:

```bash
kitchen list
kitchen converge aws-codedeploy-agent-ubuntu-1604
kitchen verify aws-codedeploy-agent-ubuntu-1604
``` 

To test the cookbook on AWS instances use:

Configure the access to your AWS account using the AWS CLI:
```bash
aws configure --profile=AWS_CLI_PROFILE
```

copy the .kitchen-aws.yml to .kitchen-aws.local.yml and configure to suite your AWS account.

```bash
AWS_PROFILE=AWS_CLI_PROFILE KITCHEN_YAML=.kitchen-aws.local.yml bundle exec kitchen list 

AWS_PROFILE=AWS_CLI_PROFILE KITCHEN_YAML=.kitchen-aws.local.yml bundle exec kitchen verify aws-codedeploy-agent-ubuntu-1604-aws
AWS_PROFILE=AWS_CLI_PROFILE KITCHEN_YAML=.kitchen-aws.local.yml bundle exec kitchen verify aws-codedeploy-agent-ubuntu-1404-aws
AWS_PROFILE=AWS_CLI_PROFILE KITCHEN_YAML=.kitchen-aws.local.yml bundle exec kitchen verify aws-codedeploy-agent-ubuntu-1204-aws 
AWS_PROFILE=AWS_CLI_PROFILE KITCHEN_YAML=.kitchen-aws.local.yml bundle exec kitchen verify aws-codedeploy-agent-debian-8-aws 
AWS_PROFILE=AWS_CLI_PROFILE KITCHEN_YAML=.kitchen-aws.local.yml bundle exec kitchen verify aws-codedeploy-agent-centos-7-aws 
AWS_PROFILE=AWS_CLI_PROFILE KITCHEN_YAML=.kitchen-aws.local.yml bundle exec kitchen verify aws-codedeploy-agent-amazon-linux
```

To test all at once:

```bash
AWS_PROFILE=AWS_CLI_PROFILE KITCHEN_YAML=.kitchen-aws.local.yml bundle exec kitchen verify -c 5
```

Refer to the [kitchen-ec2](https://github.com/test-kitchen/kitchen-ec2) documentation

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: 

* Oswald De Riemaecker (oswald@continuousphp.com)

```text
Copyright 2015, Continuous S.A.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
``` 
