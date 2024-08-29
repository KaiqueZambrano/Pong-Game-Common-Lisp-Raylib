(in-package :pong-game)

(defclass Bola ()
  ((x :initarg :x
      :accessor x)
   (y :initarg :y
      :accessor y)
   (v :initarg :v
      :accessor v)))

(defparameter *bola*
  (make-instance 'Bola :x 400 :y 300 :v 40))

(defmethod setPos ((b Bola) x y)
  (setf (x b) x)
  (setf (y b) y))

(defmethod atualiza-bola ((b Bola))
  (setf (x b) (+ (x b) (v b)))
  (setf (y b) (+ (y b) (v b)))

                                        ; bate na parede *precisa atualizar componente x*
  (if (or (<= (x b) 7.5)
          (>= (x b) (- 800 7.5)))
      (setf (v b) (* -1 (v b))))

                                        ; bate na parede *precisa atualizar componente y*
  (if (or (<= (y b) 7.5)
          (>= (y b) (- 600 7.5)))
      (setf (v b) (* -1 (v b)))))

(defun desenha-bola ()
  (draw-circle (x *bola*) (y *bola*) 7.5 :green))
