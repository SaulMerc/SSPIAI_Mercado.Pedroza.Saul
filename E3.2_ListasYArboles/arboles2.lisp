;Saul Mercado Pedroza
;Listas de Pinturas
(setf oleo '(la_noche_estrellada la_ronda_de_noche golconda nighthawks monalisa la_joven_de_la_perla))
(setf acuarela '(puente_de_londres el_jardin_de_aves cocina_de_mujer_nativa_bahamas))
(setq goauche '(el_nino_con_el_perro el_interior_del_viejo_burgtheater))


;cdr oleo -> la_ronda_de_noche golconda nighthawks monalisa la_joven_de_la_perla
;caddr oleo -> Golconda
;car oleo -> La noche estrellada

;last goauche -> cocina de mujer nativa bahamas

(setq valor 'puente_de_londres) ;El no poner esa comilla simple al principio me costó 1 hora :'(
;Si encuentra el valor Puente de Londres retorna verdadero
(if (find valor acuarela :test #'equal)
    (format t "La pintura ~a se pinto en el estilo de acuarela" valor)
    (format t "La pintura ~a no fue pintada en el estilo de acuarela" valor)
)
;Unir dos listas
(setq mezcla(list oleo acuarela))
(format t "Se ha mezclado el oleo con la acuarela -> ~a" mezcla)

;Agregar un valor a una lista
(setq agregar 'El_Grito)
(if (find agregar oleo :test #'equal)
    (format t "El valor no puede ser agregado, ya existe")
    (setq oleo (cons agregar oleo))
    )
(format t "Se ha agregado ~a al estilo oleo" oleo)

;Ingreso de valores a una lista fija (pinturas)
;(pinturas)
(defun pinturas ()
    (format t "Ingreso de pinturas~%")
    (let ((pinturas (make-list 5 :initial-element nil))
        (continuar t)
        opcion)

    (loop
        (princ "Escribe el nombre de la pintura o salir: ")
        (setq opcion (read-line))

        (if (string= opcion "salir")
            (setq continuar nil)
            (setq pinturas (append pinturas (list opcion))))

        (if (not continuar) (return (format t "Sayonara, but i don't speak ITALIAN")))
        (format t "Lista actual: ~a~%" pinturas)))
)

;Pila - Push Pop
(defun pop-it (l)
	(setf l (cdr l))
)
