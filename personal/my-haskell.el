(autoload 'ghc-init "ghc" nil t)

(add-to-list 'auto-mode-alist '(".xmobarrc" . haskell-mode))

(add-hook 'haskell-mode-hook
          (lambda ()
            (turn-on-haskell-indentation)
            (turn-on-haskell-decl-scan)
            (turn-on-haskell-doc-mode)
            (ghc-init)))
