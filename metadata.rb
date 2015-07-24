name             'aws-codedeploy-agent'
maintainer       'Oswald De Riemaecker'
maintainer_email 'oswald@continuousphp.com'
license          'Apache 2.0'
description      'Installs/Configures aws-codedeploy-agent'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.1'

supports 'ubuntu'
supports 'centos'
supports 'fedora'
supports 'debian'

depends 'ohai'
depends 'build-essential'
depends 'rbenv'
depends 'awscli'
depends 'ark', '= 0.9.0'
