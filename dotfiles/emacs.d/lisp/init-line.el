;; init-line.el

;; Custom line and numbers

(use-package nlinum-relative
  :ensure t
  :config
  (nlinum-relative-setup-evil)
  (setq nlinum-relative-redisplay-delay 0)
  (setq nlinum-relative-offset 1)
  (add-hook 'prog-mode-hook #'nlinum-relative-mode))

(provide 'init-line)
;; init-line.el ends here
