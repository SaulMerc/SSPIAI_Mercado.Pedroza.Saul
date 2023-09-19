%Consultar el archivo S11
inicio :- consult('SSPIAI_Mercado.Pedroza.Saul/S11.3.pl').

agregar(A) :- assert(mamifero(A)).
buscar(A) :- respuesta(A).
eliminar(A) :- retract(mamifero(A)).
%Guardar con tell, listing, told
guardar :- tell('SSPIAI_Mercado.Pedroza.Saul/S11.3.pl'),
        listing(mamifero/1),told,
        write("Guardado ...").

fin :- retractall(mamifero(_)).

respuesta(A) :- mamifero(A), write('es un animal').
respuesta(A) :- \+mamifero(A), agregar(A), write("Nuevo Conocimiento").