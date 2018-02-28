;; taguiar-swift.el

(use-package swift-mode
  :ensure t
  :config
  (setq company-backends '((company-irony company-sourcekit))))

(provide 'taguiar-swift)
