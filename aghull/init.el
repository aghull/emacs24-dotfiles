(starter-kit-load "misc-recommended")
(starter-kit-load "org")
(let ((default-directory "~/.emacs.d/vendor/")) (normal-top-level-add-subdirs-to-load-path))

(dolist (package '(auto-complete popup col-highlight vline crosshairs exec-path-from-shell flycheck let-alist pkg-info epl dash hl-line+ haml-mode jump inflections findr let-alist magit markdown-mode maxframe php-mode pkg-info epl dash popup python-mode rainbow-mode rvm ruby-hash-syntax vline web-mode yaml-mode yasnippet-bundle zenburn-theme zencoding-mode find-file-in-project))
  (unless (package-installed-p package)
    (package-install package)))

(require 'auto-complete)
(global-auto-complete-mode t)

(add-hook 'after-init-hook 'global-flycheck-mode)
(setq flycheck-highlighting-mode 'lines)
(setq temporary-file-directory "~/.emacs.d/tmp/")

(setq ido-use-filename-at-point nil)
(setq ffip-prefer-ido-mode t)
(setq ffip-prune-patterns '(*/.git/* */.svn/* */.cvs/* */.bzr/* */.hg/* *.log */bin/* */.DS_Store/* */tags */TAGS */GTAGS */GPATH */GRTAGS */cscope.files */.npm/* */.tmp/* */.sass-cache/* */.idea/* *min.js *min.css */node_modules/* */bower_components/* *.png *.jpg *.jpeg *.gif *.bmp *.tiff *.ico *.doc *.docx *.pdf *.obj *.o *.a *.dylib *.lib *.d *.dll *.exe */.metadata* */.gradle/* *.class *.war *.jar *flymake */\#*\# .\#* *.swp *~ *.elc */.cask/* *.pyc */vendor/* */tmp/*))

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
(add-hook 'before-save-hook 'whitespace-cleanup)
(defadvice whitespace-cleanup (around whitespace-cleanup-indent-tab
                                      activate)
  "Fix whitespace-cleanup indent-tabs-mode bug"
  (let ((whitespace-indent-tabs-mode indent-tabs-mode)
        (whitespace-tab-width tab-width))
    ad-do-it))
(global-set-key (kbd "M-/") 'dabbrev-expand)

(add-hook 'html-mode-hook 'turn-off-auto-fill)
(add-hook 'rhtml-mode-hook 'turn-off-auto-fill)
(defun open-line-at-start () (interactive) (beginning-of-line) (open-line 1) (indent-according-to-mode))
(global-set-key (kbd "C-S-o") 'open-line-at-start)

(global-set-key (kbd "s-o") 'ffip)

(require 'revbufs)
(global-set-key (kbd "s-r") 'revbufs)

;; theme & colors
(load-theme 'wombat2 t)
(global-hl-line-mode)

;; ec server
(setq ns-pop-up-frames nil)
(desktop-save-mode 1)

;; mac osx shell
(when (memq window-system '(mac ns)) (exec-path-from-shell-initialize))

(setq search-whitespace-regexp nil)
(setq create-lockfiles nil) ;; just to avoid watch issues - sigh
