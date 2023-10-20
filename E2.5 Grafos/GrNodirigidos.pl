%%Saul Mercado Pedroza%%
%
%%Grafos no dirigidos estilo (A-B)
bd :- consult("SSPIAI_Mercado.Pedroza.Saul/E2.5 Grafos/grafos.pl").
:- initialization(bd).



%identificar si dos nodos son adyacentes
vecinos(N1,N2,G):- grafo(G,List),(member(N1-N2,List);member(N2-N1,List)).

%Arroja todos los nodos de la lista
vertices(G,Ln):- 
    %Devuelve una lista con los datos consultados
    %bagof(N1,N2^vecinos(N1,N2,G),Ln).
    %Devuelve yba lista con los datos consultados y los ordena
    setof(N1,N2^vecinos(N1,N2,G),Ln).

%Listar Nodos existentes
listar_N(G):- grafo(G,L), nodos(L,[]).
nodos([],Lr):- sort(Lr, Lf), write(Lf).
nodos([N1-N2|T],Lr):- L1 = [N1|Lr], L2 = [N2|L1],nodos(T,L2).

nodos_adyacentes(Nodo,G) :- vertices(G,Ln), nodosAd(Nodo,Ln,[],G).
nodosAd(_,[],Lr,_):- sort(Lr,Ls), write(Ls).
nodosAd(Nodo,[N1|T],Lr,G):- vecinos(Nodo,N1,G), L1 = [N1|Lr], nodosAd(Nodo,T,L1,G).
nodosAd(Nodo,[N1|T],Lr,G):- \+vecinos(Nodo,N1,G), L1 = [N1|T], remover(N1,L1,Lc), nodosAd(Nodo,Lc,Lr,G).


%Listar Nodos existentes y cantidad
listar_Num_Nodos(G):- grafo(G,L), nodosN(L,[]).

%Impresión de los nodos y conteo de nodos
nodosN([],Lr):- sort(Lr, Lf), write(Lf), nl, longitud(Lf,Cant),
                write('La cantidad de nodos existentes en este grafo son: '),write(Cant).
nodosN([N1-N2|T],Lr):-  L1 = [N1|Lr], L2 = [N2|L1],nodosN(T,L2).

%Imprimir Aristas del grafo
imprimir_ar(G):- grafo(G,L), lista(L).
lista([]).
lista([H|T]):- write(H), nl,lista(T).

%Mostrar la cantidad de aristas
imprimir_N_ar(G):- grafo(G,L), listaN(L,1).

%Lista para el numero de aristas
listaN([]).
listaN([H|T],P):- write('\n Arista #'),write(P),write(": "),write(H), nl, P1 is P + 1,listaN(T,P1).

%Buscar si un nodo existe
b_Nodo(Nb,Ngrafo):- grafo(Ngrafo,Lista), (member(Nb-_, Lista); member(_-Nb, Lista)), 
                    write('El nodo '), write(Nb), write(' se encuentra en el grafo').
b_Nodo(Nb,Ngrafo):- grafo(Ngrafo,Lista), not(member(Nb-_, Lista); member(_-Nb, Lista)), 
                    write('El nodo '), write(Nb), write(' no se encuentra en el grafo').
%Recorrido
recorrido(G,O,D,C):- recorrido_aux(G,O,[D],C).

recorrido_aux(_,No,[No|C1],[No|C1]).
recorrido_aux(G,Ax,[Dx|C1],C):-
    vecinos(Nt,Dx,G),
    not(member(Nt,[Dx|C1])),
    recorrido_aux(G,Ax,[Nt,Dx|C1],C).

%Hamiltoniano
%G = Nombre del grafo
%C = dejarlo como mayuscula C para que muestre el camino
hamiltoniano(G,C):- vertices(G,Ln),
                    length(Ln,N),
                    length(C,N),
                    recorrido(G,_,_,C).

%Hamiltoniano con un nodo origen
%G = Nombre del grafo
%O = Nodo origen
%C = dejarlo como mayuscula C para que muestre el camino
hamiltoniano_O(G,O,C):- vertices(G,Ln),
                    length(Ln,N),
                    length(C,N),
                    recorrido(G,O,_,C).

%%%Impresión de nodos de solo los adyacentes del nodo especificado%%%



% Ejemplo de uso
% Uso: ?- grafo(G), hamiltoniano(G, Camino).
% Donde G es el grafo y Camino es el camino hamiltoniano encontrado.


%Métodos genéricos
%longitud
longitud([], 0).
longitud([_|T], L) :- longitud(T,L1), L is L1 + 1.

%Remover en lista
remover(_,[],[]).
remover(R,[R|T],T2):- remover(R,T,T2).
remover(R,[H|T],[H|T2]):- H\=R , remover(R,T,T2).