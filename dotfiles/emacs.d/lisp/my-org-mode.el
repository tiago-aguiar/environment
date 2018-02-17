;; org.el
;; Essentials for Org Mode 

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda ()
                             (org-bullets-mode 1)
                             )))

(setq org-log-done 'time) ;; set CLOSED when done

;;(require 'org-bullets)

(provide 'my-org-mode)
;; org.el ends here
