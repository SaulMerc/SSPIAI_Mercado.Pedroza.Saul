%arbol(hijo_izq, raiz, hijo_der).

%preorden
%raiz, izq, der

%inorden
%izq, raiz, der

%posorden
%izq, der, raiz

%preorden
arbol(a, arbol(e,i,o), u).

%inorden
inorden(arbol(Raiz,Hizq,Hder)):- inorden(Hizq),
                                write(Raiz),
                                inorden(Hder).
inorden(H):- write(H).

%preorden
preorden(arbol(Raiz,Hizq,Hder)):- write(Raiz), preorden(Hizq), preorden(Hder).
preorden(H):- write(H).

%Post orden
postorden(arbol(Raiz,Hizq,Hder)):- postorden(Hizq), postorden(Hder), write(Raiz).
postorden(H):- write(H).