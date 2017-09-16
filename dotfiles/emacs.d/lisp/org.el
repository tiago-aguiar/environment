;; org.el
;; Essentials for Org Mode 

(use-package org-bullets
  :ensure t)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(provide 'org)
;; org.el ends here
