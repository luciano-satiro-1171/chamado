#!/bin/bash

# author:      luciano dos santos
# contact:     https://www.linkedin.com/in/luciano-dos-santos-satiro
# created:     09/03/2024
# revision:    25/07/2024
# rule 1:      sem acento
# rule 2:      variaveis em maiusculo
# rule 3:      funcoes em maiusculo
# rule 4:      restante em minusculo
# description: comandos de pos-instalacao para o ubuntu 16.04 usando o vagrant

# variaveis:
LOG="./script.log"
LISTA="language-pack-pt"

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
sudo sed -i 's/deb\ http:\/\/archive.ubuntu.com\/ubuntu/deb\ http:\/\/br.archive.ubuntu.com\/ubuntu/g' /etc/apt/sources.list
	IF_ELSE "sources.list alterado" "sources.list nao alterado"

# atualiza repositorios e pacotes:
sudo apt-get -y update
	IF_ELSE "em update" "em update"

sudo apt-get -y upgrade
	IF_ELSE "em upgrade" "em upgrade"

# instala pacotes:
for PACOTE in $LISTA; do
        sudo apt-get -y install $PACOTE
                IF_ELSE "$PACOTE foi instalado" "$PACOTE nao foi instalado"
done

# altera o idioma:
sudo locale-gen pt_BR.UTF-8
	IF_ELSE "idioma alterado" "idioma nao alterado"

# altera o timezone:
timedatectl set-timezone "America/Sao_Paulo"
	IF_ELSE "timezone alterado" "timezone nao alterado"
