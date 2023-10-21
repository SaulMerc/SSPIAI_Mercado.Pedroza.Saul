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

%Listar nodos y cantidad de nodos
nodos_adyacentes(Nodo,G) :- vertices(G,Ln), nodosAd(Nodo,Ln,[],G).
nodosAd(Nodo,[],Lr,_):- sort(Lr,Ls),write('Los nodos adyacentes a '), write(Nodo), write(' son: '),write(Ls).
nodosAd(Nodo,[N1|T],Lr,G):- vecinos(Nodo,N1,G), L1 = [N1|Lr], nodosAd(Nodo,T,L1,G).
nodosAd(Nodo,[N1|T],Lr,G):- \+vecinos(Nodo,N1,G), L1 = [N1|T], remover(N1,L1,Lc), nodosAd(Nodo,Lc,Lr,G).


%Listar Nodos existentes y cantidad
listar_Num_Nodos(G):- grafo(G,L), nodosN(L,[]).
nodosN([],Lr):- sort(Lr, Lf), write(Lf), nl, longitud(Lf,Cant),%Impresión de los nodos y conteo de nodos
                write('La cantidad de nodos existentes en este grafo son: '),write(Cant).
nodosN([N1-N2|T],Lr):-  L1 = [N1|Lr], L2 = [N2|L1], nodosN(T,L2).

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
recorrido(G,O,D,C):- recorrido_aux(G,O,[D],C),write(C).

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

%Métodos genéricos
%longitud
longitud([], 0).
longitud([_|T], L) :- longitud(T,L1), L is L1 + 1.

%Remover en lista
remover(_,[],[]).
remover(R,[R|T],T2):- remover(R,T,T2).
remover(R,[H|T],[H|T2]):- H\=R , remover(R,T,T2).

pGrafos(G):- 
    write("---------------------------------------------------------"),nl,
    write("| 1.- Elegir el nodo a trabajar"),nl,
    write("| 2.- Comprobar adyacencias"),nl,
    write("| 3.- Listar nodos existentes"),nl,
    write("| 4.- Saber la cantidad de nodos del grafo"),nl,
    write("| 5.- Ver los nodos adyacentes"),nl,
    write("| 6.- Ver las aristas del grafo"),nl,
    write("| 7.- Ver la cantidad de aristas"),nl,
    write("| 8.- Buscar un nodo"),nl,
    write("| 9.- Realizar recorrido"),nl,
    write("| 10.- Conocer los caminos hamiltonianos"),nl,
    write("| 11.- Conocer los caminos hamiltonianos a partir de un nodo"),nl,
    write("| 12.- Para salir"),nl,
    write("---------------------------------------------------------"),nl,
    read(AC),
    accion(AC,G).

    %Dirreccionamiento a las opciones
    accion(1,_) :- elegir.
    accion(2,G) :- comprobar(G),pGrafos(G).
    accion(3,G) :- lNodos(G),pGrafos(G).
    accion(4,G) :- cNodos(G),pGrafos(G).
    accion(5,G) :- nAd(G),pGrafos(G).
    accion(6,G) :- vAr(G),pGrafos(G).
    accion(7,G) :- cAr(G),pGrafos(G).
    accion(8,G) :- bNodo(G),pGrafos(G).
    accion(9,G) :- recorrido(G,C),pGrafos(G).
    accion(10,G) :- cHamil(G,C),pGrafos(G).
    accion(11,G) :- cHamilO(G,C),pGrafos(G).
    accion(12,G) :- !.
%Seleccionar con  que nodo trabajar
elegir:- write('Con que grafo deseas trabajar: '),read(G), pGrafos(G), nl.

comprobar(G):- write('Ingresa el primer nodo: '), read(N1),nl,
            write('Ingresa el segundo nodo: '), read(N2), c(N1,N2,G), nl.
comprobar(G):- write('Ingresa el primer nodo: '), read(N1),nl,
            write('Ingresa el segundo nodo: '), read(N2), c(N1,N2,G), nl.
    %Comprobar adyacencias
    c(N1,N2,G):- \+vecinos(N1,N2,G), write('Estos nodos no son vecinos'),nl.
    c(N1,N2,G):- vecinos(N1,N2,G), write('Estos nodos son vecinos'),nl.

%Listar nodos
lNodos(G):- write('Los nodos existentes en el grafo de '),write(G), write(' son:'),nl, listar_N(G), nl.

%Contar la cantidad de nodos
cNodos(G):- listar_Num_Nodos(G), nl.

%Comprobar nodos adyacentes
nAd(G):- write('Ingresa nodo para buscar sus vecinos'), read(N1), nl, ad(N1,G), nl.
    ad(N1,G):- b_Nodo(N1,G), nodos_adyacentes(N1,G), nl.
    ad(N1,G):- \+b_Nodo(N1,G), nl.

%Ver aristas
vAr(G):- imprimir_ar(G), nl.
%Contar aristas
cAr(G):- imprimir_N_ar(G), nl.

%Busqueda de un nodo existente
bNodo(G):- write('Ingresa el nombre del nodo a buscar'), read(N1), nl, b_Nodo(N1,G), nl.
%Realizar Recorrido en el grafo
recorrido(G,C):- write('Ingresa nombre del nodo Origen: '), read(N1),nl,
                write('Ingresa nombre del nodo Destino: '), read(N2), recorrido(G,N1,N2,C), nl.
%Todos los caminos Hamiltonianos de un grafo
cHamil(G,C):- write('Un camino hamiltoniano del grafo '), write(G), write(' es'), nl, hamiltoniano(G,C), nl.
%Caminos hamiltonianos a partir de un nodo origen
cHamilO(G,C):- write('Ingresa el nodo '), read(O), nl, hamiltoniano_O(G,O,C), nl.