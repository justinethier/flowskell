(define dim 8)
(define col
  (lambda (n r)
    (translate (vector 1.0 0.0 0.0))
    (color (vector (/ (sin (/ (secs) 10.0)) 1.0) (cos (/ n 10.0)) (- 0.3 (/ (sin (* (/ (secs) 8.0) n)) 3.0))))
    (push)
        (scale 0.3 0.3 (/ (* (- n 4.5) (- n 4.5)) 10.0))
        (make-cube)
    (pop)
    (if (> n 1) (col (- n 1) r))
  )
)
(define row
  (lambda (n)
    (translate (vector 0.0 1.0 0.0))
    (push)
    (col dim n)
    (pop)
    (if (> n 1) (row (- n 1)))
  )
)
(define every-frame
  (lambda ()
    (translate (vector 0.0 0.1 0.0))
    (rotate -30.0 x-axis)
    (rotate (/ (msecs) 60.0) z-axis)
    (scale 0.5)
    (make-grid)
    (scale 0.25)
    (translate (vector (- (/ dim -2.0) 0.5) (- (/ dim -2.0) 0.5) 0.0))
    (row dim)))
