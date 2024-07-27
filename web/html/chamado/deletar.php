<?php

// author:      luciano dos santos
// contact:     https://www.linkedin.com/in/luciano-dos-santos-satiro
// created:     23/06/2023
// revision:    25/07/2024
// rule 1:      sem acento
// rule 2:      restante em minusculo
// description: deleta chamados tecnicos no banco de dados

// inclui arquivo de configuracao:
include('/opt/config.php');

$CON = GETCON();

// corrigi erros de portugues:
mysqli_query($CON, "SET NAMES 'utf8'") or die("[error] no sql: 1");
mysqli_query($CON, 'SET character_set_connection=utf8') or die("[error] no sql: 2");
mysqli_query($CON, 'SET character_set_client=utf8') or die("[error] no sql: 3");
mysqli_query($CON, 'SET character_set_results=utf8') or die("[error] no sql: 4");

// dados para deletar no mysql:
$T = "registro_tb";
$A1 = $_POST['Id2'];
$CMD = "DELETE FROM $T WHERE Id = '$A1'";

// executa operacao:
mysqli_query($CON, $CMD) or die("Erro ao tentar deletar dados no banco de dados...");
echo "O chamado foi deletado com sucesso!<br>";
echo "<a href='consultar.php'>Clique aqui para voltar</a><br>";

// encerra conexao com o mysql:
mysqli_close($CON);
?>
