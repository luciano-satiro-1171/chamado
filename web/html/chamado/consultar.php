<?php

// author:      luciano dos santos
// contact:     https://www.linkedin.com/in/luciano-dos-santos-satiro
// created:     23/06/2023
// revision:    25/07/2024
// rule 1:      sem acento
// rule 2:      restante em minusculo
// description: consulta chamados tecnicos no banco de dados

// inclui arquivo de configuracao:
include('/opt/config.php');

$CON = GETCON();

// corrigi erros de portugues:
mysqli_query($CON, "SET NAMES 'utf8'") or die("[error] no sql: 1");
mysqli_query($CON, 'SET character_set_connection=utf8') or die("[error] no sql: 2");
mysqli_query($CON, 'SET character_set_client=utf8') or die("[error] no sql: 3");
mysqli_query($CON, 'SET character_set_results=utf8') or die("[error] no sql: 4");

// armazena tabela:
$T = "registro_tb";
$CMD = mysqli_query($CON, "SELECT * FROM $T") or die("[error] ao consultar o banco de dados");

// atualiza a pagina a cada 60 segundos automaticamente:
header("Refresh:60");
?>

<!DOCTYPE html>
<html>
   <head>
      <!-- metadados -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

      <!-- favicon da pagina -->
      <link rel="shortcut icon" type="image/x-icon" href="./robot_favicon.ico">

      <!-- titulo da pagina -->
      <title>Suporte aos Usuários do BEsCom</title>

      <!-- design da pagina -->
      <style>
         body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
         }

         .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
         }

         h2 {
            margin-top: 0;
         }

         form {
            margin-bottom: 20px;
         }

         label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
         }

         input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
         }

         input[type="submit"] {
            background-color: #3b16b6;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
         }

         input[type="submit"]:hover {
            background-color: #5846ca;
         }
      </style>
   </head>

   <body>
      <form name="consulta" action="deletar.php" method="post" accept-charset='utf-8'>
         <fieldset>
            <legend>Suporte aos Usuários do BEsCom</legend>

            <h3>Consulta dos Chamados Técnicos do BEsCom</h3>

            <label>Obs.: está página recarrega automaticamente a cada 1 minuto.</label><br><br>

            <label>Digite o id que deseja deletar:</label>
            <input type="text" name="Id2" size="10" placeholder="nº do id" required autofocus />

            <!-- botao para deletar um linha -->
            <input type="submit" name="submit" value="Deletar" /><br><br>

            <table border="1">
               <tr>
                  <th>id</th>
                  <th>seção</th>
                  <th>p/g</th>
                  <th>nome de guerra</th>
                  <th>ramal</th>
                  <th>telefone</th>
                  <th>descrição do ocorrido</th>
                  <th>data</th>
               </tr>

               <?php while($X = mysqli_fetch_assoc($CMD)) { ?>

               <tr>
                  <td><?php echo htmlspecialchars($X['Id']); ?></td>
                  <td><?php echo htmlspecialchars($X['Secao']); ?></td>
                  <td><?php echo htmlspecialchars($X['Graduacao']); ?></td>
                  <td><?php echo htmlspecialchars($X['Nome']); ?></td>
                  <td><?php echo htmlspecialchars($X['Ramal']); ?></td>
                  <td><?php echo htmlspecialchars($X['Telefone']); ?></td>
                  <td><?php echo htmlspecialchars($X['Descricao']); ?></td>
                  <td><?php echo htmlspecialchars($X['Data']); ?></td>
               </tr>

               <?php } ?>
            </table>
         </form>
      </fieldset>
   </body>
</html>

<?php
// encerra conexao com mysql:
mysqli_close($CON);
?>
