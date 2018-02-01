;; theme.el

(use-package gruvbox-theme
  :ensure t)

(require 'gruvbox-theme)

(set-face-attribute 'default nil :font "Source Code Pro 14")
(set-frame-font "Source Code Pro" nil t)

;; theme
;; (if window-system
;;     (load-theme 'gruvbox-light-medium t)
;;   (load-theme 'gruvbox-dark-medium t))

(load-theme 'gruvbox-dark-medium t)

(provide 'theme)
