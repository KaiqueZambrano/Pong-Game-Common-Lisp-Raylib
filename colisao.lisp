(in-package :pong-game)

(defmethod detecta-colisao ((b Bola) (j Jogador))
                                        ; precisa inverter componente y
  (if (and (> (+ (x b) 7.5) (x j))
           (< (- (x b) 7.5) (+ (x j) 100)))
      (setf (v b) (* -1 (v b))))

                                        ; precisa inverter componente x
  (if (and (> (+ (y b) 7.5) (y j))
           (< (- (y b) 7.5) (+ (y j) 15)))
      (setf (v b) (* -1 (v b)))))

