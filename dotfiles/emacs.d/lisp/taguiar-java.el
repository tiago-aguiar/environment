;; taguiar-java.el
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
  '(eclim-eclipse-dirs '("/Users/tiagoaguiar/eclipse/java-oxygen/Eclipse.app/Contents/Eclipse")) ;; dir
  '(eclim-executable "/Users/tiagoaguiar/eclipse/java-oxygen/Eclipse.app/Contents/Eclipse/eclim")) ;; make simbolic link
  )

(use-package gradle-mode
  :ensure t
  :config
  (add-hook 'java-mode-hook 'lambda()
            (gradle-mode 1)
            ))

;;(require 'company)
;;(global-company-mode t)
;;(require 'company-emacs-eclim)

(provide 'taguiar-java)
