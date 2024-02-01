// Bônus:
// 3) Qual a ordem dos prints no console?
// 1°) A função é: c
// 2°) A função é: d
// 4) Existe algum erro nesse código? Se sim, comente sobre?
// Sim. Partindo do princípio que o objetivo do código era exibir todos os alerts, consigo identificar dois erros principais e uma recomendação no código: 

// O primeiro erro trata-se da função b, que tem retorno antecipado impedindo a execução da função alertUser('b');

// O segundo erro encontra-se na função d, que não resolve/finaliza a Promise, impedindo que a função a execute a função alertUser("a"); e

// A recomendação seria de realizar a chamada da função resolve() somente depois que a execução de toda a lógica assíncrona da Promise for concluída.

// Para consertar o código, é necessário incluir alterar o retorno da função b para depois do chamamento da função alertUser('b'). Também é preciso chamar a função resolve()
// dentro das Promises das funções c e d, somente depois da lógica da função. Com essas alterações a ordem dos prints no console ficaria:
// 1°) "A função é: b"
// 2°) "A função é: c"
// 3°) "A função é: d"
// 4°) "A função é: a"

// Abaixo segue o código refatorado:
async function a() {
    b();
    await c();
    await d();
    alertUser("a");
}
a();

function b(){
    alertUser('b');
    return;
}

function c(){
    return new Promise((resolve) => {
        alertUser('c');
        resolve();
    });
}

function d(){
    return new Promise((resolve) => {
        alertUser('d');
        resolve();
    });
}

function alertUser(message){
    console.log('A função é: ' + message);
}