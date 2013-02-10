; shows two grids, one at the initial transformation, the other after 5 translations/rotations
(define spheres
  (lambda (n)
    (push)
        (scale (sin n))
        (scale 0.15 0.15 0.15)
        (color (hsv (* (cos (/ n 10)) 360)))
        (draw-sphere)
    (pop)
    ; (scale 0.15 0.15 0.15)
    (rotate 30 (vector 0 0.5 (cos (* (/ (secs) 10) 10))))
    (translate (vector 0.1 0 (* (sin (secs)) 0.1)))
    (if (> n 0) (spheres (- n 1)))
  )
)
(define every-frame
  (lambda ()
    (scale 0.5)
    (rotate -45 x-axis)
    (spheres 20)))
