# chamado

## Descrição do Projeto
O "chamado" é um projeto que demonstra como configurar ambientes virtuais utilizando Vagrant.
O objetivo é criar uma página web onde os usuários possam solicitar suporte à informática.
Este projeto foi desenvolvido com base na minha experiência anterior no quartel.

## Funcionalidades
- Cria 2 máquinas virtuais usando Vagrant e VirtualBox.
- Sincroniza os diretórios locais com os diretórios dentro das máquinas virtuais onde ficam os arquivos.
- Faz ajustes iniciais no Ubuntu Server 16.04 usando shell script.
- Instala e configura um servidor web e um servidor de banco de dados usando shell scripts.

## Como Usar
1. Certifique-se de ter o Git, Vagrant e o VirtualBox instalados na sua máquina.
2. Certifique-se de ter uma imagem do Ubuntu Server 16.04 para o Vagrant: `wget https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-vagrant.box` depois `vagrant box add xenial-server-cloudimg-amd64-vagrant.box --name xenial-server-cloudimg-amd64-vagrant` depois `vagrant box list`.
3. Clone este repositório para a sua máquina local: `git clone https://github.com/luciano-satiro-1171/chamado.git`.
4. Acesse o projeto: `cd chamado/`.
5. Faça ajuste de endereço ip conforme a sua rede: `nano db/Vagrantfile` depois `nano web/Vagrantfile` depois `nano web/conf/config.php`
6. Inicie o banco de dados: `cd db/` depois `vagrant up`.
7. Inicie a página web: `cd ../web/` depois `vagrant up`.
8. Acesse a máquina web: `vagrant ssh`.
9. Verifique o arquivo de log: `cat script.log` depois `cat web.log`.
10. Acesse a máquina do banco de dados: `cd ../db/` `vagrant ssh`.
11. Verifique o arquivo de log: `cat script.log` depois `cat db.log`.
12. Para parar as máquinas virtuais, execute `vagrant halt`.
13. Para destruir as máquinas virtuais, execute `vagrant destroy`.

## Contribuição
Contribuições são sempre bem-vindas! Se você quiser contribuir para este projeto, siga estas etapas:
1. Fork o projeto.
2. Crie uma nova branch (`git checkout -b feature/nova-feature`).
3. Faça commit das suas alterações (`git commit -am 'Adicione uma nova feature'`).
4. Faça push para a branch (`git push origin feature/nova-feature`).
5. Abra um Pull Request.

## Licença
Este projeto está licenciado sob a [Licença MIT](https://opensource.org/licenses/MIT).
