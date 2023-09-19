%Clase 11/09/2023
%Recusrsividad
%condición de salida

factorial(0,1).
factorial(N,F) :- N>0, N1 is N-1, factorial(N1,F1), F is N*F1.

fibonacci(0,0).
fibonacci(1,1).
fibonacci(P,V) :- P>1, P1 is P-1, fibonacci(P1,V1), P2 is P-2, fibonacci(P2,V2), V is V1+V2.
