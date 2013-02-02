(starter-kit-load "misc-recommended")
(starter-kit-load "org")
(starter-kit-load "js")
(starter-kit-load "ruby")
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(require 'flymake-cursor)
(global-auto-complete-mode t)

;; i still think i hate ido but will try with some things turned off
(setq ido-use-filename-at-point nil)

;; always popup vertical window split
(setq split-height-threshold 0)
(setq split-width-threshold nil)
(menu-bar-mode)

;; open maximized
(require 'maxframe)
(setq mf-display-padding-height 100)
(add-hook 'window-setup-hook 'maximize-frame t)

;; navigation
(define-key global-map [\s-up] 'beginning-of-buffer)
(define-key global-map [\s-down] 'end-of-buffer)
(define-key global-map [\s-left] 'beginning-of-line)
(define-key global-map [\s-right] 'end-of-line)
(define-key global-map [\C-tab] 'indent-rigidly)
(define-key global-map [\C-\S-tab] 'indent-rigidly-back)
(defun indent-rigidly-back () (interactive) (indent-rigidly (region-beginning) (region-end) -1))

;; shift-selection
(setq shift-select-mode t)
