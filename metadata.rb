name             'apt-mirror'
maintainer       'Heavy Water Operations'
maintainer_email 'aaron@hw-ops.com'
license          'Apache 2.0'
description      'Installs/Configures apt-mirror'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'

supports  'ubuntu'

depends 'aws', '= 2.6.5'
depends 'mkfs'
depends 'lvm'
