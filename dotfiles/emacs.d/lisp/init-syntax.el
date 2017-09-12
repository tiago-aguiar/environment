;; init-syntax.el

(use-package swift-mode
  :ensure t)

(use-package gradle-mode
  :ensure t)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'gradle-mode)
(add-hook 'java-mode-hook 'lambda() (gradle-mode 1))

(provide 'init-syntax)
;; init-syntax.el ends here
