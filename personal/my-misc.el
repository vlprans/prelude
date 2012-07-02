(global-subword-mode)

(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(server-start)

(setenv "SHELL" "/bin/zsh")
(setq shell-file-name "zsh")

(add-hook 'prog-mode-hook
          (lambda ()
            (prelude-turn-off-whitespace)
            (guru-mode -1)
            (linum-mode 1))
          t)
