#!/bin/bash

# author:      luciano dos santos
# contact:     https://www.linkedin.com/in/luciano-dos-santos-satiro
# created:     31/01/2024
# revision:    24/07/2024
# rule 1:      sem acento
# rule 2:      variaveis em maiusculo
# rule 3:      funcoes em maiusculo
# rule 4:      restante em minusculo
# description: faz upload do projeto local para o github

# variaveis:

# funcoes:
# evita repeticao do if e else:
IF_ELSE() {
        if [ $? -eq 0 ]; then
                LOG=$(echo -e "$LOG\n[success] $1")
        else
                LOG=$(echo -e "$LOG\n[error] $2")
                return 1
        fi
}

# imprimir:
IMPRIMIR() {
    clear
        LOG=$(printf "%s\n" "$LOG" | sed '/^[[:space:]]*$/d')
            printf "%s\n" "$LOG"
}

# operacoes:
# verifica se existe arquivo para upload:
git status | grep -qw "nothing to commit, working tree clean"
	IF_ELSE "nao existe arquivo para upload" "existe arquivo para upload" && IMPRIMIR && exit 0

# adiciona arquivo para a lista de upload:
git add .
	IF_ELSE "git add" "git add"

# cria um comentario antes de fazer upload:
git commit -m "default comment"
	IF_ELSE "git commit" "git commit"

# executa o upload propriamente dito:
git push
	IF_ELSE "git push" "git push" && IMPRIMIR && exit 0

# inicia o agente do ssh:
eval "$(ssh-agent -s)"
	IF_ELSE "ssh-agent -s" "ssh-agent -s"

# adiciona a chave ssh:
ssh-add ~/.ssh/id_ed25519
	IF_ELSE "ssh-add" "ssh-add"

# executa o upload propriamente dito:
git push
	IF_ELSE "git push" "git push" ; IMPRIMIR
