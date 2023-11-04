;Common LISP
; List Processing
(write-line "Hola Mundo")

(defun cuadrado (x) (* x x))

(defun patito ()
    (setq variable (read))
    (print variable)
)

(defun compa (x y)
    (if (> x y)
    (format t "~d Es mayor" x)
    (format t "~d Es mayor" y)
    )
)

(defun algo (x)
    (case x
    (1 (princ "Enero"))
    (2 (princ "Febrero"))
    )
)

(defun ciclo (inicio fin aum)
    (loop
        (write inicio)
        (setq inicio (+ inicio aum))
        (terpri )
            (when (>= inicio fin)
                (return inicio)
            )
    )
)

(setf (symbol-function 'cuad)
    (lambda (x) (* x x))
)

(defun factorial (n)
    (if (> n 1)
        (* n (factorial( - n 1)))
    1)
)

;3.2 listas y arboles

(setf lista '(1 2 3 4 5))
(setf lista2 '(a b c d e))
(setf lista3 '(1 2 3 a b c))
(setf lista4 '())
(setf listc (list lista (cons lista3 lista3)))


;CAR: Contents of the Address part of Register number

;CDR: Contents of the Decrement part of Register number

;cons 'f lista2 //agrega el elemento a la lista
;cons 'car lista2 //regresa el primer elemento de la lista
;cons 'cdr lista2 //regresa el resto de la lista 
;member 1 lista3 //retorna todos los elementos a partir de el buscado
;append lista2 lista3 //agrega el resto de elementos a al lista
;list lista3 // da los elementos de la lista
;first, second, third, fourth, ..., Rest, Last
;nth 4 lista //da el elemento de la posici�n se�alada


;(1,2,3,a,b,c)
;car (cdr (cdr lista3)) //retorna el 3


; // sacamos el elemento A de listc
;cdr listc
;cadr listc
;caadr listc
;cadddr (caadr listc)

;Pila - Push Pop
(defun pop-it (l)
	(setf l (cdr l))
)

; # para referirnos a todos los elementos de la lista

;sort, mapcar, reduce, remove-if, count-if
(setf l '(5 1 4 8 6 8 4 3))
(sort l #'>)
(sort l #'<)

(setf s (copy-seq "fadsfsga"))
(sort s #'char-lessp)
(sort s #'char-not-lessp)

(write
 (mapcar #' (lambda (x)(* 2 x)) 
 	lista))
	
;format t, write, write-line, print, princ
;read, read-line, read-char

;Lista de propiedades
(setf (get 'libro 'titulo) "El principito")
(setf (get 'libro 'anio) 1943)
(setf (get 'libro 'autor) "Antoine de Saint-Exupery")

; symbol-plist 'libro  //para ver las propiedades del libro
