(in-package :pong-game)

(defclass Bola ()
  ((x :initarg :x
      :accessor x)
   (y :initarg :y
      :accessor y)))

(defparameter *bola*
              (make-instance 'Bola :x 400 :y 300))

(defmethod setPos ((b Bola) x y)
           (setf (x b) x)
           (setf (y b) y))

(defun desenha-bola ()
  (draw-circle (x *bola*) (y *bola*) 15.0 :green))
