#!/bin/sh

/bin/touch /etc/puppet/hiera.yaml

/usr/bin/gem query | /bin/grep librarian-puppet || /usr/bin/gem install librarian-puppet --no-rdoc --no-ri

PUPPET_DIR=/vagrant
cd $PUPPET_DIR

/usr/bin/librarian-puppet install

/usr/bin/puppet apply --modulepath=$PUPPET_DIR/modules/ $PUPPET_DIR/manifests/dev.pp
