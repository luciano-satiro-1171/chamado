# chamado

## Descrição do Projeto
O "chamado" é um projeto que demonstra como configurar ambientes virtuais utilizando Vagrant.
O objetivo é criar uma página web onde os usuários possam solicitar suporte à informática.
Este projeto foi desenvolvido com base na minha experiência anterior no quartel.

## Funcionalidades
- Cria 2 máquinas virtuais usando Vagrant e VirtualBox.
- Sincroniza os diretórios locais com os diretórios dentro das máquinas virtuais onde ficam os arquivos.
- Faz ajustes iniciais no Ubuntu Server 16.04 usando Shell Script.
- Instala e configura um servidor web e um servidor de banco de dados usando Shell Scripts.

## Como Usar
Certifique-se de ter o Git, Vagrant e o VirtualBox instalados na sua máquina.
Certifique-se de ter uma imagem do Ubuntu Server 16.04 compatível com o Vagrant.

Dica para baixar a imagem do Ubuntu Server 16.04:
`wget https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-vagrant.box`
Adicione ao Vagrant a imagem baixada:
`vagrant box add xenial-server-cloudimg-amd64-vagrant.box --name xenial-server-cloudimg-amd64-vagrant`
Verifique se a imagem foi adicionada:
`vagrant box list`

Clone este repositório para a sua máquina local (exemplo):
`git clone https://github.com/luciano-satiro-1171/chamado.git`

Abra 2 terminais. O 1º é para o banco de dados e o 2º para a página web.
Termina 1 (db):
`cd chamado/db/`
Terminal 2 (web):
`cd chamado/web/`

Verifique 2 IPs livres na sua rede. Então faça ajustes de endereço ip nos arquivos:
Termina 1 (db):
`nano Vagrantfile` # para salvar e sair: Ctrl + O depois Ctrl + X
Termina 2 (web):
`nano Vagrantfile` # para salvar e sair: Ctrl + O depois Ctrl + X
`nano conf/config.php` # para salvar e sair: Ctrl + O depois Ctrl + X

Inicie o banco de dados:
Terminal 1 (db):
`vagrant up`
Aguarde o banco de dados terminar de iniciar.
Acesse a VM do banco de dados:
Terminal 1 (db):
`vagrant ssh`
Verifique os arquivos de log do banco de dados:
Terminal 1 (db):
`cat script.log`
`cat db.log`

Inicie a página web:
Terminal 2 (web):
`vagrant up`
Aguarde a página web terminar de iniciar.
Acesse a VM da página web:
Terminal 2 (web):
`vagrant ssh`
Verifique os arquivos de log da página web:
Terminal 2 (web):
`cat script.log`
`cat web.log`

Agora abra o seu browser e acesse os seguintes endereços:
`http://<ip_da_pagina_web>/chamado/index.html`
`http://<ip_da_pagina_web>/chamado/consultar.php`

Para parar as máquinas virtuais, execute: `vagrant halt`
Para destruir as máquinas virtuais, execute: `vagrant destroy`

## Contribuição
Contribuições são sempre bem-vindas! Se você quiser contribuir para este projeto, siga estas etapas:
1. Fork o projeto.
2. Crie uma nova branch (`git checkout -b feature/nova-feature`).
3. Faça commit das suas alterações (`git commit -am 'Adicione uma nova feature'`).
4. Faça push para a branch (`git push origin feature/nova-feature`).
5. Abra um Pull Request.

## Licença
Este projeto está licenciado sob a [Licença MIT](https://opensource.org/licenses/MIT).
