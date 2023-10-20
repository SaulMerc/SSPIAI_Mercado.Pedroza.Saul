%%Saul Mercado Pedroza%%
%
%%Grafos mediante predicados
g1(a,b).
g1(a,d).
g1(a,i).

g1(b,a).
g1(b,c).
g1(b,e).

g1(c,b).

g1(d,a).
g1(d,e).
g1(d,i).

g1(e,b).
g1(e,d).
g1(e,f).
g1(e,i).

g1(f,e).

g1(i,a).
g1(i,d).

g1(m,m).
%Recorrido de G no Dirigido
imp_salto(N1,N2):- write(N1), write('->'), write(N2),nl.
%Impresion del camino
camino(O,D):- g1(O,D), imp_salto(O,D).
camino(O,D):- g1(O,Nt), imp_salto(O,Nt), camino(Nt,D),!.

%Grafo dirigido
g2(5,11).

g2(7,11).
g2(7,8).

g2(11,2).
g2(11,10).
g2(11,9).

g2(8,9).

g2(2,5).

camino2(O,D):- g2(O, D), imp_salto(O,D).
camino2(O,D):- g2(O,Nt), imp_salto(O,D), camino2(Nt,D),!.

%Recorrido grafo ponderado
g3(a,d,5).
g3(a,i,3).
g3(i,d,4).
g3(d,e,2).
g3(e,f,4).
g3(f,m,3).

g3(d,i,4).
g3(i,a,3).
g3(d,a,5).
g3(e,d,2).
g3(f,e,4).
g3(m,f,3).

%Impresión del camino
imp_saltoP(N1,N2,P):- write(N1), write('->'), write(P) ,write('->'), write(N2),nl.
%Recorrido del camino
caminoP(O,D,P):- g3(O,D,P), imp_saltoP(O,D,P), !.
caminoP(O,D,P):- g3(O,Nt,P1), imp_saltoP(O,Nt,P1), caminoP(Nt,D,P2), P is P1 + P2, !.