(in-package :pong-game)

(defclass Jogador ()
  ((x :initarg :x
      :accessor x)
   (y :initarg :y
      :accessor y)))

(defparameter *jogador1*
  (make-instance 'Jogador :x 350 :y 30))

(defparameter *jogador2*
  (make-instance 'Jogador :x 350 :y 550))

(defmethod set-jogador-x ((j Jogador) x)
  (setf (x j) x))

(defun desenha-jogadores ()
  (draw-rectangle (x *jogador1*) (y *jogador1*) 100 15 :red)
  (draw-rectangle (x *jogador2*) (y *jogador2*) 100 15 :black))
