(global-subword-mode)

(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(server-start)

(guru-mode -1)
(whitespace-mode -1)
