%Listas

%Simple
mamiferos([leon,perro,tigre,caballo]).
semana([lunes,martes,miercoles]).

%Listas de listas
animales(
    [leon,tigre,jaguar],
    [caballo],
    [perro,oso],
    [oso_homigero]
).

%Listas como relación
animales(carnivoro,
    [lobo,leopardo,leon]
).

animales(insectivoro,
    [rana,camaleon]
).

%insertar
insertar(E,L,Lr):- Lr = [E|L].
insertar1(E,L,[E|L]).
insertar2(E,L,[Rt|Rh]):-Rh=E, Rt=L.

agregar(E,[],[E]):- !.
agregar(E,[H|T],[H|L]) :-agregar(E,T,L).

%longitud
longitud([], 0).
longitud([_|T], L) :- longitud(T,L1), L is L1 + 1.

%buscar
buscar(B,[B|_]).
buscar(B,[_|T]):- buscar(B,T).

%Concatenar
concat([], L, L).
concat([H|T1], L2, [H,Result]):- concat(T1,L2,Result).

%Remover
remover(_,[],[]).
remover(R,[R|T],T2):- remover(R,T,T2).
remover(R,[H|T],[H|T2]):- H\=R , remover(R,T,T2).

%Remover primer valor
remover1(_,[],[]).
remover1(R,[R|T],T):- !.
remover1(R,[H|T],[H|T2]):- H\=R , remover1(R,T,T2).

%is_list - Comprobar  
%member - Buscar
%append - Concatenar
%delete - Eliminar
%sort - Ordenar eliminando duplicados
%lenght - Longitud
%msort - Ordenar sin eliminar duplicados

contar_elementos(Tipo,Cant) :- animales(Tipo,Lista),longitud(Lista,Cant).