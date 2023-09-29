bd :- consult("SSPIAI_Mercado.Pedroza.Saul/E2.3_Listas/bc.pl").
:- initialization(bd).

main :-
    write("---------------------------------------------------------"),nl,
    write("Escriba 1 para agregar conocimiento a las listas"),nl,
    write("Escriba 2 para eliminar conocimiento de las listas"),nl,
    write("Escriba 3 para mostrar el conocimiento de las listas"),nl,
    write("Escriba 4 para concatenar el conocimiento de las listas"),nl,
    write("Escriba 5 para ver la longitud de las listas"),nl,
    write("Presione 6 para ordenar el conocimiento de las listas"),nl,
    write("Presione 7 para salir"),nl,
    write("---------------------------------------------------------"),nl,
    read(AC),
    accion(AC).

    %Dirreccionamiento a las opciones
    accion(1) :- agregar,main.
    accion(2).
    accion(3).
    accion(4).
    accion(5).
    accion(6).
    accion(7) :- !.

    %Métodos del menú
    agregar:- write("En que estilo se encuentra pintado"), nl, read(Tipo), nl, 
                write("Que nombre tiene la pintura"), nl, read(Conocimiento), 
                nombrepinturas(Tipo,Lista),insertar(Conocimiento,Lista,ListaRes), 
                write(ListaRes), retract(nombrepinturas(Tipo,Lista)), agregar(Tipo,ListaRes).
                agregar(Tipo,Lista):- assert(nombrepinturas(Tipo,Lista)).
    
    eliminar().
    buscar().
    mostrar().
    concatenar().
    longitud().
    ordenar().

%Metodos para las opciones
insertar(E,L,Lr):- Lr = [E|L].