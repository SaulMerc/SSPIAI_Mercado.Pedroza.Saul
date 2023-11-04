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

;Fórmula general
(defun formCuad (a b c)
        (let ((resul1 (/ (+ (- b) (sqrt (-(* b b)(* 4 a c)))) (* 2 a)))
        )(format t "El primer resultado es: ~d" resul1))
        (write-line "")
        (let ((resul2 (/ (- (- b) (sqrt (-(* b b)(* 4 a c)))) (* 2 a))))
        (format t "El segundo resultado es: ~d" resul2))
)