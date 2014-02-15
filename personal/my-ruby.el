(add-to-list 'load-path (expand-file-name (concat prelude-vendor-dir "emacs-rails/")))
(add-to-list 'load-path (expand-file-name (concat prelude-vendor-dir "rhtml/")))
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.podspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . enh-ruby-mode))

(add-to-list 'auto-mode-alist '("\\.js\\.erb$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.coffee\\.erb$" . coffee-mode))

(setq ruby-program "~/.rbenv/shims/ruby")
(setq enh-ruby-program "~/.rbenv/shims/ruby")

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
