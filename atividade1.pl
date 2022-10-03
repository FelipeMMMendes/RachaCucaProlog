/*

CIÊNCIA DE DADOS - INTELIGÊNCIA ARTIFICIAL

Aluno: FELIPE MARTINS MACHADO MENDES
RA: 22251506

Link problema -
https://rachacuca.com.br/logica/problemas/barraca-de-pastel/

30 campos para preencher

19 dicas
*/

%  %%%%%%BASE DE DADOS
%
%
%   CAMISETA

alldifferent([]).%define uma lista vazia (nenhum membro)
alldifferent([Elemento|Lista]):-
      not(member(Elemento,Lista)),% retorna TRUE se o elemento NÃO for membro da lista
      alldifferent(Lista).

%INICIAIS DAS VARIAVEIS TEM QUE SER MAIUSCULAS
modelo([
(Camiseta_1, Nome_1, Pastel_1, Condimento_1, Suco_1, Profissao_1),
(Camiseta_2, Nome_2, Pastel_2, Condimento_2, Suco_2, Profissao_2),
(Camiseta_3, Nome_3, Pastel_3, Condimento_3, Suco_3, Profissao_3),
(Camiseta_4, Nome_4, Pastel_4, Condimento_4, Suco_4, Profissao_4),
(Camiseta_5, Nome_5, Pastel_5, Condimento_5, Suco_5, Profissao_5)
]):-


%%%%DICAS ENVOLVENDO SOMENTE CAMISETA

camiseta(Camiseta_1),
camiseta(Camiseta_2),
camiseta(Camiseta_3),
camiseta(Camiseta_4),
camiseta(Camiseta_5),

%%O rapaz de Amarelo está em algum lugar à esquerda do rapaz de Branco.
((Camiseta_5==branca, (Camiseta_1==amarela; Camiseta_2==amarela; Camiseta_3==amarela; Camiseta_4==amarela));
 (Camiseta_4==branca, (Camiseta_3==amarela; Camiseta_2==amarela; Camiseta_1==amarela));
 (Camiseta_3==branca, (Camiseta_2==amarela; Camiseta_1==amarela));
 (Camiseta_2==branca, Camiseta_1==amarela)
),

alldifferent([Camiseta_1, Camiseta_2, Camiseta_3, Camiseta_4, Camiseta_5]),

%DICAS ENVOLVENDO SOMENTE CAMISETA E NOME

nome(Nome_1),
nome(Nome_2),
nome(Nome_3),
nome(Nome_4),
nome(Nome_5),

alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),

%DICAS ENVOLVENDO SOMENTE CAMISETA, NOME E PASTEL

pastel(Pastel_1),
pastel(Pastel_2),
pastel(Pastel_3),
pastel(Pastel_4),
pastel(Pastel_5),

% Quem vai comer um pastel de Carne está em algum lugar entre quem vai
% comer um pastel de Frango e quem vai comer um pastel de Calabresa,
% nessa ordem.

(
(Pastel_1==frango, (Pastel_2==carne; Pastel_3==carne; Pastel_4==carne),Pastel_5==calabresa);
(Pastel_1==frango, (Pastel_2==carne; Pastel_3==carne),Pastel_4==calabresa);
(Pastel_1==frango, Pastel_2==carne, Pastel_3==calabresa);
(Pastel_2==frango, (Pastel_3==carne; Pastel_4==carne), Pastel_5==calabresa);
(Pastel_2==frango, Pastel_3==carne, Pastel_4==calabresa);
(Pastel_3==frango, Pastel_4==carne, Pastel_5==calabresa)
),

%Na primeira posição está quem vai comer um pastel de Pizza.
(Pastel_1==pizza),

%Fabiano vai comer um pastel de Frango.
(
(Nome_1==fabiano, Pastel_1==frango);
(Nome_2==fabiano, Pastel_2==frango);
(Nome_3==fabiano, Pastel_3==frango);
(Nome_4==fabiano, Pastel_4==frango);
(Nome_5==fabiano, Pastel_5==frango)
),

%  Rubens está exatamente a direita de quem pediu um pastel de Queijo.
(
(Pastel_1==queijo, Nome_2==rubens);
(Pastel_2==queijo, Nome_3==rubens);
(Pastel_3==queijo, Nome_4==rubens);
(Pastel_4==queijo, Nome_5==rubens)),


alldifferent([Pastel_1, Pastel_2, Pastel_3, Pastel_4, Pastel_5]),

%DICAS ENVOLVENDO SOMENTE CAMISETA, NOME, PASTEL E CONDIMENTO
condimento(Condimento_1),
condimento(Condimento_2),
condimento(Condimento_3),
condimento(Condimento_4),
condimento(Condimento_5),

%Na quarta posição está o cliente que gosta de Mostarda.

(Condimento_4==mostarda),

