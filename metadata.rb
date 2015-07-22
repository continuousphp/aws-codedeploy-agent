name             'aws-codedeploy-agent'
maintainer       'Oswald De Riemaecker'
maintainer_email 'oswald@continuousphp.com'
license          'Apache 2.0'
description      'Installs/Configures aws-codedeploy-agent'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

supports 'ubuntu'
supports 'centos'
supports 'fedora'

depends 'ohai'
depends 'build-essential'
depends 'rbenv'
depends 'ark'
