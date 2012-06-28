(global-subword-mode)

(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(server-start)

(add-hook 'prog-mode-hook
          (lambda ()
            (prelude-turn-off-whitespace)
            (guru-mode -1))
          t)
