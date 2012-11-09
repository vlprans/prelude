(add-to-list 'load-path (expand-file-name (concat prelude-vendor-dir "emacs-rails/")))
(add-to-list 'load-path (expand-file-name (concat prelude-vendor-dir "rhtml/")))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(add-to-list 'auto-mode-alist '("\\.js\\.erb$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.coffee\\.erb$" . coffee-mode))

(add-to-list 'load-path (concat prelude-vendor-dir "Enhanced-Ruby-Mode"))
(setq ruby-program "~/.rbenv/versions/1.9.3-p194/bin/ruby")
(setq enh-ruby-program "~/.rbenv/versions/1.9.3-p194/bin/ruby")

(require 'ruby-mode)

(require 'rails)
(require 'rhtml-mode)
(require 'ruby-tools)

(require 'rsense)
(require 'auto-complete)
(require 'linum)

(add-hook 'ruby-mode-hook
          (lambda ()
            (auto-complete-mode 1)
            (linum-mode 1)
            (local-set-key (kbd "C-c .") 'ac-complete-rsense)
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))
