;; gui.el
;; Essentials GUI Emacs

(setq frame-title-format "tiago@emacs") ;; title bar

;; (split-window-horizontally)
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

;; (when (window-system)
;;   (set-frame-height (selected-frame) 120)
;;   (set-frame-position (selected-frame) 100 30))

(setq inhibit-startup-message t
      inhibit-splash-screen t
      inhibit-startup-echo-area-message t)

;;(global-linum-mode t) ;; enable line numbers globally
(display-time-mode 1)

(show-paren-mode)
(global-hl-line-mode t)

(column-number-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq-default indicate-empty-lines t) ;; empty lines indicator
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(setq tab-width 4)
(setq-default indent-tabs-mode nil) 

;; keyboard
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; remove ^M character of MS-DOS Windows
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; Vertical list file 
(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-mode 1)
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

;; powerline (bar)
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

(use-package telephone-line
  :ensure t)

(require 'telephone-line)
(setq telephone-line-primary-left-separator 'telephone-line-cubed-left
      telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
      telephone-line-primary-right-separator 'telephone-line-cubed-right
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
(setq telephone-line-height 24
      telephone-line-evil-use-short-tag t)
(telephone-line-mode 1)

(provide 'gui)
;; gui.el ends here
