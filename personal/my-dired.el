(add-hook 'dired-mode-hook
          (lambda () (progn
                       (setq dired-dwim-target t))))
