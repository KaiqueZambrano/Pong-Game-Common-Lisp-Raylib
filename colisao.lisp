(in-package :pong-game)

(defun graus-para-radianos (graus)
  (* graus (/ pi 180)))

(defun converte-velocidade-x (v a)
  (* v (cos (graus-para-radianos a))))

(defun converte-velocidade-y (v a)
  (* v (sin (graus-para-radianos a))))

(defmethod detecta-colisao ((b Bola) (j Jogador))
  (let ((rec1 (make-rectangle :x (truncate (x b)) :y (truncate (y b)) :width 100 :height 15))
        (rec2 (make-rectangle :x (truncate (x j)) :y (truncate (y j)) :width 100 :height 15)))
    (check-collision-recs rec1 rec2)))

(defmethod resolve-colisao ((b Bola) (j Jogador))
  (when (and (> (+ (x b) 7.5) (x j))
             (< (- (x b) 7.5) (+ (x j) 100)))
    (setf (vy b) (* -1 (vy b))))

  (when (and (> (+ (y b) 7.5) (y j))
             (< (- (y b) 7.5) (+ (y j) 15)))
    (setf (vx b) (* -1 (vx b)))))

(defmethod pontuacao ((b Bola))
  (cond ((>= (y b) 590) (pontuar *jogador1*))
        ((<= (y b) 10) (pontuar *jogador2*))))

(defun colisao ()
  (when (detecta-colisao *bola* *jogador1*)
    (resolve-colisao *bola* *jogador1*))
  
  (when (detecta-colisao *bola* *jogador2*)
    (resolve-colisao *bola* *jogador2*)))


