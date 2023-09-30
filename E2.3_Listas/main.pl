%%Saúl Mercado Pedroza%%
bd :- consult("SSPIAI_Mercado.Pedroza.Saul/E2.3_Listas/bc.pl").
:- discontiguous agregarPin/1.
:- initialization(bd).

main :-
    write("---------------------------------------------------------"),nl,
    write("Escriba 1 para agregar conocimiento de pinturas"),nl,
    write("Escriba 2 para eliminar conocimiento de pinturas"),nl,
    write("Escriba 3 para mostrar el conocimiento de pinturas"),nl,
    write("Escriba 4 para concatenar el conocimiento de pinturas"),nl,
    write("Escriba 5 para ver la longitud de las listas de pinturas"),nl,
    write("Presione 6 para ordenar el conocimiento de las pinturas"),nl,
    write("Presione 7 para buscar el conocimiento de una pinturas"),nl,
    write("Presione cualquier otra tecla para salir"),nl,
    write("---------------------------------------------------------"),nl,
    read(AC),
    accion(AC).

    %Dirreccionamiento a las opciones
    accion(1) :- agregar,main.
    accion(2) :- eliminar,main.
    accion(3) :- mostrar,main.
    accion(4) :- concatenar,main.
    accion(5) :- longitud,main.
    accion(6) :- ordenar,main.
    accion(7) :- busqueda,main.
    accion(8) :- !.

    %Métodos del menú
    %%Agregado%%
    agregar:- pregunta1('agregar'), nl, read(Tipo), agregarPin(Tipo) ,nl.
    
    %En caso de existir el estilo que lo agregue
    agregarPin(Tipo):- nombrepinturas(Tipo,_), pregunta2(Tipo,'agregar'), nl, read(Conocimiento), 
                    nombrepinturas(Tipo,Lista),insertar(Conocimiento,Lista,ListaRes), 
                    retract(nombrepinturas(Tipo,Lista)), agregar_Bc(Tipo,ListaRes),
                    write('Nueva pintura al estilo '), write(Tipo), write(' agregada...'),nl,nl.
    
    %En caso de no existir el estilo de pintado
    agregarPin(Tipo) :- \+nombrepinturas(Tipo,_), write("El estilo de pintado no existe"),nl,
                    write("Deseas agregarlo? Si(s) No(n)"), nl, read(OP), respuesta(OP,Tipo).
    
    %Guardado en el documento
    agregar_Bc(Tipo,Lista):- assert(nombrepinturas(Tipo,Lista)), guardar.

    %%Metodo de eliminar%%
    eliminar:- pregunta1(elimnar),nl, read(Tipo), eliminar(Tipo).
    %Caso en el que el estilo de pintado no exista
    eliminar(Tipo):- nombrepinturas(Tipo,Lista), pregunta2(Tipo,'eliminar'), nl,
                        read(Conocimiento), eliminarCon(Tipo, Conocimiento, Lista).
    %Caso en el que el estilo de pintado no exista
    eliminar(Tipo):- \+nombrepinturas(Tipo,_),respuestaNF('buscar').
    %En caso de que se encuentre el nombre de la pintura
    eliminarCon(Tipo, Conocimiento, Lista):- buscar(Conocimiento,Lista), remover(Conocimiento,Lista,ListaRes),
                                            retract(nombrepinturas(Tipo,Lista)), agregar_Bc(Tipo,ListaRes), write('Conocimiento eliminado...'), nl.
    eliminarCon(Tipo, Conocimiento, Lista):- \+buscar(Conocimiento,Lista), write("No me sera posible eliminar "), write(Conocimiento), 
                                                write(" ya que no se encuentra en mi base de conocimiento "), write(Tipo), nl.
    %%Metodo de busqueda%%
    busqueda:- pregunta1('buscar'),nl, read(Tipo),busqueda(Tipo).
    %En caso existir el estilo de pintado
    busqueda(Tipo):- nombrepinturas(Tipo,Lista), pregunta2(Tipo,'buscar'), nl, read(Conocimiento), busquedaPin(Tipo, Conocimiento, Lista).
    %En caso de no existir el estilo de pintado
    busqueda(Tipo):- \+nombrepinturas(Tipo,_), respuestaNF('buscar').
    %En caso de encontrar el conocimiento
    busquedaPin(Tipo, Conocimiento, Lista):- buscar(Conocimiento,Lista), write("Se ha encontrado "), write(Conocimiento),
                                            write(" en el estilo "), write(Tipo),nl,nl.
    %Caso contrario
    busquedaPin(Tipo, Conocimiento, Lista):- \+buscar(Conocimiento,Lista), write('La pintura '),write(Conocimiento), 
                                            write(" no ha sido posible encontrarse en el estilo "), nl,write(Tipo),
                                            write("Deseas agregarlo? Si(s) No(n)"), nl, read(OP), respuestaC(OP,Tipo,Conocimiento).

%%Mosrar todos los valores de una lista%%
    mostrar:- write("Que estilo de pinturas deseas ver sus nombres?"),nl,read(Tipo), mostrar(Tipo).
    mostrar(Tipo):- nombrepinturas(Tipo,Lista), write('Los nombre de las pinturas del estilo '), write(Tipo)
                    , write(' que conozco son: '), nl, lista(Lista).
    mostrar(Tipo):- \+nombrepinturas(Tipo,_), respuestaNF('mostrar').
