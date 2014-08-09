(elpy-enable)

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(setq venv-location "/Users/vlprans/Envs")

(add-hook 'python-mode-hook
          #'(lambda ()
              (electric-pair-mode t)
              (column-enforce-mode t)
              ))
