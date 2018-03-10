;; taguiar-completion.el

(use-package irony
  :ensure t
  :defer t
  :init ;; before loaded package
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  :config ;; after loaded package
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point] 'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol] 'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company
  :ensure t
  :defer t
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (use-package company-irony
    :ensure t
    :defer t)
  (use-package company-irony-c-headers
    :ensure t
    :defer t)
  (use-package company-sourcekit
    :ensure t
    :defer t)
  (setq company-idle-delay              nil
 	company-minimum-prefix-length   2
 	company-show-numbers            t
 	company-tooltip-limit           20
 	company-dabbrev-downcase        nil
 	company-backends                '((company-irony-c-headers company-sourcekit company-irony company-gtags)))
  (define-key company-active-map (kbd "ESC") 'company-abort)
  (define-key company-active-map [tab] 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "C-j") 'company-select-next)
  (define-key company-active-map (kbd "C-k") 'company-select-previous)
  :bind ("C-SPC" . company-complete-common))

;; emacs auto-complete lisp
(use-package auto-complete
  :ensure t
  :config
  (progn
    (use-package auto-complete-config)
    (ac-config-default)))

;; snippets (main)
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;; brackets
(use-package autopair
  :ensure t
  :config
  (autopair-global-mode t))

(provide 'taguiar-completion)
