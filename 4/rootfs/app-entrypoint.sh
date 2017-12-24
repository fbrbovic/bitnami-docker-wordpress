#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "/init.sh" ]]; then
  . /init.sh
  nami_initialize apache php mysql-client wordpress
  info "Starting wordpress... "
fi

if ! grep -q ioncube /bitnami/php/conf/php.ini; then
    # install
    # after install add ioncube
    echo "zend_extension = /opt/bitnami/php/lib/php/extensions/ioncube_loader_lin_7.0.so" >> /bitnami/php/conf/php.ini
fi


exec tini -- "$@"
