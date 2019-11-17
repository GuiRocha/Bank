# language: pt

Cenário: Deu ruim não tenho saldo
    Dado que eu tenho R$ 0 em minha conta corrente
    Quando faço um saque de R$ 100
    Então vejo a mensagem "Saldo insuficiente para saque :("
    E meu saldo final deve ser R$ 0

Cenário: Tenho saldo mas não o suficiente
    Dado que eu tenho R$ 500 em minha conta corrente
    Quando faço um saque de R$ 501
    Então vejo a mensagem "Saldo insuficiente para saque :("
    E meu saldo final deve ser R$ 500
    
Cenário: Limite por saque :(
    Dado que eu tenho R$ 1000 em minha conta corrente
    Quando faço um saque de R$ 701
    Então vejo a mensagem "Limite máximo por saque é de R$ 700"
    E meu saldo final deve ser R$ 1000