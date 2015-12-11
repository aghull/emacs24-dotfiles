(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-script-padding 2)
(setq web-mode-enable-auto-quoting nil)

(require 'flycheck)

(flycheck-add-mode 'javascript-eslint 'web-mode)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode)) - hangs???
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.json5?\\'" . js-mode))

(add-hook 'web-mode-hook
          (lambda () (modify-syntax-entry ?_ "_")))

(font-lock-add-keywords 'web-mode
                        '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
                           1 font-lock-warning-face t)))
