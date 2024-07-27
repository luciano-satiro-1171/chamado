<?php

// author:      luciano dos santos
// contact:     https://www.linkedin.com/in/luciano-dos-santos-satiro
// created:     23/06/2023
// revision:    25/07/2024
// rule 1:      sem acento
// rule 2:      restante em minusculo
// description: registra chamados tecnicos no banco de dados

// inclui arquivo de configuracao:
include('/opt/config.php');

$CON = GETCON();

// dados para insercao no mysql:
$T = "registro_tb";
$A1 = $_POST['Secao'];
$A2 = $_POST['Graduacao'];
$A3 = $_POST['Nome'];
$A4 = $_POST['Ramal'];
$A5 = $_POST['Telefone'];
$A6 = $_POST['Descricao'];
$CMD = "INSERT INTO $T (Secao, Graduacao, Nome, Ramal, Telefone, Descricao) VALUES ('$A1', '$A2', '$A3', '$A4', '$A5', '$A6')";

// corrigi erro de portugues:
mysqli_query($CON, "SET NAMES 'utf8'") or die("[error] no sql: 1");
mysqli_query($CON, 'SET character_set_connection=utf8') or die("[error] no sql: 2");
mysqli_query($CON, 'SET character_set_client=utf8') or die("[error] no sql: 3");
mysqli_query($CON, 'SET character_set_results=utf8') or die("[error] no sql: 4");

// executa a operacao:
mysqli_query($CON, $CMD) or die("[error] ao tentar registrar dados no banco de dados...");
echo "O chamado foi registrado com sucesso!<br>";
echo "A equipe de informática atenderá sua demanda em breve.<br>";
echo "<a href='index.html'>Clique aqui para voltar</a><br>";

// encerra conexao com o mysql:
mysqli_close($CON);
?>
