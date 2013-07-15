(require 'hamlet-mode)

(add-to-list 'auto-mode-alist '(".xmobarrc" . haskell-mode))
(add-to-list 'auto-mode-alist '(".lhs" . haskell-mode))

(add-hook 'haskell-mode-hook
          (lambda ()
            (turn-on-haskell-indentation)
            (turn-on-haskell-decl-scan)
            (turn-on-haskell-doc-mode)
            (ghc-init)))
