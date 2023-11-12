;Representaciones de Árboles mediante listas 

;Listas de cons
;Estructura: (setf arbol(cons 'raiz(cons 'izq(cons 'der nil))))
(setf pinturas (cons 'pinturas(cons 'acrilico (cons 'la_joven_de_la_perla (cons 'nighthawks (cons 'acuarela (cons 'jardin_de_aves (cons 'puente_de_londres nil))))) )))

;Listas Anidadas
;Estructura: (setf arbol '(raiz (izqR (izq der) rder(izq der))))
(setf arbol '(i (d (e(f (m nil) b(c nil)) a) a(e (f (m nil) b(c nil)) b ((e nil) (c nil))))))

(write arbol)

;Funcion que imprime el arbol estilo CONS
(defun print-cons-tree (tree)
    (cond
    ((null tree) nil)
    (t
    (format t "~a " (car tree))
    (print-cons-tree (cdr tree))
    )
    )
)

(print-cons-tree pinturas)

(defun preord (a)
  (if (endp a)
      nil
      (append (postord (second (second a))) ;; Recorrer el subárbol izquierdo
              (postord (first (second a)))   ;; Recorrer el subárbol derecho
              (list (first a))))) 