;; init-evil.el -- My evil mode configuration.
;; Comment:
;; Code:

(defun air--config-evil ()
  "Configure evil mode"

  (setq evil-normal-state-cursor '(box "blue")
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

(provide 'init-evil)
;; init-evil.el ends here
