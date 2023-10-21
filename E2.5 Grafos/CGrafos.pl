bd :- consult("SSPIAI_Mercado.Pedroza.Saul/E2.5 Grafos/grafos.pl").
:- initialization(bd).

%%Crear un Grafo%%
%Si no existe el grafo lo creo
c_Grafo(Ngrafo):- \+grafo(Ngrafo,_), agregar_Bc(Ngrafo,[]).
c_Grafo(Ngrafo):- grafo(Ngrafo,_), write("El nombre del grafo ya existe, prueba con otro nombre"),nl.
%Si existe el grafo lo modifico
a_Nodos(N1,N2,Ngrafo):- grafo(Ngrafo,Lista), insertar(N1-N2,Lista,ListaRes),retract(grafo(Ngrafo,Lista)), agregar_Bc(Ngrafo,ListaRes).

%Comprobar que una conexión no exista para crearla
c_Conexiones(N1,N2,Ngrafo):- grafo(Ngrafo,Lista), not(member(N1-N2,Lista);member(N2-N1,Lista)), 
                        write('Agregando nueva conexion al grafo'),nl,a_Nodos(N1,N2,Ngrafo).
c_Conexiones(N1,N2,Ngrafo):- grafo(Ngrafo,Lista), (member(N1-N2,Lista);member(N2-N1,Lista)), 
                    write('Esta conexion ya han sido agregada').
%Agregar a la base de conocimiento
agregar_Bc(Ngrafo,Lista):- assert(grafo(Ngrafo,Lista)), guardar.
insertar(E,L,Lr):- Lr = [E|L]. %Inserción en lista

%Guardar los cambios en la base de conocimiento
guardar :- tell('SSPIAI_Mercado.Pedroza.Saul/E2.5 Grafos/grafos.pl'), listing(grafo/2), told.

main :- 
    write("---------------------------------------------------------"),nl,
    write("| 1.- Crear Grafo"),nl,
    write("| 2.- Crear adyacencias"),nl,
    write("| 3.- Salir"),nl,
    write("---------------------------------------------------------"),nl,
    read(AC),
    accion(AC).

accion(1):- cGraph,main.
accion(2):- cAdy,main.
accion(3):- !.
cGraph:- write("Que nombre va a llevar el grafo"), nl, read(Grafo), c_Grafo(Grafo),nl.

cAdy:- write("A que grafo deseas crearle conexiones"), nl, read(Grafo), crear(Grafo),nl.
crear(Ngrafo):- \+grafo(Ngrafo,_), write("Al grafo que deseas acceder no existe, elige la opcion 1 para crealo"),nl.
crear(Ngrafo):- grafo(Ngrafo,_),write("Ingresa el nombre del nodo"), nl, read(N1),
                write("Ingresa el nombre del nodo al que esta conectado"), nl, read(N2),
                c_Conexiones(N1,N2,Ngrafo), write("Deseas agregar otro conexion? si(s)-no(n)"), nl, read(OPC), 
                desicion(OPC,Ngrafo).

desicion(s,Ngrafo):- crear(Ngrafo).
desicion(n,_):- !.