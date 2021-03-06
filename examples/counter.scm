; Return a list containing numbers from 0 to n
(define (range n)
    (if (> n 0)
        (append (range (- n 1)) (list n))
        '(0)))

; Load textures from 0 to 15
(define numbers
    (map (lambda (n)
        (load-texture (string-append "examples/img/number-" (number->string n) ".png"))
        )
    (range 15)))

(define (draw-digit num fac base)
    (let ((f (/ num fac)))
      (let ((n (% (floor f) base))
            (r (- f (floor f))))
          (push)
          (let ((rot (* (- r (- 1 (/ 1 (* 1.5 fac)))) (* fac 1.5))))
            (rotate (* (min (max (expt rot 3) 0) 1) 90) x-axis))
          (push)
              (translate (vector 0 0 1))
              (texture (list-ref numbers n))
              (draw-plane)
          (pop)
          (push)
              (texture (list-ref numbers (% (+ n 1) base)))
              (translate (vector 0 1 0))
              (rotate -90 x-axis)
              (draw-plane)
          (pop)
          (push)
              (texture (list-ref numbers (% (- n 1) base)))
              (translate (vector 0 -1 0))
              (rotate 90 x-axis)
              (draw-plane)
          (pop)
          (pop)
      )))
(define (draw-number c base)
  (push)
    (map (lambda (n)
      (draw-digit c (expt base n) base)
      (translate (vector 2 0 0))
      )
         (range 8))
  (pop)
    )

; Remember secs
(define start-secs (secs))

(define (every-frame)
  (let ((n (- (secs) start-secs)))
    (scale 0.15)
    (rotate (* 2 (sin (secs))) y-axis)
    (translate (vector -8 0 0))
    (draw-number n 10)
    (translate (vector 0 -3 0))
    (draw-number n 2)
    (translate (vector 0 6 0))
    (draw-number n 16)))
