%Grafos
%
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

imp_saltoP(N1,N2,P):- write(N1), write('->'), write(P) ,write('->'), write(N2),nl.
caminoP(O,D,P):- g3(O,D,P), imp_saltoP(O,D,P), !.
caminoP(O,D,P):- g3(O,Nt,P1), imp_saltoP(O,Nt,P1), caminoP(Nt,D,P2), P is P1 + P2, !.

%Grafos con listas no dirigido
grafoLista(gnn,[a-i,a-b,a-d,b-c,b-e,d-i,d-e,e-d,e-f,m-m]).
%Grafos con listas dirigido
%grafoLista(gdn,[a>i,a>b,a>d,b>c,b>e,d>i,d>e,e>d,e>f]).

%Grafo de australia
grafoLista(gAustralia,[ao-tn,ao-as,tn-q,tn-as,as-q,as-ngs,as-v,ngs-q,ngs-v,t-t]).

%vecinos_d(N1,N2,G):- grafoLista(G,List),(member(N1>N2,List);member(N2>N1,List)).

vecinos(N1,N2,G):- grafoLista(G,List),(member(N1-N2,List);member(N2-N1,List)).

vertices(G,Ln):- 
    %Devuelve una lista con los datos consultados
    %bagof(N1,N2^vecinos(N1,N2,G),Ln).
    %Devuelve yba lista con los datos consultados y los ordena
    setof(N1,N2^vecinos(N1,N2,G),Ln).

%Listar Nodos
listar_N(G):- grafoLista(G,L), nodos(L,[]).
nodos([],Lr):- sort(Lr, Lf), write(Lf).
nodos([N1-N2|T],Lr):- L1 = [N1|Lr], L2 = [N2|L1],nodos(T,L2).

%Imprimir Aristas
imprimir_ar(G):- grafoLista(G,L), lista(L).
lista([]).
lista([H|T]):- write('\n\t Arista: '),write(H), nl, lista(T).

%Recorrido
recorrido(G,O,D,C):- recorrido_aux(G,O,[D],C).

recorrido_aux(_,No,[No|C1],[No|C1]).
recorrido_aux(G,Ax,[Dx|C1],C):-
    vecinos(Nt,Dx,G),
    not(member(Nt,[Dx|C1])),
    recorrido_aux(G,Ax,[Nt,Dx|C1],C).