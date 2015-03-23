(starter-kit-load "misc-recommended")
(starter-kit-load "org")
(let ((default-directory "~/.emacs.d/vendor/")) (normal-top-level-add-subdirs-to-load-path))

;; debug/editing help
;;(require 'flymake-cursor)
(setq flymake-allowed-file-name-masks nil) ;; turn off flymake

(require 'auto-complete)
(global-auto-complete-mode t)

;; do not make flymake files in situ
;;(setq flymake-run-in-place nil)
(add-hook 'after-init-hook 'global-flycheck-mode)
(setq temporary-file-directory "~/.emacs.d/tmp/")

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
(delete-selection-mode)
(global-set-key (kbd "M-/") 'dabbrev-expand)
(add-hook 'html-mode-hook 'turn-off-auto-fill)
(add-hook 'rhtml-mode-hook 'turn-off-auto-fill)


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

(setq search-whitespace-regexp nil)
