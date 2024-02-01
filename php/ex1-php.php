<!--
    1) Utilizando a variável $arrayDeClientes de um echo no nome do segundo cliente.
-->

<?php
	$nomes = ['Francisco Souza', 'Guilherme Rosa', 'Arthur Golveia'];
    
    $cliente1 = new stdClass();
    $cliente1->nome = $nomes[0];
    $cliente2 = new stdClass();
    $cliente2->nome = $nomes[1];
    $cliente3 = new stdClass();
    $cliente3->nome = $nomes[2];
    
    $arrayDeClientes = [$cliente1, $cliente2, $cliente3];
	
    // Acessa a propriedade nome do segundo cliente
    echo($arrayDeClientes[1]->nome);
?>