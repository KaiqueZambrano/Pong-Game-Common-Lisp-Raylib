(ql:quickload "cl-raylib")

(defpackage :pong-game
            (:use :cl :cl-raylib))

(load "jogadores.lisp")
(load "bola.lisp")
(load "entrada.lisp")

(in-package :pong-game)

(defun main ()
  (let ((screen-width 800)
        (screen-height 600)
        (target-fps 20)
        (title "PONG-GAME"))
    (with-window (screen-width screen-height title)
                 (set-target-fps target-fps)
                 (loop until (window-should-close)
                       do (with-drawing (clear-background :raywhite)
                                        (desenha-jogadores)
                                        (desenha-bola)
                                        (entrada))))))
(main)
