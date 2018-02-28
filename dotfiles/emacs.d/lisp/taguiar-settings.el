;; taguiar-settings.el

(setq make-backup-files nil) ;; disable backup
(defalias 'yes-or-no-p 'y-or-n-p) ;; replace yes - y

(defun taguiar-eval-buffer ()
  (interactive)
  (eval-buffer)
  (message "buffer reloaded")
  )

(global-set-key [f1] 'shell)
(global-set-key [f12] 'taguiar-eval-buffer)
(define-key global-map "\et" 'load-todo)
(define-key global-map "\ef" 'find-file) ;; M-x F
(define-key global-map "\eF" 'find-file-other-window) ;; M-x SHIFT F
(define-key global-map "\eb" 'ido-switch-buffer) ;; M-x B
(define-key global-map "\eB" 'ido-switch-buffer-other-window) ;; M-x SHIFT B
(define-key global-map "\ek" 'ido-kill-buffer) ;; M-x K
(define-key global-map "\el" 'load-log)  

;; keyboard
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(defun air--config-evil ()
  (setq evil-normal-state-cursor '(box "red")
	evil-insert-state-cursor '(box "green"))

  (evil-define-key 'normal global-map (kbd "C-h")  'windmove-left)
  (evil-define-key 'normal global-map (kbd "C-l") 'windmove-right)
  (evil-define-key 'normal global-map (kbd "C-k")    'windmove-up)
  (evil-define-key 'normal global-map (kbd "C-j")  'windmove-down)
  (evil-define-key 'insert global-map (kbd "C-SPC") 'company-complete))

(use-package evil
  :ensure t
  :config
  (add-hook 'evil-mode-hook 'air--config-evil)
  (evil-mode 1))

(use-package nlinum-relative
  :ensure t
  :config
  (nlinum-relative-setup-evil)
  (setq nlinum-relative-redisplay-delay 0)
  (setq nlinum-relative-offset 1)
  (add-hook 'prog-mode-hook #'nlinum-relative-mode))

(setq explicit-shell-file-name "/bin/zsh")

(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.gradle$" . java-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))

;; HACKS
(defun my-minibuffer-setup-hook () "Increase GC cons threshold."
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook () "Set GC cons threshold to its default value."
  (setq gc-cons-threshold 1000000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

;; Windows performance tweaks
(when (boundp 'w32-pipe-read-delay)
  (setq w32-pipe-read-delay 0))
(when (boundp 'w32-pipe-buffer-size) ;; Set the buffer size to 64K on Windows (from the original 4K)
  (setq irony-server-w32-pipe-buffer-size (* 64 1024)))

(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

(provide 'taguiar-settings)
