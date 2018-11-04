<?php
// Zabbix GUI configuration file.
global $DB, $HISTORY;

$DB['TYPE']     = 'POSTGRESQL';
$DB['SERVER']   = '$PGSQL_HOST';
$DB['PORT']     = '0';
$DB['DATABASE'] = '$PGSQL_ZABBIX_BD';
$DB['USER']     = '$PGSQL_ZABBIX_USER';
$DB['PASSWORD'] = '$PGSQL_ZABBIX_PASS';

// Schema name. Used for IBM DB2 and PostgreSQL.
$DB['SCHEMA'] = '';

$ZBX_SERVER      = 'zabbix-server-pgsql';
$ZBX_SERVER_PORT = '10051';
$ZBX_SERVER_NAME = '';

$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;

// Elasticsearch url (can be string if same url is used for all types).
$HISTORY['url']   = 'http://elasticsearch:9200';

// Value types stored in Elasticsearch.
$HISTORY['types'] = ['uint', 'text', 'dbl', 'str', 'log'];

?>
