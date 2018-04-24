;; taguiar-theme.el

;; (use-package gruvbox-theme
;;   :ensure t)
;; 
;; (require 'gruvbox-theme)
;; (load-theme 'gruvbox-dark-medium t)

(use-package doom-themes
  :ensure t
  :config

  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

  (load-theme 'doom-peacock t)

  (doom-themes-visual-bell-config)

  (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

  (doom-themes-org-config))

;; (set-foreground-color "burlywood3")
;; (set-background-color "#161616")
;; (set-cursor-color "#40FF40")

;; (set-face-attribute 'default nil :font "Source Code Pro 10")
;; (set-face-attribute 'default nil :font "Source Code Pro Light 11")
(when tiago-win32
  (set-face-attribute 'default nil :font "Liberation Mono 10")
  )

(when tiago-mac
  (set-face-attribute 'default nil :font "Liberation Mono 12")
  )

;; (set-face-attribute 'font-lock-builtin-face nil :foreground "#DAB98F")
;; (set-face-attribute 'font-lock-comment-face nil :foreground "gray50")
;; (set-face-attribute 'font-lock-constant-face nil :foreground "olive drab")
;; (set-face-attribute 'font-lock-doc-face nil :foreground "gray50")
;; (set-face-attribute 'font-lock-function-name-face nil :foreground "burlywood3")
;; (set-face-attribute 'font-lock-string-face nil :foreground "olive drab")
;; (set-face-attribute 'font-lock-type-face nil :foreground "burlywood3")
;; (set-face-attribute 'font-lock-variable-name-face nil :foreground "orange")
;; (set-face-attribute 'font-lock-keyword-face nil :foreground "#eca72c")

(defun tiago-custom-swift-mode ()
  (set-face-attribute 'font-lock-function-name-face nil :foreground "white")
  (set-face-attribute 'font-lock-keyword-face nil :foreground "#eca72c")
  (set-face-attribute 'font-lock-preprocessor-face nil :foreground "red")
)

(defun tiago-custom-python-mode ()
  (set-face-attribute 'font-lock-comment-face nil :foreground "yellow")
)

(add-hook 'swift-mode-hook 'tiago-custom-swift-mode)
;; (add-hook 'python-mode-hook 'tiago-custom-python-mode)

;; (set-face-background 'hl-line "midnight blue")

;; (set-frame-font "Source Code Pro" nil t)

(provide 'taguiar-theme)
