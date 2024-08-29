(in-package :pong-game)

(defstruct jogador x y)
(setq j1 (make-jogador :x 400 :y 30))
(setq j2 (make-jogador :x 400 :y 550))

(defun desenha-jogadores ()
  (draw-rectangle (jogador-x j1) (jogador-y j1) 100 15 :red)
  (draw-rectangle (jogador-x j2) (jogador-y j2) 100 15 :black))
