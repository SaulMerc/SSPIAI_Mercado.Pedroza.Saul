% Árbol Genealógico
% Papá
hombre(ignacio).
% Hermanos
hombre(carlos).
hombre(hector).
hombre(oscar).
hombre(saul).

%Primos
hombre(gibran).
hombre(gerardo).
hombre(juanJr).

%Bisabuelos
hombre(marcos).

%Abuelos
hombre(petronilo).
hombre(jose).

%Tios abuelos


%Tios
hombre(juan).

%Tios politicos
hombre(trinidad).

%Bisabuelas
mujer(paula).
%Abuela
mujer(florencia).

%Tias abuelas
mujer(margarita).
mujer(matilde).

%Tias
mujer(martina).

%Tias políticas
mujer(josefina).

% Mamá
mujer(yolanda).

% Hermanas
mujer(delia).
mujer(angelica).
mujer(teresa).

%Primas
mujer(mariaIsabel).
mujer(maria).

%Bisabuelos maternos progenitores
progenitor(marcos, petronilo).
progenitor(paula, petronilo).
progenitor(marcos, margarita).
progenitor(paula, margarita).
progenitor(marcos, matilde).
progenitor(paula, matilde).
%Abuelo materno progenitor
progenitor(petronilo,yolanda).
progenitor(petronilo,juan).
progenitor(petronilo,martina).

%Abuelo paterno progenitor
progenitor(jose,ignacio).
progenitor(florencia,ignacio).
%Papás
progenitor(ignacio,carlos).
progenitor(ignacio,oscar).
progenitor(ignacio,hector).
progenitor(ignacio,saul).

progenitor(yolanda,carlos).
progenitor(yolanda,oscar).
progenitor(yolanda,hector).
progenitor(yolanda,saul).

%Tios y tias maternas, progenitores
progenitor(martina,gibran).
progenitor(trinidad,gibran).

progenitor(juan,gerardo).
progenitor(juan,mariaIsabel).
progenitor(juan,juanJr).
progenitor(juan,maria).

progenitor(josefina,gerardo).
progenitor(josefina,mariaIsabel).
progenitor(josefina,juanJr).
progenitor(josefina,maria).

%Parejas
pareja(ignacio,yolanda).
pareja(trinidad,martina).
pareja(juan,josefina).



padre(P,H) :- progenitor(P,H), hombre(P).
madre(M,H) :- progenitor(M,H) , mujer(M).
%Determinar si es hijo
hijo(H,P) :- progenitor(P,H) , hombre(H) ; progenitor(P,H) , mujer(H).

%Definir Abuelos de manera general
abuelosG(A,N) :- progenitor(A,P), progenitor(P,N).
%Definir Abuelos por separado
abuelas(A,N) :- progenitor(A,P), progenitor(P,N), mujer(A).
abuelos(A,N) :- progenitor(A,P), progenitor(P,N), hombre(A).
%Definir Abuelos paternos
abuelo_pat(A,N) :- padre(A,P) , padre(P,N).
abuela_pat(A,N) :- madre(A,P) , padre(P,N).

%Definir Abuelos maternos
abuelo_mat(A,N) :- padre(A,M) , madre(M,N).
abuela_mat(A,N) :- madre(A,M) , madre(M,N).

%Definir solo abuelos paternos o solo abuelos maternos
abuelos_pat(Ao,Aa,N) :- abuelo_pat(Ao,N) , abuela_pat(Aa,N).
abuelos_mat(Ao,Aa,N) :- abuelo_mat(Ao,N) , abuela_mat(Aa,N).

%Definir tio y tia
tio(T,S) :- hermanos(T,P), progenitor(P,S), hombre(T).
tia(T,S) :- hermanos(T,P), progenitor(P,S), mujer(T).
tios(T,S):- hermanos(T,P), progenitor(P,S).

%Hermanos
hermanos(H1,H2) :- progenitor(P,H1) , progenitor(P,H2), H1\=H2.

%Parejas
parejas(Fs,Pa) :- pareja(Fs,Pa) ; pareja(Pa,Fs).

%Tío Político
tio_politico(Tp, S) :- parejas(Tp,Ts), tios(Ts,S), hombre(Tp).
tia_politica(Tp, S) :- parejas(Tp,Ts), tios(Ts,S), mujer(Tp).

%Bisabuelos en general
bisabuelos(B,N):- progenitor(B,A), abuelosG(A,N).

%Bisabuelo y bisabuela de manera individual
bisabuelo(B,N):- progenitor(B,A), abuelos(A,N), hombre(B).
bisabuela(B,N):- progenitor(B,A), abuelas(A,N), mujer(B).

%Primos
primos(P1,P2) :- progenitor(P,P1), tios(P,P2).

%Tios abuelos de manera general
tios_abuelos(T,S) :- hermanos(T,A), abuelosG(A,S).

%Tios abuelos de manera individual
tio_abuelo(T,S) :- hermanos(T,A), abuelosG(A,S), hombre(T).
tia_abuela(T,S) :- hermanos(T,A), abuelosG(A,S), mujer(T).
