aws-codedeploy-agent Cookbook
===================
Important Note: This cookbook is under development. Contribution is welcome!

Install AWS aws-codedeploy-agent

Requirements
------------
The following platforms are supported by this cookbook.

* Ubuntu 14.04
* CentOs 7 
* Fedora 21
* Debian 8 
* Amazon Linux AMI 2015.03

#### packages
- `aws-codedeploy-agent` - install aws-codedeploy-agent 

Attributes
----------
Customize the attributes to set ruby version requirements of AWS aws-codedeploy-agent (currently 2.0.0-p645) 

#### aws-codedeploy-agent::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>node['aws-codedeploy-agent']['ruby-version']</tt></td>
    <td>string</td>
    <td>Set the default ruby version of code deploy</td>
    <td><tt>2.0.0-p645</tt></td>
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

To test the cookbook on AWS instances use:
```bash
KITCHEN_YAML=.kitchen-aws.yml bundle exec kitchen list 
KITCHEN_YAML=.kitchen-aws.yml bundle exec kitchen verify aws-codedeploy-agent-ubuntu-1404-aws
KITCHEN_YAML=.kitchen-aws.yml bundle exec kitchen verify aws-codedeploy-agent-ubuntu-1204-aws 
KITCHEN_YAML=.kitchen-aws.yml bundle exec kitchen verify aws-codedeploy-agent-debian-8-aws 
KITCHEN_YAML=.kitchen-aws.yml bundle exec kitchen verify aws-codedeploy-agent-amazon-linux
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
