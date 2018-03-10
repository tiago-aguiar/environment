;; taguiar-gui.el
(setq frame-title-format "Tiago Emacs")

(split-window-horizontally)

(setq inhibit-startup-message t
      inhibit-splash-screen t
      inhibit-startup-echo-area-message t)

(display-time-mode 1)
(show-paren-mode)

(global-hl-line-mode t) ;; highlight current line
(column-number-mode t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(setq shift-select-mode nil) ;; disable shift selection

(when (boundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq-default indicate-empty-lines t) ;; empty lines indicator
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))


(setq tab-width 4)
(setq-default indent-tabs-mode nil) 

;; remove ^M character of MS-DOS Windows
(defun remove-dos-eol ()
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; Vertical list file 
(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-mode 1)
  (setq ido-use-faces t)
  (set-face-attribute 'ido-vertical-first-match-face nil
                      :background "black"
                      :foreground "white")
  (set-face-attribute 'ido-vertical-only-match-face nil
                      :background "#e52b50"
                      :foreground "white")
  (set-face-attribute 'ido-vertical-match-face nil
                      :foreground "#b00000")
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

;; powerline (bar)
(use-package powerline
  :ensure t
  :config
  (powerline-center-evil-theme)
  (use-package telephone-line
    :ensure t)
  (require 'telephone-line-config)
  (setq telephone-line-primary-left-separator 'telephone-line-cubed-left
        telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
        telephone-line-primary-right-separator 'telephone-line-cubed-right
        telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
  (setq telephone-line-height 24
        telephone-line-evil-use-short-tag t)
  (telephone-line-evil-config)
  )

(provide 'taguiar-gui)
