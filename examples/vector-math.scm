; demonstrate vector math, vadd, vmul, vrnd
(define (every-frame)
    (scale 0.5)
    (rotate -45.0 x-axis)
    (draw-grid)
    (color (vadd (vmul 0.5 blue) (vmul (abs (cos (secs))) red)))
    (draw-line origin (vmul (sin (secs)) (vrnd)))
    (draw-line origin (vmul (sin (secs)) (vrnd)))
    (draw-line origin (vmul (sin (secs)) (vrnd)))
    (draw-line origin (vmul (sin (secs)) (vrnd)))
    (draw-line origin (vmul (sin (secs)) (vrnd)))
    (draw-line origin (vmul (sin (secs)) (vrnd)))
    (draw-line origin (vmul (sin (secs)) (vrnd)))
    )
