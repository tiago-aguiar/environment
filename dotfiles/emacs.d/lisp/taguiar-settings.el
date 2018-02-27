;; taguiar-settings.el

(setq make-backup-files nil) ;; disable backup
(defalias 'yes-or-no-p 'y-or-n-p) ;; replace yes - y

(global-set-key [f1] 'shell)
(define-key global-map "\et" 'load-todo)
(define-key global-map "\ef" 'find-file) ;; M-x F
(define-key global-map "\eF" 'find-file-other-window) ;; M-x SHIFT F
(define-key global-map "\eb" 'ido-switch-buffer) ;; M-x B
(define-key global-map "\eB" 'ido-switch-buffer-other-window) ;; M-x SHIFT B
(define-key global-map "\ek" 'ido-kill-buffer) ;; M-x K
(define-key global-map "\eT" 'load-log)  

;; keyboard
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(setq explicit-shell-file-name "/bin/zsh")

(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.gradle$" . java-mode))

;; HACKS
(defun my-minibuffer-setup-hook () "Increase GC cons threshold."
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook () "Set GC cons threshold to its default value."
  (setq gc-cons-threshold 1000000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)
(setq x-select-enable-clipboard t) ;; fix error clipboard
;;(setq x-select-enable-clipboard nil) ;; fix error clipboard

(provide 'taguiar-settings)
