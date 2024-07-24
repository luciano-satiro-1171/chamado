#!/bin/bash

# author:      luciano dos santos
# contact:     https://www.linkedin.com/in/luciano-dos-santos-satiro
# created:     31/01/2024
# revision:    24/07/2024
# rule 1:      sem acento
# rule 2:      variaveis em maiusculo
# rule 3:      funcoes em maiusculo
# rule 4:      restante em minusculo
# description: atualiza diretorio local e repositorio do github

# variaveis:
LOG="./git.log"

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

SAIDA() {
	clear
		cat ./git.log
			rm -f ./git.log
}

# operacoes:
# passo 1:
git add .
	IF_ELSE "git add" "git add" || exit 1

# passo 2:
git commit -m "default comment"
	IF_ELSE "git commit" "git commit" || exit 1

# passo 3:
git push
	IF_ELSE "git push" "git push" && SAIDA && exit 0

# passo 4:
eval "$(ssh-agent -s)"
	IF_ELSE "ssh-agent -s" "ssh-agent -s" || exit 1

# passo 5:
ssh-add ~/.ssh/id_ed25519
	IF_ELSE "ssh-add" "ssh-add" || exit 1

# passo 6:
git push
	IF_ELSE "git push" "git push" && SAIDA
