;; taguiar-orgmode.el
;; Essentials for Org Mode 

(use-package org-bullets
  :ensure t
  :config
  :requires org-bullets
  (add-hook 'org-mode-hook (lambda ()
                             (org-bullets-mode 1)
                             )))

(setq org-log-done 'time) ;; set CLOSED when done

(provide 'taguiar-orgmode)
