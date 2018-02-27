;; taguiar-java.el

;;  ./eclimd -Dosgi.instance.area.default=@user.home/eclim-work

(use-package eclim
  :ensure t
  :init
  (require 'eclim)
  (require 'eclimd)
  (require 'gradle-mode)
  (add-hook 'java-mode-hook '(lambda()
                               (eclim-mode 1)
                               (company-emacs-eclim-setup)
                               (global-eclim-mode)
                            ))
  :config
  (custom-set-variables
  '(eclim-eclipse-dirs '(tiago-eclipse-dir))
  '(eclim-executable tiago-eclim-exe))
  (use-package company-emacs-eclim
    :ensure t
    :defer t)
  )

(use-package gradle-mode
  :ensure t
  :config
  (add-hook 'java-mode-hook 'lambda() (gradle-mode 1)))

(provide 'taguiar-java)
