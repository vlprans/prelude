(global-subword-mode)

(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(server-start)

(setenv "SHELL" "/bin/zsh")
(setq shell-file-name "zsh")

(setq prelude-guru nil)

(require 'linum)
(setq linum-format "%d ")
;(global-linum-mode)
(server-start)

(add-hook 'prog-mode-hook
          (lambda ()
            (whitespace-turn-off)
            (auto-fill-mode -1)
            (linum-mode))
          t)

(setq projectile-completion-system 'grizzl)

(ido-mode t)
