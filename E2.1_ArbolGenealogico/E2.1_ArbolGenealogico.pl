% Árbol Genealógico
% Papá
hombre(ignacio).
% Hermanos
hombre(carlos).
hombre(hector).
hombre(oscar).
hombre(saul).
%Abuelo
hombre(petronilo).
hombre(jose).

%Abuela
mujer(florencia).
% Mamá
mujer(yolanda).
% Hermanas
mujer(delia).
mujer(angelica).
mujer(teresa).

%Abuelo
progenitor(petronilo,yolanda).
progenitor(petronilo,juan).
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


padre(P,H) :- progenitor(P,H), hombre(P).
madre(M,H) :- progenitor(M,H) , mujer(M).

hijo(H,P) :- progenitor(P,H) , hombre(H) ; progenitor(P,H) , mujer(H).

%Definir Abuelo
abuelas(A,N) :- progenitor(A,P), progenitor(P,N), mujer(A).
abuelo_pat(A,N) :- padre(A,P) , padre(P,N).
abuela_pat(A,N) :- madre(A,P) , padre(P,N).

%Definir Abuela
abuelos(A,N) :- progenitor(A,P), progenitor(P,N), hombre(A).
abuelo_mat(A,N) :- padre(A,M) , madre(M,N).
abuela_mat(A,N) :- madre(A,M) , madre(M,N).

abuelos_pat(Ao,Aa,N) :- abuelo_pat(Ao,N) , abuela_pat(Aa,N).