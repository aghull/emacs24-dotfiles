

(require 'rvm)
(rvm-use-default)

;; rhtml
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . rhtml-mode))

(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))

(add-to-list 'completion-ignored-extensions ".rbc")

(eval-after-load 'ruby-mode
  '(progn
     (ignore-errors (require 'ruby-compilation))
     (setq ruby-use-encoding-map nil)
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)
     (define-key ruby-mode-map (kbd "C-c l") "lambda")
     (define-key ruby-mode-map (kbd "C-x C-t") 'transpose-lines) ;; restore transpose-lines key
     (define-key ruby-mode-map [\C-\s-left] 'ruby-beginning-of-block)
     (define-key ruby-mode-map [\C-\s-right] 'ruby-end-of-block)))

(setq rinari-major-modes
      (list 'mumamo-after-change-major-mode-hook 'dired-mode-hook 'ruby-mode-hook
            'css-mode-hook 'yaml-mode-hook 'javascript-mode-hook))
