(starter-kit-load "misc-recommended")
(starter-kit-load "org")
(let ((default-directory "~/.emacs.d/vendor/")) (normal-top-level-add-subdirs-to-load-path))

;; debug/editing help
(require 'flymake-cursor)
(require 'auto-complete)
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
(define-key global-map [\M-up] 'backward-paragraph)
(define-key global-map [\M-down] 'forward-paragraph)
(define-key global-map [\s-left] 'beginning-of-line)
(define-key global-map [\s-right] 'end-of-line)
(define-key global-map [\C-tab] 'indent-rigidly)
(define-key global-map [\C-\S-tab] 'indent-rigidly-back)
(defun indent-rigidly-back () (interactive) (indent-rigidly (region-beginning) (region-end) -1))
(setq shift-select-mode t)
(delete-selection-mode 1)
(global-set-key (kbd "M-/") 'dabbrev-expand)

(require 'revbufs)
(global-set-key (kbd "s-r") 'revbufs)

;; theme & colors
(load-theme 'wombat t)
(global-hl-line-mode)

;; ec server
(server-start)
(desktop-save-mode 1)

;; mac osx shell
(when (memq window-system '(mac ns)) (exec-path-from-shell-initialize))
