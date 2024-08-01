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
1. Certifique-se de ter o Git, Vagrant e o VirtualBox instalados na sua máquina.

2. Certifique-se de ter uma imagem do Ubuntu Server 16.04 compatível com o Vagrant.

3. Dica para baixar a imagem do Ubuntu Server 16.04:
- `wget https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-vagrant.box`
- Adicione ao Vagrant a imagem baixada:
- `vagrant box add xenial-server-cloudimg-amd64-vagrant.box --name xenial-server-cloudimg-amd64-vagrant`
- Verifique se a imagem foi adicionada:
- `vagrant box list`

4. Clone este repositório para a sua máquina local (Exemplo):
- `git clone https://github.com/luciano-satiro-1171/chamado.git`

5. Abra 2 terminais. O 1º é para o banco de dados e o 2º para a página web.
- Termina 1 (db):
- `cd chamado/db/`
- Terminal 2 (web):
- `cd chamado/web/`

6. Verifique 2 IPs livres na sua rede. Então faça ajustes de endereço ip nos arquivos:
- Terminal 1 (db):
- `nano Vagrantfile` # para salvar e sair: Ctrl + O depois Ctrl + X
- Terminal 2 (web):
- `nano Vagrantfile` # para salvar e sair: Ctrl + O depois Ctrl + X
- `nano conf/config.php` # para salvar e sair: Ctrl + O depois Ctrl + X

7. Inicie o banco de dados:
- Terminal 1 (db):
- `vagrant up`
- Aguarde o banco de dados terminar de iniciar.

8. Acesse a VM do banco de dados:
- Terminal 1 (db):
- `vagrant ssh`

9. Verifique os arquivos de log do banco de dados:
- Terminal 1 (db):
- `cat script.log`
- `cat db.log`

10. Inicie a página web:
- Terminal 2 (web):
- `vagrant up`
- Aguarde a página web terminar de iniciar.

11. Acesse a VM da página web:
- Terminal 2 (web):
- `vagrant ssh`

12. Verifique os arquivos de log da página web:
- Terminal 2 (web):
- `cat script.log`
- `cat web.log`

13. Agora abra o seu browser e acesse os seguintes endereços:
- `http://<ip_da_pagina_web>/chamado/index.html`
- `http://<ip_da_pagina_web>/chamado/consultar.php`

14. Para parar as máquinas virtuais, execute: `vagrant halt`

15. Para destruir as máquinas virtuais, execute: `vagrant destroy`

## Contribuição
Contribuições são sempre bem-vindas! Se você quiser contribuir para este projeto, siga estas etapas:
1. Fork o projeto.
2. Crie uma nova branch (`git checkout -b feature/nova-feature`).
3. Faça commit das suas alterações (`git commit -am 'Adicione uma nova feature'`).
4. Faça push para a branch (`git push origin feature/nova-feature`).
5. Abra um Pull Request.

## Licença
Este projeto está licenciado sob a [Licença MIT](https://opensource.org/licenses/MIT).

## Imagens do Projeto
![index](https://github.com/user-attachments/assets/4e496b51-e6b8-4bf8-8619-fdbcbbed2e86)
![consultar](https://github.com/user-attachments/assets/ccb5b59b-3c4f-49d6-92e1-ef2111aa4b01)
