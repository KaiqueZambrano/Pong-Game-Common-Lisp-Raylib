(in-package :pong-game)

(defclass Bola ()
  ((x :initarg :x
      :accessor x)
   (y :initarg :y
      :accessor y)
   (vx :initarg :vx
       :accessor vx)
   (vy :initarg :vy
       :accessor vy)
   (a :initarg :a
      :accessor a)))

(defparameter *bola*
  (make-instance 'Bola :x 400 :y 300 :vx 12 :vy 12 :a 45))

(defmethod setPos ((b Bola) x y)
  (setf (x b) x)
  (setf (y b) y))

(defmethod atualiza-bola ((b Bola))
  (setf (x b) (+ (x b) (converte-velocidade-x (vx b) (a b))))
  (setf (y b) (+ (y b) (converte-velocidade-y (vy b) (a b))))

                                        ; bate na parede *precisa atualizar componente x*
  (if (or (<= (x b) 7.5)
          (>= (x b) (- 800 7.5)))
      (setf (vx b) (* -1 (vx b))))

                                        ; bate na parede *precisa atualizar componente y*
  (if (or (<= (y b) 7.5)
          (>= (y b) (- 600 7.5)))
      (setf (vy b) (* -1 (vy b)))))

(defun desenha-bola ()
  (draw-circle (truncate (x *bola*)) (truncate (y *bola*)) 7.5 :green))