%Quem gosta de Maionese está em algum lugar entre quem gosta de Pimenta e quem gosta de Mostarda, nessa ordem.
(
(Condimento_1==pimenta,(Condimento_2==maionese; Condimento_3==maionese), Condimento_4==mostarda);
(Condimento_2==pimenta, Condimento_3==maionese, Condimento_4==mostarda)
),

%Fabiano está em algum lugar entre quem gosta de Vinagrete e o Carlos, nessa ordem.
(
(Condimento_1==vinagrete, (Nome_2==fabiano; Nome_3==fabiano; Nome_4==fabiano ),Nome_5==carlos);
(Condimento_2==vinagrete, (Nome_3==fabiano; Nome_4==fabiano),Nome_5==carlos);
(Condimento_3==vinagrete, Nome_4==fabiano, Nome_5==carlos)
),

% O rapaz de Vermelho está em algum lugar à esquerda de quem gosta
% de Ketchup.
(
(Condimento_5==ketchup,(Camiseta_4==vermelha; Camiseta_3==vermelha; Camiseta_2==vermelha; Camiseta_1==vermelha));
(Condimento_3==ketchup,(Camiseta_2==vermelha; Camiseta_1==vermelha));
(Condimento_2==ketchup, Camiseta_1==vermelha)
),

%  O cliente de Azul gosta de Maionese
(
(Camiseta_1==azul, Condimento_1==maionese);
(Camiseta_2==azul, Condimento_2==maionese);
(Camiseta_3==azul, Condimento_3==maionese);
(Camiseta_5==azul, Condimento_5==maionese)
),

alldifferent([Condimento_1, Condimento_2, Condimento_3, Condimento_4, Condimento_5]),

%DICAS ENVOLVENDO SOMENTE CAMISETA, NOME, PASTEL, CONDIMENTO E SUCO

suco(Suco_1),
suco(Suco_2),
suco(Suco_3),
suco(Suco_4),
suco(Suco_5),

%Quem pediu um suco de Laranja está em algum lugar entre Júlio e quem pediu suco de Limão, nessa ordem.

(
 (Nome_1==julio,(Suco_2==laranja; Suco_3==laranja; Suco_4==laranja), Suco_5==limao);
 (Nome_1==julio,(Suco_2==laranja; Suco_3==laranja), Suco_4==limao);
 (Nome_1==julio, Suco_2==laranja, Suco_3==limao);
 (Nome_2==julio,(Suco_3==laranja, Suco_4==laranja), Suco_5==limao);
 (Nome_2==julio, Suco_3==laranja, Suco_4==limao);
 (Nome_3==julio, Suco_4==laranja, Suco_5==limao)
),

%O cliente de Vermelho está ao lado de quem vai beber um suco de Maracujá.
(
(Suco_1==maracuja, Camiseta_2==vermelha);
(Suco_2==maracuja, (Camiseta_1==vermelha; Camiseta_3==vermelha));
(Suco_3==maracuja, (Camiseta_2==vermelha; Camiseta_4==vermelha));
(Suco_4==maracuja, (Camiseta_3==vermelha; Camiseta_5==vermelha));
(Suco_5==maracuja, Camiseta_4==vermelha)
),

alldifferent([Suco_1, Suco_2, Suco_3, Suco_4, Suco_5]),

%DICAS ENVOLVENDO PROFISSAO

profissao(Profissao_1),
profissao(Profissao_2),
profissao(Profissao_3),
profissao(Profissao_4),
profissao(Profissao_5),

%Júlio está exatamente à direita do Bancário.
(
(Profissao_1==bancario,(Nome_2==julio; Nome_3==julio; Nome_4==julio; Nome_5==julio));
(Profissao_2==bancario,(Nome_3==julio; Nome_4==julio; Nome_5==julio));
(Profissao_3==bancario,(Nome_4==julio; Nome_5==julio));
(Profissao_4==bancario, Nome_5==julio)
),


%O Entregador pediu um pastel de Carne.
(
(Profissao_1==entregador, Pastel_1==carne);
(Profissao_2==entregador, Pastel_2==carne);
(Profissao_3==entregador, Pastel_3==carne);
(Profissao_4==entregador, Pastel_4==carne);
(Profissao_5==entregador, Pastel_5==carne)
),

%O Relojoeiro está exatamente à esquerda de quem beberá um suco de Maçã.
(
(Suco_2==maca, Profissao_1==relojoeiro);
(Suco_3==maca, Profissao_2==relojoeiro);
(Suco_4==maca, Profissao_3==relojoeiro);
(Suco_5==maca, Profissao_4==relojoeiro)
),

%!  O Feirante está ao lado de quem gosta de Pimenta.
(
(Condimento_1==pimenta,Profissao_2==feirante);
(Condimento_2==pimenta,(Profissao_1==feirante; Profissao_3==feirante));
(Condimento_3==pimenta,(Profissao_2==feirante; Profissao_4==feirante));
(Condimento_4==pimenta,(Profissao_3==feirante; Profissao_5==feirante));
(Condimento_5==pimenta,Profissao_4==feirante)
),


