// 2) Formate a variável “numero” para o seguinte formato: “(XX)_X_XXXX-XXXX”

var numero = "5(1)9-876-543-21";

function exibeNumeroFormatadoConformePadrao(numero) {
    // Utilizo o método replace para substituir todos os caracteres que não forem números passando como parâmetro a expressão regex /\D/g
    var apenasNumeros = numero.replace(/\D/g, '');

    // Para formatar o número da maneira esperada optei por fazer sucessivas concatenações com trechos específicos da string, utilizando o método substring 
    var numeroFormatado = "(" + apenasNumeros.substring(0, 2) + ") " + apenasNumeros.substring(2, 3) + " " + apenasNumeros.substring(3, 7) + "-" + apenasNumeros.substring(7);
    
    console.log(numeroFormatado);
}

function main() {
    exibeNumeroFormatadoConformePadrao(numero);
}

main();
