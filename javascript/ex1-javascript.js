// 1) Percorra o objeto clientes e mostre o nome da cada cliente da seguinte maneira:
// “ultimoSobrenome, primeiroNome”;

var clientes = [
    {
        "id": 1,
        "nome": "Luis Santos Silveira",
        "idade": 18
    },
    {
        "id": 2,
        "nome": "Ricardo Lopes Alves",
        "idade": 30
    },
    {
        "id": 3,
        "nome": "Gustavo Silva Junior",
        "idade": 26
    }
];

function exibeUltimoSobrenomeEPrimeiroNome(nome) {
    // Usando o method split, crio um vetor com os nomes separando-os quando houver um espaço
    var separaNomes = nome.split(' ');

    // O nome que estiver posicionado na posição 0 do vetor é o primeiro nome
    var primeiroNome = separaNomes[0];

    // O nome que estiver posicionado na última posição do vetor é o último sobrenome.
    // Para isso, utilizei o número que representa o tamanho total do sobrenome com o método length e subtrai 1, para chegar ao último valor do vetor
    var ultimoSobrenome = separaNomes[separaNomes.length - 1];

    console.log(ultimoSobrenome + ", " + primeiroNome);
}

function main() {
    // Utilizo o método forEach, para chamar a função para cada elemento do array 
    clientes.forEach(cliente => {
        
        // A função recebe o atributo nome do cliente por parâmetro
        exibeUltimoSobrenomeEPrimeiroNome(cliente.nome);
    });
}

main();