%  O feirante vai beber um suco de maracujá
(
(Profissao_1==feirante, Suco_1==maracuja);
(Profissao_2==feirante, Suco_2==maracuja);
(Profissao_3==feirante, Suco_3==maracuja);
(Profissao_4==feirante, Suco_4==maracuja);
(Profissao_5==feirante, Suco_5==maracuja)
),

%  O bancario está usando uma camiseta verde
(
(Profissao_1==bancario, Camiseta_1==verde);
(Profissao_2==bancario, Camiseta_2==verde);
(Profissao_3==bancario, Camiseta_3==verde);
(Profissao_4==bancario, Camiseta_4==verde);
(Profissao_5==bancario, Camiseta_5==verde)
),

%Quem gosta de Pimenta está em algum lugar entre o Relojoeiro e o
%cliente de Azul, nessa ordem
(
(Profissao_1==relojoeiro,(Condimento_2==pimenta; Condimento_3==pimenta; Condimento_4==pimenta), Camiseta_5==azul);
(Profissao_1==relojoeiro,(Condimento_2==pimenta; Condimento_3==pimenta), Camiseta_4==azul);
(Profissao_1==relojoeiro, Condimento_2==pimenta, Camiseta_3==azul);
(Profissao_2==relojoeiro,(Condimento_3==pimenta; Condimento_4==pimenta), Camiseta_5==azul);
(Profissao_2==relojoeiro, Condimento_3==pimenta, Camiseta_4==azul);
(Profissao_3==relojoeiro, Condimento_4==pimenta, Camiseta_5==azul)
),

alldifferent([Profissao_1, Profissao_2, Profissao_3, Profissao_4, Profissao_5]),

nl,%insere uma nova linha (coloca o cursor no início da linha de baixo)
write('CHEGAMOS AO FIM DO MODELO')
.% fechando o modelo

%%%%%%%%%%%%%%%%%%%%%%%% Imprimindo a lista
imprime_lista([]):- write('\n\n FIM do imprime_lista \n').
imprime_lista([H|T]):-
	write('\n......................................\n'),
	write(H), write(' : '),
              imprime_lista(T).

/**********************************************************/
%% main fornece ponto de entrada para scripts
main :-
   %% statistics mostra informações sobre o uso de recursos
   %% Obtém o tempo inicial baseado no Tempo de CPU desde que o thread foi iniciado (em milissegundos).
    statistics(cputime,Tempo_inicial),

    %%chama modelo
    %% lembrando que modelo foi definido como:
    %%  modelo([
    %%     (Biquini_1, Nome_1, Protetor_1, Picole_1, Idade_1, Hobby_1),
    %%     (Biquini_2, Nome_2, Protetor_2, Picole_2, Idade_2, Hobby_2),
    %%     (Biquini_3, Nome_3, Protetor_3, Picole_3, Idade_3, Hobby_3),
    %%     (Biquini_4, Nome_4, Protetor_4, Picole_4, Idade_4, Hobby_4),
    %%     (Biquini_5, Nome_5, Protetor_5, Picole_5, Idade_5, Hobby_5)
    %%  ])

    modelo(  [Coluna1, Coluna2, Coluna3, Coluna4,Coluna5]  ),

    %%chama imprime_lista
    imprime_lista(  [Coluna1, Coluna2, Coluna3, Coluna4, Coluna5]  ),

    %% Obtém o tempo final baseado no Tempo de CPU desde que o thread foi iniciado (em milissegundos).
    statistics(cputime ,Tempo_final),
    Tempo_BUSCA is Tempo_final - Tempo_inicial,

    %%define o formato do tempo na saída
    format('\n Tempo inicial: ~f \t Tempo final: ~f  msec', [Tempo_inicial, Tempo_final]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA),
    fail.
main :-

    nl,
    write('xxxx AQUI SOH PODE VIR UMA RESPOSTA ....'),
    nl,
    write('........ UFA apos o fail .......').


camiseta(amarela).
camiseta(azul).
camiseta(branca).
camiseta(verde).
camiseta(vermelha).

%  NOME
nome(carlos).
nome(fabiano).
nome(julio).
nome(marcelo).
nome(rubens).

%  PASTEL
pastel(carne).
pastel(frango).
pastel(calabresa).
pastel(pizza).
pastel(queijo).

%  CONDIMENTO
condimento(ketchup).
condimento(maionese).
condimento(mostarda).
condimento(pimenta).
condimento(vinagrete).

%  SUCO
suco(laranja).
suco(limao).
suco(maracuja).
suco(uva).
suco(maca).

%  PROFISSAO
profissao(bancario).
profissao(entregador).
profissao(feirante).
profissao(relojoeiro).
profissao(vendedor).




