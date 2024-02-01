<!--
    3) Faça a ordenação e impressão da estrutura $arrayDeClientes resultante do exercício
    2 pela data de nascimento (pode ser ascendente ou descendente).
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

    $arrayDeNascimento = [
        'Francisco Souza' => '10-12-1996',
        'Arthur Golveia' => '14-01-2000',
        'Guilherme Rosa' => '26-05-1985',
        'Marcelo Planalto' => '26-05-1985'
    ];

    // Percorre o array de clientes
    foreach ($arrayDeClientes as $cliente) {
        // Atribui o nome do cliente atual a variável $nomeCliente
        $nomeCliente = $cliente->nome;
    
        // Verifica se o nome do cliente é uma chave (key) no array de nascimento
        if (isset($arrayDeNascimento[$nomeCliente])) {
            // Se positivo, atribui a data de nascimento do cliente atual a propriedade dataNascimento
            $cliente->dataNascimento = $arrayDeNascimento[$nomeCliente];
        } else {
            // Se negativo, atribui a string 'Data não informada.' a propriedade dataNascimento
            $cliente->dataNascimento = 'Data não informada.';
        }
    }

    // Passa como argumento da função usort, o arrayDeClientes e uma função anônima que compara as datas de nascimento
    usort($arrayDeClientes, function ($cliente1, $cliente2) {
        // Retorna a diferença entre as datas de nascimento dos clientes
        // Se a diferença for positiva, $cliente1 é mais velho
        // Se a diferença for negativa, $cliente2 é mais velho
        // Se a diferença for zero, os clientes tem a mesma idade
        return strtotime($cliente1->dataNascimento) - strtotime($cliente2->dataNascimento);
    });

    // Percorre o array de clientes e imprime o nome e a data de nascimento
    foreach ($arrayDeClientes as $cliente) {
        echo ($cliente->nome . " nascido em " . $cliente->dataNascimento . "<br>");
    }

?>
