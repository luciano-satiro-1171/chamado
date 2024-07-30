#!/bin/bash

# author:      luciano dos santos
# contact:     https://www.linkedin.com/in/luciano-dos-santos-satiro
# created:     27/07/2024
# revision:    30/07/2024
# rule 1:      sem acento
# rule 2:      variaveis em maiusculo
# rule 3:      funcoes em maiusculo
# rule 4:      restante em minusculo
# description: instala servidor mysql no ubuntu

# variaveis:
LOG="./db.log"
LISTA="mysql-server"
PASS="vagrant"
USER="chamado"
PASS_USER="chamado123"

# funcoes:
# evita repeticao do if e else:
IF_ELSE() {
        if [ $? -eq 0 ]; then
                echo "[success] $1" >> $LOG
        else
                echo "[error] $2" >> $LOG
                return 1
        fi
}

# operacoes:
# verifica se o script esta sendo executado como root:
test "$(id -u)" -eq 0
	IF_ELSE "executado como root" "nao executado como root" || exit 1

# pre-configura o mysql:
debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASS"
    IF_ELSE "root_password configurado" "root_password nao configurado"

debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASS"
    IF_ELSE "root_password_again configurado" "root_password_again nao configurado"

# instala pacotes:
for PACOTE in $LISTA; do
	apt-get -y install "$PACOTE"
        IF_ELSE "$PACOTE foi instalado" "$PACOTE nao foi instalado"
done

# configuracoes do banco de dados:
echo "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = 'chamado');" | mysql -u root -p"$PASS" | tail -n1 | grep -q 1 || echo "CREATE USER 'chamado'@'%' IDENTIFIED BY 'chamado123';" | mysql -u root -p"$PASS"
    IF_ELSE "usuario criado" "usuario nao criado"

echo "CREATE DATABASE IF NOT EXISTS chamado_db;" | mysql -u root -p"$PASS"
    IF_ELSE "banco de dados criado" "banco de dados nao criado"

echo "GRANT ALL PRIVILEGES ON chamado_db.* TO 'chamado'@'%';" | mysql -u root -p"$PASS"
    IF_ELSE "privilegios alterado" "privilegios nao alterado"

echo "FLUSH PRIVILEGES;" | mysql -u root -p"$PASS"
    IF_ELSE "privilegios atualizados" "privilegios nao atualizados"

echo "USE chamado_db; CREATE TABLE IF NOT EXISTS registro_tb (
Id SMALLINT AUTO_INCREMENT PRIMARY KEY,
Secao VARCHAR(25) NOT NULL,
Graduacao VARCHAR(15) NOT NULL,
Nome VARCHAR(50) NOT NULL,
Ramal VARCHAR(25),
Telefone VARCHAR(25),
Descricao VARCHAR(15000) NOT NULL,
Data timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);" | mysql -u $USER -p"$PASS_USER"
    IF_ELSE "tabela criada" "tabela nao criada"

# permitir acesso remoto:
sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address\ =\ 0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
    IF_ELSE "acesso remoto permitido" "acesso remoto nao permitido"

# reinicia o mysql:
systemctl restart mysql.service
    IF_ELSE "mysql reiniciado" "mysql nao reiniciado"

# habilita o mysql:
systemctl enable mysql.service
    IF_ELSE "mysql habilitado" "mysql nao habilitado"
