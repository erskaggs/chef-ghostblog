name             'ghostblog'
maintainer       'Eric Skaggs'
maintainer_email 'ericskaggs@gmail.com'
license          'Apache 2.0'
description      'Installs & configures Ghost Blog'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.1'

%w( ubuntu ).each do |os|
    supports os
end

depends 'nodejs', '~> 2.4.0'
