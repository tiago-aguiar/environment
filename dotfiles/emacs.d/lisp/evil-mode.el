;; evil-mode.el -- My evil mode configuration.

(defun air--config-evil ()
  "Configure evil mode"

  (setq evil-normal-state-cursor '(box "green")
	evil-insert-state-cursor '(box "red"))

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

(provide 'evil-mode)
;; evil-mode.el ends here
