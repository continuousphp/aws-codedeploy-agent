# frozen_string_literal: true

name             'aws-codedeploy-agent'
maintainer       'Continuous S.A'
maintainer_email 'info@continuousphp.com'
source_url       'https://github.com/continuousphp/aws-codedeploy-agent'
issues_url       'https://github.com/continuousphp/aws-codedeploy-agent/issues'
license          'Apache 2.0'
description      'Installs/Configures aws-codedeploy-agent'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
chef_version '>= 12.1' if respond_to?(:chef_version)
version '2.0.0'

depends 'apt'
depends 'build-essential'
