;; taguiar-java.el

;; 1. install eclipse oxygen (or lastest)
;; 2. download eclim_2.7.1.bin
;; 3. exec .bin (eclimd in root eclipse dir)
;; 4. make symbolic link eclim to root eclipse dir
;; 5. put tiago-eclipse-dir, tiago-eclim-exe

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
  (when tiago-mac
    (custom-set-variables
     '(eclim-eclipse-dirs '(tiago-eclipse-dir))
     '(eclim-executable tiago-eclim-exe))
    )
  (use-package company-emacs-eclim
    :ensure t
    :defer t)
  (eclim-toggle-print-debug-messages)
  )

(use-package gradle-mode
  :ensure t
  :config
  (add-hook 'java-mode-hook 'lambda() (gradle-mode 1)))

(defun taguiar-create-project ()
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
   (concat tiago-eclipse-dir "/eclim -command project_create -f " (read-directory-name "dir project: ") " -n java -p " (read-string "project name: "))
   ))

(provide 'taguiar-java)
