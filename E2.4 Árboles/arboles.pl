%arbol(hijo_izq, raiz, hijo_der).

%preorden - Prefija
%raiz, izq, der

%inorden - Infinja
%izq, raiz, der

%posorden - Posfija
%izq, der, raiz

%Nombre en inorden
arbol(a, arbol("M",arbol(a,"S",arbol(l,u,' ')),arbol(r,e,c)), arbol(d, arbol("P",arbol(o,d," "),e), arbol(a,arbol(o,r,z),"."))).

%Nombre preorden
arbol("S",arbol(a,arbol(u,arbol(l," ","M"),e),arbol(r,c,a)), arbol(d,arbol(o,arbol(" ","P",e),d),arbol(r,arbol(o,z,a),"."))).

%Apellido preorden
arbol("M",arbol(e,arbol(r,c,a),arbol(d,o," ")),arbol(0,arbol(5,1,6),arbol(0,2,"B"))).

%Nombre y apellido Postorden
arbol(".",arbol(c,arbol(" ",arbol(u,"S",a),l),arbol(r,"M",e)),arbol(a,arbol("P",arbol(o,a,d)," "), arbol(z,arbol(r,e,d),o))).
arbol(")",arbol(e,arbol(u,"S",a),arbol("M",l," ")),arbol(";",arbol(a,r,c),arbol(" ",d,o))).
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

%Impresiones de valores aritméticos
inordenAr(arbol1(Raiz,Hizq,Hder)):- write('('),inordenAr(Hizq),
                                write(Raiz), write(' '),
                                inordenAr(Hder), write(')').
inordenAr(H):- write(H).

arbol1('+',arbol1('x',3,5),arbol1('-',2,5)).
arbol1('*', arbol1('+',arbol1('*',3,5),arbol1('-',2,5)),3).

preordenAr(arbol1(Raiz,Hizq,Hder)):- write('('), write(Raiz), preordenAr(Hizq), write(' '), preordenAr(Hder), write(')').
preordenAr(H):- write(H).

%Árboles Ternarios

%arbolT(Raiz,Hizq,Hcen,Hder).
%Inorden: HI, R, HD, HD.
%Preorden: R, HI, HC, HD. 
%Postorden: HI, HC, HD, R.

%%Recorrido de árboles Ternarios%%
%inorden
inordenT(arbolT(Raiz,Hizq,Hcen,Hder)):- inordenT(Hizq),write(Raiz),inordenT(Hcen),inordenT(Hder).
inordenT(H):- write(H).
%preorden
preordenT(arbolT(Raiz,Hizq,Hcen,Hder)):- write(Raiz), preordenT(Hizq), preordenT(Hcen), preordenT(Hder).
preordenT(H):- write(H).

%Post orden
postordenT(arbolT(Raiz,Hizq,Hcen,Hder)):- postordenT(Hizq), postordenT(Hcen), postordenT(Hder), write(Raiz).
postordenT(H):- write(H).

%Nombre árbol Ternario en preorden
arbolT("S",arbolT(a,arbolT(u,l," ","M"),e,r),arbolT(c,arbolT(a,d,o," "),"P",e),arbolT(d,arbolT(r,o,z,a),"","")).