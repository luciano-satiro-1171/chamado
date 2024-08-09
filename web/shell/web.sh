#!/bin/bash

# author:      luciano dos santos
# contact:     https://www.linkedin.com/in/luciano-dos-santos-satiro
# created:     27/07/2024
# revision:    27/07/2024
# rule 1:      sem acento
# rule 2:      variaveis em maiusculo
# rule 3:      funcoes em maiusculo
# rule 4:      restante em minusculo
# description: instala servidor web no ubuntu

# variaveis:
LOG="./web.log"
LISTA="apache2 libapache2-mod-php php-mysql"

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

# instala pacotes:
for PACOTE in $LISTA; do
	apt-get -y install "$PACOTE"
        IF_ELSE "$PACOTE foi instalado" "$PACOTE nao foi instalado"
done

# reinicia o apache2:
systemctl restart apache2.service
    IF_ELSE "apache2 reiniciado" "apache2 nao reiniciado"

# habilita o apache2:
systemctl enable apache2.service
    IF_ELSE "apache2 habilitado" "apache2 nao habilitado"
