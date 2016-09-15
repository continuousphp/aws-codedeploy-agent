name             'aws-codedeploy-agent'
maintainer       'Oswald De Riemaecker'
maintainer_email 'oswald@continuousphp.com'
license          'Apache 2.0'
description      'Installs/Configures aws-codedeploy-agent'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.6.0'

supports 'ubuntu'
supports 'centos'
supports 'fedora'
supports 'debian'

depends 'ohai'
depends 'build-essential'
depends 'ruby_rbenv'
depends 'ruby_build'
depends 'cloudcli'
depends 'ark', '= 0.9.0'
