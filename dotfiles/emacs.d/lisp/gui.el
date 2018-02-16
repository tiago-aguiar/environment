;; gui.el
;; Essentials GUI Emacs

(setq frame-title-format "Tiago Emacs")

(setq tiago-aquamacs (featurep 'aquamacs))
(setq tiago-linux (featurep 'x))
(setq tiago-win32 (not (or tiago-aquamacs tiago-linux)))

(setq tiago-todo-file "w:/code/todo.txt")
(setq tiago-log-file "w:/code/log.txt")

(split-window-horizontally)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq inhibit-startup-message t
      inhibit-splash-screen t
      inhibit-startup-echo-area-message t)

(display-time-mode 1)
(show-paren-mode)

;; highlight current line
(global-hl-line-mode t)
(set-face-background 'hl-line "midnight blue")

;; colors gui
(set-foreground-color "burlywood3")
(set-background-color "#161616")
(set-cursor-color "#40FF40")

;; findfiles
(define-key global-map "\ef" 'find-file) ;; M-x F
(define-key global-map "\eF" 'find-file-other-window) ;; M-x SHIFT F

;; bufferfiles
(define-key global-map "\eb" 'ido-switch-buffer) ;; M-x B
(define-key global-map "\eB" 'ido-switch-buffer-other-window) ;; M-x SHIFT B

;; killfiles
(define-key global-map "\ek" 'ido-kill-buffer) ;; M-x K

(column-number-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq shift-select-mode nil) ;; disable shift selection

(when (boundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq-default indicate-empty-lines t) ;; empty lines indicator
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(when tiago-linux
  (setq tiago-makescript "./build.linux")
  (display-battery-mode 1))

;; load TODO file
(defun load-todo ()
  (interactive)
  (find-file tiago-todo-file))

(define-key global-map "\et" 'load-todo)

;; load LOG file
(defun insert-timeofday ()
  (interactive "*")
  (insert (format-time-string "----------------- %a, %d %b %y: %I:%M%p")))

(defun load-log ()
  (interactive)
  (find-file tiago-log-file)
  (end-of-buffer)
  (newline-and-indent)
  (insert-timeofday)
  (newline-and-indent)
  (newline-and-indent)
  (end-of-buffer))

(define-key global-map "\eT" 'load-log)  

;; Hacks
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)
(setq x-select-enable-clipboard nil) ;; fix error clipboard

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
  (powerline-center-evil-theme))

  (use-package telephone-line
    :ensure t)
 ;; 
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
