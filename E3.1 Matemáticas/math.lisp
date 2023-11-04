; Fibonacci
(defun fibo (n)
    (cond ((= n 0) 1)
        ((= n 1) 1)
        (t(+(fibo (- n 1)) (fibo (- n 2))))
    )
)

;Teorema de Pitagoras
(defun pitagoras (a b)
    (princ "El valor de la hipotenusa es ")
    (write (sqrt ( + (* a a) (* b b) )) )
    )