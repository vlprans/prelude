(require 'clojure-mode)
(require 'cider)

(add-hook 'clojure-mode-hook (lambda ()
                               (company-mode 1)
                               (clj-refactor-mode 1)
                               (paredit-mode 1)
                               (yas-minor-mode -1)
                               (rainbow-delimiters-mode 1)
                               (subword-mode 1)))


(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))

(setq cider-cljs-lein-repl
      "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")
