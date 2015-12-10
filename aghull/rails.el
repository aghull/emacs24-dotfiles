(starter-kit-load "ruby")

(require 'rvm)
(rvm-use-default)

;; rhtml
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))

;; restore transpose-lines key
(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "C-x C-t") 'transpose-lines)
     (define-key ruby-mode-map [\C-\s-left] 'ruby-beginning-of-block)
     (define-key ruby-mode-map [\C-\s-right] 'ruby-end-of-block)))
