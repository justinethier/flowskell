; shows two grids, one at the initial transformation, the other after 5 translations/rotations
(define cubes
  (lambda (n)
    (push)
        (color gray)
        (scale 0.15 0.15 0.01)
        (make-cube)
    (pop)
    (rotate (* (sin (secs)) 20) (vector 0.0 0.5 (cos (* (/ (secs) 10.0) 10))))
    (translate (vector 0.0 0.0 (* (sin (secs)) 0.1)))
    (if (> n 0) (cubes (- n 1)))
  )
)
(define every-frame
  (lambda ()
    (scale 0.5)
    (rotate -45.0 x-axis)
    (make-grid)
    (cubes 5)
    (make-grid)))
