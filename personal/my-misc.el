(global-subword-mode)

(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(server-start)

(setenv "SHELL" "/bin/zsh")
(setq shell-file-name "zsh")

(require 'linum)

(setq linum-format "%d ")
;(global-linum-mode)
(server-start)

(add-hook 'prog-mode-hook
          (lambda ()
            (whitespace-turn-off)
            (turn-off-guru-mode)
            (guru-mode -1)
            (auto-fill-mode -1)
            (linum-mode))
          t)
