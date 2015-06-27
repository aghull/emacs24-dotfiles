(starter-kit-load "js")

(require 'flycheck)
(flycheck-define-checker jsxhint-checker
  "A JSX syntax and style checker based on JSXHint."

  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode))
;; (add-hook 'jsx-mode-hook (lambda ()
;;                           (flycheck-select-checker 'jsxhint-checker)
;;                           (flycheck-mode)))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-script-padding 2)
(setq web-mode-enable-auto-quoting nil)

(defun jsx-mode ()
  (when (and (stringp buffer-file-name)
             (string-match "\\.jsx\\'" buffer-file-name))
    (flycheck-select-checker 'jsxhint-checker)
    (flycheck-mode)))

(add-hook 'find-file-hook 'jsx-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '(".html" . web-mode))
