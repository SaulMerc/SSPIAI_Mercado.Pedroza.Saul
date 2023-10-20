bd :- consult("SSPIAI_Mercado.Pedroza.Saul/E2.5 Grafos/grafos.pl").
:- initialization(bd).

%%Crear un Grafo%%
%Si no existe el grafo lo creo
c_Grafo(N1,N2,Ngrafo):- \+grafo(Ngrafo,_), assert(grafo(Ngrafo,[])), a_Nodos(N1,N2,Ngrafo).

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