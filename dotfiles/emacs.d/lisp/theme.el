;; theme.el

;; (use-package gruvbox-theme
;;   :ensure t)
;; 
;; (require 'gruvbox-theme)
;; (load-theme 'gruvbox-dark-medium t)

;; (set-face-attribute 'default nil :font "Source Code Pro 10")
;; (set-face-attribute 'default nil :font "Source Code Pro Light 11")
(set-face-attribute 'default nil :font "Liberation Mono 10")
(set-face-attribute 'font-lock-builtin-face nil :foreground "#DAB98F")
(set-face-attribute 'font-lock-comment-face nil :foreground "gray50")
(set-face-attribute 'font-lock-constant-face nil :foreground "olive drab")
(set-face-attribute 'font-lock-doc-face nil :foreground "gray50")
(set-face-attribute 'font-lock-function-name-face nil :foreground "burlywood3")
(set-face-attribute 'font-lock-string-face nil :foreground "olive drab")
(set-face-attribute 'font-lock-type-face nil :foreground "burlywood3")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "orange")

(defun tiago-custom-swift-mode ()
  (set-face-attribute 'font-lock-function-name-face nil :foreground "white")
  (set-face-attribute 'font-lock-keyword-face nil :foreground "#eca72c")
  (set-face-attribute 'font-lock-preprocessor-face nil :foreground "red")
)

(defun tiago-custom-python-mode ()
  (set-face-attribute 'font-lock-comment-face nil :foreground "yellow")
)

(add-hook 'swift-mode-hook 'tiago-custom-swift-mode)
(add-hook 'python-mode-hook 'tiago-custom-python-mode)

;; (set-frame-font "Source Code Pro" nil t)

(provide 'theme)
