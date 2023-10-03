%arbol(hijo_izq, raiz, hijo_der).

%preorden
%raiz, izq, der

%inorden
%izq, raiz, der

%posorden
%izq, der, raiz

%Nombre en inorden
arbol(a, arbol("M",arbol(a,"S",arbol(l,u,' ')),arbol(r,e,c)), arbol(d, arbol("P",arbol(o,d," "),e), arbol(a,arbol(o,r,z),"."))).

%Nombre preorden
arbol("S",arbol(a,arbol(u,arbol(l," ","M"),e),arbol(r,c,a)), arbol(d,arbol(o,arbol(" ","P",e),d),arbol(r,arbol(o,z,a),"."))).

%Nombre Postorden
arbol(".",arbol(c,arbol(" ",arbol(u,"S",a),l),arbol(r,"M",e)),arbol(a,arbol("P",arbol(o,a,d)," "), arbol(z,arbol(r,e,d),o))).

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