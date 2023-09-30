bdfact:- consult('SSPIAI_Mercado.Pedroza.Saul/E2.2_Agentes/BcFact.pl').
bdfibo:- consult('SSPIAI_Mercado.Pedroza.Saul/E2.2_Agentes/BcFibo.pl').

%Falta deshacer la redundancia
:- dynamic factorial/2.
%dcalcular factorial
calc_fact(0,1).
calc_fact(N,F) :- N>0, N1 is N-1, calc_fact(N1,F1), F is N*F1.
%Definir factorial
def_factorial(N,F) :- \+factorial(N,F), calc_fact(N,F), assert(factorial(N,F)), write('Nuevo valor aprendido'), guardarfact.
def_factorial(N,F) :- factorial(N,F), write('Valor encontrado'), nl,write(factorial(N,F)). 
%Guardar valores del factorial
guardarfact :- tell('SSPIAI_Mercado.Pedroza.Saul/E2.2_Agentes/BcFact.pl'),
        listing(factorial/2), told, nl ,
        write("Guardado ...").

:- dynamic fibonacci/2.
%Cálculo del fibonacci
calc_fibonacci(0,0).
calc_fibonacci(1,1).
calc_fibonacci(P,V) :- P>1, P1 is P-1, calc_fibonacci(P1,V1), P2 is P-2, calc_fibonacci(P2,V2), V is V1+V2.
%Buscar o agregar nuevo valor factorial
def_fibonacci(N,F) :- \+fibonacci(N,F), calc_fibonacci(N,F), assert(fibonacci(N,F)), write('Nuevo valor aprendido'), guardarfibo.
def_fibonacci(N,F) :- fibonacci(N,F), write('Valor encontrado'), nl,write(fibonacci(N,F)).
%Guardar valores del fibonacci
guardarfibo :- tell('SSPIAI_Mercado.Pedroza.Saul/E2.2_Agentes/BcFibo.pl'),
        listing(fibonacci/2), told, nl ,
        write("Guardado ...").