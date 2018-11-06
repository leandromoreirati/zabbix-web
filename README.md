![alt tag](https://assets.zabbix.com/img/logo.svg)

Container com instalação do frontend do Zabbix.
# NOTAS DE VERSÃO
 °  Versão 1.0 - 15/07/2018 ==> Criação do Dockerfile e do Docker composse.\
 °  Versão 1.1 - 30/08/2018 ==> Atualizacao da versão do Zabbix Server.\
 °  Versão 1.2 - 05/10/2018 ==> Configuração da idioma Portugues.

# PRÉ-REQUISITO
Os pre-requisitos necessários para execução da stack de serviço:
 1) Docker Instalado e configurado.
 2) Docker Swarm configurado.

# INSTALANDO E CONFIGURANDO DOCKER
 curl -fsSL https://get.docker.com | bash

# INSTALANDO DOCKER SWARM
 docker swarm init --advertise-addr  <IP_DO_SERVIDOR>

 Onde:\
 <IP_DO_SERVIDOR> deve ser substituído pelo ip do seu servidor.

# BAIXANDO AS IMAGENS
 docker pull leandromoreirajfa/zabbix-web:1.2
                                                 
# SERVIÇO ZABBIX SERVER
Para configurar o serviço do Zabbix Server, editar o arquivo server.config que localiza-se no diretório configs, alterando as variáveis:

PGSQL_HOST=<IP_DO_SERVIDOR>\
PGSQL_ZABBIX_USER=<USUARIO_ZABBIX>\
PGSQL_ZABBIX_BD=<ZABBIX_DATABASE>\
PGSQL_ZABBIX_PASS=<SENHA_ZABBIX_USER>\
ZABBIX_HOST=zabbix-server-pgsql\
APACHE_VHOST=<FDQN_VIRTUAL_HOST_APACHE>\
APACHE_SRV_ADMIN=<EMAIIL_SERVER_ADMIN>\
TZ=America/Sao_Paulo\
CERT_FILE=<NOME_ARQUIVO_CERTIFICADO>\
CERT_KEY=<NOME_ARQUIVO_KEY>

# INICIANDO O SERVICO
 docker stack deploy -c docker-compose.yml zabbix-web