%Concatenar dos estilos de pintura
    concatenar:- write("Que estilos de pintado deseas unir?"),nl,read(Tipo), 
                write("Con cual deseas unirlo?"),nl,read(Tipo2), concatenar(Tipo,Tipo2).
%Ninguno de los dos estilos de pintado existan
    concatenar(Tipo,Tipo2):- (\+nombrepinturas(Tipo,_) , \+nombrepinturas(Tipo2,_)), 
                write('No me es posible concatenarlos ya que ninguno de los dos estilos existen').
%Alguno de los dos estilos no existan
    concatenar(Tipo,Tipo2):- (\+nombrepinturas(Tipo,_) ; \+nombrepinturas(Tipo2,_)), 
            write('No me es posible concatenarlos ya que desconozco alguno de los dos estilos escritos').
%Existan los estilos de pintura
    concatenar(Tipo,Tipo2):- (nombrepinturas(Tipo,Lista1) , nombrepinturas(Tipo2,Lista2)), concat(Lista1,Lista2,ListaRes),
                            write('La lista resultante es: '), nl, lista(ListaRes).

%%Metodo de longitud%%
    longitud:- write('De que estilo de pintura deseas saber su longitud?'), nl,read(Tipo), longitud(Tipo).
%En caso de encontrar el estilo de pintura
    longitud(Tipo):- nombrepinturas(Tipo,Lista), write('Las pinturas existentes en el estilo '),write(Tipo), 
                    write(' son '), longitud(Lista,Cant),write(Cant), write(' con los siguientes valores: '),
                    nl, lista(Lista).
%En caso de no existir el estilo de pintura
    longitud(Tipo):- \+nombrepinturas(Tipo,_), write('No puedo mostrarte la longitud el estilo '), write(Tipo),
                        write(' debido a que no conozco esa tecnica'). 

%%Metodo de ordenamiento%%
    ordenar:- write('La lista de que estilo de pintado deseas ver ordenada?'),nl,read(Tipo),ordenar(Tipo).
%En caso de encontrar el estilo de pintado
    ordenar(Tipo):- nombrepinturas(Tipo,Lista), write('Las pinturas existentes en el estilo '),write(Tipo), 
                    write(' se encuentran ordenadas de la siguiente manera '), nl, sort(Lista, Sorted), lista(Sorted).
%En caso de no encontrar el estilo de pintado
    ordenar(Tipo):- \+nombrepinturas(Tipo,_), write('No puedo mostrarte el ordenamiendo del estilo '), write(Tipo),
                    write(' debido a que no conozco esa tecnica'). 
%Guardar los cambios en la base de conocimiento
guardar :- tell('SSPIAI_Mercado.Pedroza.Saul/E2.3_Listas/bc.pl'), listing(nombrepinturas/2), told.

%Metodos para las opciones
%Incersión en lista
insertar(E,L,Lr):- Lr = [E|L].

%Remover en lista
remover(_,[],[]).
remover(R,[R|T],T2):- remover(R,T,T2).
remover(R,[H|T],[H|T2]):- H\=R , remover(R,T,T2).

%Buscar en la lista
buscar(B,[B|_]).
buscar(B,[_|T]):- buscar(B,T).

%Mostrar
lista([]).
lista([H|T]):- write(H), nl, lista(T).

%Concatenacción
concat([], Lista, Lista).
concat([Cabeza|Cola1], Lista2, [Cabeza|Resultado]) :-
    concat(Cola1, Lista2, Resultado).

%longitud
longitud([], 0).
longitud([_|T], L) :- longitud(T,L1), L is L1 + 1.

%Impresiones genericas
    %Pregunta del estilo de pintado
    pregunta1(Fin):- write("En que estilo se encuentra el nombre de la pintura a "),write(Fin),write("?").
    %Pregunta del nombre de la pintura
    pregunta2(Tipo, Fin):- write('Que nombre del estilo '), write(Tipo), write(' deseas '),write(Fin),write("?").
    %Respuesta a valor estilo de pintado no encontrado
    respuestaNF(Fin):- write("No me sera posible "), write(Fin), write(" alguna pintura ya que desconozco de ese estilo de pintado"),nl.
    %Respuesta de agregar el estilo de pintado
    respuesta(s,Tipo):- assert(nombrepinturas(Tipo,[])),write('Estilo '), write(Tipo), 
                        write('agregado a la base de conociminento...'), guardar,nl,nl.
    respuesta(n,Tipo):- write('Muy bien, olvidando el estilo '), write(Tipo),nl,nl.
    %Respuesta agregar nuevo nombre de pintura
    respuestaC(s,Tipo,Conocimiento):- nombrepinturas(Tipo,Lista), insertar(Conocimiento,Lista,ListaRes), 
                                    retract(nombrepinturas(Tipo,Lista)), 
                                    agregar_Bc(Tipo,ListaRes), write('Nueva pintura al estilo '), write(Tipo), 
                                    write(' agregada...'), nl, nl.
    respuestaC(n,Tipo,Conocimiento):- write('Muy bien, olvidando el nombre '), write(Conocimiento), write(' del estilo '), write(Tipo), nl,nl.