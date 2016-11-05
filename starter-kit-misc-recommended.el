
(dolist (package '(yaml-mode rainbow-mode))
  (unless (package-installed-p package)
    (package-install package)))

(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1))

(menu-bar-mode -1)
