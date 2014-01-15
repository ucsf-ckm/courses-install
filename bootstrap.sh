#!/bin/sh

$PUPPET_DIR=/vagrant

/usr/bin/gem query | /bin/grep librarian-puppet || /usr/bin/gem install librarian-puppet

cd $PUPPET_DIR
/usr/bin/librarian-puppet install

/usr/bin/puppet apply --modulepath=$PUPPET_DIR/modules/ $PUPPET_DIR/manifests/dev.pp