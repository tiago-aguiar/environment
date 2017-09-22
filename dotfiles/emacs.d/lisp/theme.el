;; theme.el

(use-package gruvbox-theme
  :ensure t)

(require 'gruvbox-theme)

(set-face-attribute 'default nil :font "Source Code Pro")
(set-frame-font "Source Code Pro Light-10" nil t)

;; theme
(if window-system
    (load-theme 'gruvbox-light-medium t)
  (load-theme 'gruvbox-light-medium t))

(provide 'theme)
