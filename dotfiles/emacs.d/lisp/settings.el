;; settings.el
;; Essentials settings

(setq make-backup-files nil) ;; disable backup
(defalias 'yes-or-no-p 'y-or-n-p) ;; replace yes - y

(global-set-key [f1] 'shell)
(setq explicit-shell-file-name "/bin/zsh")
;;(setq x-select-enable-clipboard nil)

(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))

(defun my-minibuffer-setup-hook ()
  "Increase GC cons threshold."
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  "Set GC cons threshold to its default value."
  (setq gc-cons-threshold 1000000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

(provide 'settings)
;; settings.el ends here
