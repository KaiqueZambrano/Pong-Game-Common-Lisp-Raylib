(in-package :pong-game)

(defun entrada ()
  (let ((x1 (x *jogador1*))
        (x2 (x *jogador2*)))
    ; jogador 1
    (cond ((is-key-down :key-left) (set-jogador-x *jogador1* (- x1 20)))
          ((is-key-down :key-right) (set-jogador-x *jogador1* (+ x1 20))))
    ; jogador 2
    (cond ((is-key-down :key-a) (set-jogador-x *jogador2* (- x2 20)))
          ((is-key-down :key-d) (set-jogador-x *jogador2* (+ x2 20))))
    ; colisão parede
    (cond ((>= x1 700) (set-jogador-x *jogador1* 650))
          ((<= x1 0) (set-jogador-x *jogador1* 50))
          ((>= x2 700) (set-jogador-x *jogador2* 650))
          ((<= x2 0) (set-jogador-x *jogador2* 50)))))
