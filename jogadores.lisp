(in-package :pong-game)

(defclass Jogador ()
  ((x :initarg :x
      :accessor x)
   (y :initarg :y
      :accessor y)
   (p :initarg :p
      :accessor p)))

(defparameter *jogador1*
  (make-instance 'Jogador :x 350 :y 30 :p 0))

(defparameter *jogador2*
  (make-instance 'Jogador :x 350 :y 550 :p 0))

(defmethod set-jogador-x ((j Jogador) x)
  (setf (x j) x))

(defmethod pontuar ((j Jogador))
  (setf (p j) (+ 1 (p j))))

(defmethod desenha-pontuacao-1 ((j Jogador))
  (draw-text (format nil "~A" (p j)) 10 10 20 :red))

(defmethod desenha-pontuacao-2 ((j Jogador))
  (draw-text (format nil "~A" (p j)) 10 570 20 :black))

(defun desenha-jogadores ()
  (draw-rectangle (x *jogador1*) (y *jogador1*) 100 15 :red)
  (draw-rectangle (x *jogador2*) (y *jogador2*) 100 15 :black))
