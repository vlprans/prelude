(add-to-list 'auto-mode-alist '(".scala" . scala-mode))
(add-to-list 'auto-mode-alist '(".sbt" . scala-mode))

(add-to-list 'load-path (expand-file-name "scamacs/ecb" prelude-vendor-dir))
(add-to-list 'load-path (expand-file-name "scamacs/scala" prelude-vendor-dir))
(add-to-list 'load-path (expand-file-name "scamacs/scamacs" prelude-vendor-dir))
(add-to-list 'load-path (expand-file-name "scamacs/ensime/dist_2.9.2/elisp" prelude-vendor-dir))
(add-to-list 'exec-path (expand-file-name "scamacs/ensime/dist_2.9.2/bin" prelude-vendor-dir))

;; (add-to-list 'load-path (expand-file-name "ensime/elisp" prelude-vendor-dir))
;; (add-to-list 'exec-path "ensime/bin")

(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.sbt$" . scala-mode))

;; Ensime & ECB
(require 'scala-mode)
(require 'ensime)
(require 'ecb)
(require 'ensime-tree-type-inspector)
(require 'ensime-tree-package-inspector)


(ecb-layout-define "leftright-my" left-right
  "This function creates the following layout:

   --------------------------------------------------------------
   |              |                               |             |
   |  Directories |                               |             |
   |              |                               |             |
   |              |                               |             |
   |              |                               |             |
   |              |                               |             |
   |              |                               |             |
   |--------------|             Edit              |             |
   |              |                               |             |
   |  Sources     |                               |             |
   |              |                               |             |
   |--------------|                               |  Analyse    |
   |              |                               |             |
   |  History     |                               |             |
   |              |                               |             |
   --------------------------------------------------------------
   |                                                            |
   |                    Compilation                             |
   |                                                            |
   --------------------------------------------------------------

If you have not set a compilation-window in `ecb-compile-window-height' then
the layout contains no persistent compilation window and the other windows get a
little more place."
  (ecb-set-directories-buffer)
  (ecb-split-ver 0.4)
  (ecb-set-sources-buffer)
  (ecb-split-ver 0.5)
  (ecb-set-history-buffer)
  (select-window (next-window (next-window)))
  ;(ensime-set-package-inspector-tree-buffer)
  ;(ecb-split-ver 0.5)
  (ensime-set-type-inspector-tree-buffer)
  (select-window (previous-window (previous-window (selected-window) 0) 0)))

(defun ensime-ecb ()
  (interactive)
  (ecb-activate)
  (ecb-layout-switch "leftright-my")
  (ensime)
)


;; scala mode hooks
(defun scala-setup ()
  ;; turnoff indent tabs mode
  (setq indent-tabs-mode nil)
  (toggle-truncate-lines t)
  (show-paren-mode t)
  (ido-mode t)
  )

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-hook 'scala-mode-hook 'scala-setup)

