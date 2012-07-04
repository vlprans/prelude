(add-to-list 'load-path (expand-file-name (concat prelude-vendor-dir "emacs-rails/")))
(add-to-list 'load-path (expand-file-name (concat prelude-vendor-dir "rhtml/")))
(require 'rails)
(require 'rhtml-mode)

(require 'rsense)

(add-hook 'ruby-mode-hook
          (lambda ()
            (auto-complete-mode 1)
            (local-set-key (kbd "C-c .") 'ac-complete-rsense)
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))
