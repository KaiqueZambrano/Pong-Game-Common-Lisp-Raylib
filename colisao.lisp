(in-package :pong-game)

(defun ajuste ()
  (* -1 (get-random-value 0 1)))

(defmethod detecta-colisao ((b Bola) (j Jogador))
  (and (> (+ (x b) 7.5) (x j))
       (< (- (x b) 7.5) (+ (x j) 100))
       (> (+ (y b) 7.5) (y j))
       (< (- (y b) 7.5) (+ (y j) 15))))

(defmethod resolve-colisao ((b Bola) (j Jogador))
  (when (and (> (+ (x b) 7.5) (x j))
             (< (- (x b) 7.5) (+ (x j) 100)))
    (setf (vy b) (* -1 (vy b)))
    (setf (vx b) (+ (vx b) (ajuste))))
  
  (when (and (> (+ (y b) 7.5) (y j))
             (< (- (y b) 7.5) (+ (y j) 15)))
    (setf (vx b) (* -1 (vx b)))
    (setf (vy b) (+ (vy b) (ajuste)))))

(defun colisao ()
  (when (detecta-colisao *bola* *jogador1*)
    (resolve-colisao *bola* *jogador1*))

  (when (detecta-colisao *bola* *jogador2*)
    (resolve-colisao *bola* *jogador2*)))
