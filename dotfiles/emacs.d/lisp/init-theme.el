;; init-theme.el

(use-package gruvbox-light-medium-theme
  :ensure t)

(set-face-attribute 'default nil :font "Source Code Pro")
(set-frame-font "Source Code Pro" nil t)

(use-package fic-mode
  :ensure t
  :config
  (add-hook 'c++-mode-hook '(lambda () (fic-mode 1))))

(provide 'init-theme)
