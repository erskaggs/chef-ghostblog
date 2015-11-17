name             'ghostblog'
maintainer       'Eric Skaggs'
maintainer_email 'ericskaggs@gmail.com'
license          'Apache 2.0'
description      'Installs & configures Ghost Blog'
version          '1.0.1'

%w( ubuntu ).each do |os|
    supports os
end

depends 'nodejs', '~> 2.4.0'
