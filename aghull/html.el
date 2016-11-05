(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-script-padding 2)
(setq web-mode-enable-auto-quoting nil)
(setq web-mode-attr-indent-offset 2)

(require 'flycheck)
(require 'rainbow-mode)
(require 'yaml-mode)

(flycheck-add-mode 'javascript-eslint 'web-mode)

(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.sass$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(add-hook 'css-mode-hook 'rainbow-mode)
;; (add-to-list 'auto-mode-alist '("\\.xml$" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.less\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\(on\\)?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.json5?\\'" . js-mode))

(setq web-mode-engines-alist '(("jsx" . "\\.js\\'")))
(setq web-mode-content-types '(("css" . "\\.\\(s?css\\|css\\.erb\\)\\'")
                               ("json" . "\\.\\(api\\|json\\|jsonld\\)\\'")
                               ("jsx" . "\\.[jt]s\\(x\\)?\\'")
                               ("xml" . "\\.xml\\'")
                               ("html" . ".")))

(add-hook 'web-mode-hook
          (lambda () (modify-syntax-entry ?_ "_")))

(font-lock-add-keywords 'web-mode
                        '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
                           1 font-lock-warning-face t)))
