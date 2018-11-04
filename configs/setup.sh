#!/bin/bash
set -x
mv /etc/apache2/sites-available/site.conf /etc/apache2/sites-available/$APACHE_VHOST.conf

sed -i 's/$APACHE_VHOST/'$APACHE_VHOST'/g'            	          /etc/apache2/apache2.conf
sed -i 's/$HTTP_PORT/'$HTTP_PORT'/g'                              /etc/apache2/ports.conf
sed -i 's/$HTTPS_PORT/'$HTTPS_PORT'/g'                            /etc/apache2/ports.conf

sed -i 's/$APACHE_VHOST/'$APACHE_VHOST'/g'            	          /etc/apache2/sites-available/$APACHE_VHOST.conf
sed -i 's/$APACHE_SRV_ADMIN/'$APACHE_SRV_ADMIN'/g'       	  /etc/apache2/sites-available/$APACHE_VHOST.conf
sed -i 's/$HTTP_PORT/'$HTTP_PORT'/g'                              /etc/apache2/sites-available/$APACHE_VHOST.conf
sed -i 's/$CERT_FILE/'$CERT_FILE'/g'                              /etc/apache2/sites-available/$APACHE_VHOST.conf
sed -i 's/$CERT_KEY/'$CERT_KEY'/g'                                /etc/apache2/sites-available/$APACHE_VHOST.conf

sed -i 's|$TZ|'$TZ'|g'                                            /etc/php/7.0/apache2/php.ini
sed -i 's/$MAX_EXECUTION_TIME/'$MAX_EXECUTION_TIME'/g'            /etc/php/7.0/apache2/php.ini
sed -i 's/$MEMORY_LIMIT/'$MEMORY_LIMIT'/g'                        /etc/php/7.0/apache2/php.ini
sed -i 's/$POST_MAX_SIZE/'$POST_MAX_SIZE'/g'                      /etc/php/7.0/apache2/php.ini
sed -i 's/$UPLOAD_MAX_FILESIZE/'$UPLOAD_MAX_FILESIZE'/g'          /etc/php/7.0/apache2/php.ini

sed -i 's|$PGSQL_HOST|'$PGSQL_HOST'|g'                            /etc/zabbix/web/zabbix.conf.php 
sed -i 's|$PGSQL_ZABBIX_BD|'$PGSQL_ZABBIX_BD'|g'                  /etc/zabbix/web/zabbix.conf.php 
sed -i 's|$PGSQL_ZABBIX_USER|'$PGSQL_ZABBIX_USER'|g'             /etc/zabbix/web/zabbix.conf.php 
sed -i 's|$PGSQL_ZABBIX_PASS|'$PGSQL_ZABBIX_PASS'|g'              /etc/zabbix/web/zabbix.conf.php 

# ARQUIVO DE CONFIGURACAO INTERFACE WEB
$(which rm) -fv /usr/share/zabbix/conf/zabbix.conf.php
$(which ln) -s /etc/zabbix/web/zabbix.conf.php /usr/share/zabbix/conf/

# REMOVENDO ARQUIVO CONFIGURACAO DO VHOST
$(which rm) -fv /etc/apache2/conf-enabled/zabbix.conf

# HABILITANDO SSL
$(which a2enmod) ssl

# CONFIGURANDO VIRTUAL HOSTS
$(which a2ensite) $APACHE_VHOST.conf

# INICIANDO O APACHE
$(which service) apache2 start && bash
set +x
