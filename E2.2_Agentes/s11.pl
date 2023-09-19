%Mamiferos
:- dynamic mamifero/1.
mamifero(delfin).
mamifero(leon).

:- dynamic mamifero/2.
mamifero(tigre,carnivoro).
mamifero(oso,omnivoro).
mamifero(puma,carnivoro).
%listing(mamifero). devuelve todos los predicados

%Arity - Aridad = Cantidad de parámetros que tiene un predicado
%assert(mamifero(gato)). insertar un nuevo valor
%asserta Inserta al inicio
%assertz Inserta al final
%dynamic/1 establcer permisos
%retract(mamifero(mamut)). elimina valor de la memoria
%retractall elimina todos
% _ :- variable anónima
%abolish elimina todo