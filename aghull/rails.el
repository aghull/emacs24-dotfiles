(starter-kit-load "ruby")

(require 'rvm)
(rvm-use-default)

;; rinari
(require 'rinari)

;; rhtml
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . rhtml-mode))

;; restore transpose-lines key
(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "C-x C-t") 'transpose-lines)))
