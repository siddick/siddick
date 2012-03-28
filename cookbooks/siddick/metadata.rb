maintainer       "siddick"
maintainer_email "siddick@gmail.com"
license          "All rights reserved"
description      "Installs/Configures siddick"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends "apt"
depends "rvm"
depends "nodejs"
depends "nginx"
depends "postgresql"
depends "java"

supports "ubuntu"
supports "debian"
