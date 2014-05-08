(add-to-list 'auto-mode-alist '(".scala" . scala-mode))
(add-to-list 'auto-mode-alist '(".sbt" . scala-mode))

(let ((ensime-root (expand-file-name "ensime/dist" prelude-vendor-dir)))
  (setq ensime-default-server-root ensime-root)
  (add-to-list 'exec-path ensime-root)
  (add-to-list 'load-path ensime-root))

(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.sbt$" . scala-mode))

;; Ensime & ECB
(require 'scala-mode2)
(require 'ensime)
(require 'assoc) ; for ECB compatibility
(require 'ecb)


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


(ecb-layout-define "right-my" right
  "This function creates the following layout:

   -------------------------------------------------------
   |                                      |              |
   |                                      |              |
   |                                      |              |
   |                                      |              |
   |                                      |              |
   |                                      |              |
   |                                      |              |
   |             Edit                     |  Methods     |
   |                                      |              |
   |                                      |              |
   |                                      |              |
   |                                      |              |
   |                                      |              |
   |                                      |              |
   |                                      |              |
   |                                      |              |
   |                                      |              |
   |                                      |              |
   -------------------------------------------------------

If you have not set a compilation-window in `ecb-compile-window-height' then
the layout contains no persistent compilation window and the other windows get a
little more place."
  (let ((edit-win (previous-window (selected-window) 0)))
    (ensime-set-type-inspector-tree-buffer)
    (select-window edit-win)))


(defun ensime-ecb ()
  (interactive)
  (ecb-activate)
  (ecb-layout-switch "right-my")
)

(custom-set-variables
 '(ensime-inf-cmd-template '("sbt" "console"))
 )

;; scala mode hooks
(defun scala-setup ()
  ;; turnoff indent tabs mode
  (setq indent-tabs-mode nil)
  (toggle-truncate-lines t)
  (show-paren-mode t)
  (electric-pair-mode t)
  (ido-mode t)
  (linum-mode t)
  )

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-hook 'scala-mode-hook 'scala-setup)
