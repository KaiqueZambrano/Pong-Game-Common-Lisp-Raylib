(in-package :pong-game)

(defun graus-para-radianos (graus)
  (* graus (/ pi 180)))

(defun converte-velocidade-x (v a)
  (* v (cos (graus-para-radianos a))))

(defun converte-velocidade-y (v a)
  (* v (sin (graus-para-radianos a))))

(defmethod detecta-colisao ((b Bola) (j Jogador))
  (and (> (+ (x b) 7.5) (x j))
       (< (- (x b) 7.5) (+ (x j) 100))
       (> (+ (y b) 7.5) (y j))
       (< (- (y b) 7.5) (+ (y j) 15))))

(defmethod resolve-colisao ((b Bola) (j Jogador))
  (when (and (> (+ (x b) 7.5) (x j))
             (< (- (x b) 7.5) (+ (x j) 100)))
    (setf (vy b) (* -1 (vy b))))

  (when (and (> (+ (y b) 7.5) (y j))
             (< (- (y b) 7.5) (+ (y j) 15)))
    (setf (vx b) (* -1 (vx b)))))

(defun colisao ()
  (when (detecta-colisao *bola* *jogador1*)
    (resolve-colisao *bola* *jogador1*))

  (when (detecta-colisao *bola* *jogador2*)
    (resolve-colisao *bola* *jogador2*)))
