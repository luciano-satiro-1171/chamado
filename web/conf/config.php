<?php

// author:      luciano dos santos
// contact:     https://www.linkedin.com/in/luciano-dos-santos-satiro
// created:     23/06/2023
// revision:    25/07/2024
// rule 1:      sem acento
// rule 2:      restante em minusculo
// description: arquivo de configuracao para acesso ao banco de dados

// conexao com o mysql:
define('H', '192.168.10.50');
define('U', 'chamado');
define('P', 'chamado123');
define('D', 'chamado_db');

// funcao para conectar ao banco de dados:
function GETCON() {
$CON = mysqli_connect(H, U, P, D);
	if (!$CON) {
		die("[error] ao conectar-se com o banco de dados: " . mysqli_connect_error());
	}
	return $CON;
}
?>
