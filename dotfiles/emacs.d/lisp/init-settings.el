;; init-settings.el
;; Essentials settings

(setq frame-title-format "tiago@emacs")

(setq inhibit-startup-message t
      inhibit-splash-screen t
      inhibit-startup-echo-area-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)

(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(show-paren-mode)
(global-hl-line-mode t)

(global-set-key [f1] 'shell)
(setq explicit-shell-file-name "/bin/zsh")
(setq x-select-enable-clipboard nil)

;; C-x C-f file list vertically
(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-mode 1)
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(setq-default indicate-empty-lines t)
(column-number-mode t)
(setq-default indent-tabs-mode nil) 
(setq tab-width 4)

(defun my-minibuffer-setup-hook ()
  "Increase GC cons threshold."
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  "Set GC cons threshold to its default value."
  (setq gc-cons-threshold 1000000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)

;; frame
(split-window-horizontally)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(display-time-mode 1)

;; powerline (bar)
(use-package powerline
  :ensure t
  :config
  (powerline-vim-theme))

(use-package telephone-line
  :ensure t
  :config
  (telephone-line-mode))
 
(provide 'init-settings)
;; init-settings.el ends here
