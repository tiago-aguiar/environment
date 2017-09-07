;; -*- coding: utf-8 -*-

(setq package-enable-at-startup nil)
(package-initialize)

;; load my custom
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; automatically install packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(eval-when-compile
  (require 'use-package))

;; packages
(let ((file-name-handler-alist nil))
  (require 'init-elpa)
  (require 'init-settings)
  (require 'init-evil)
  (require 'init-line)
  (require 'init-completion)
  (require 'init-syntax)
  (require 'init-theme)
  (require 'fic-mode)
  (require 'init-markdown))

;; (setq exec-path (append exec-path '("/Users/tiagoaguiar/Desktop/SourceKittenDaemon")))
;; (require 'company-sourcekit)
;; (add-to-list 'company-backends 'company-sourcekit)
;; Set the buffer size to 64K on windows (from the original 4K)
(if (>= emacs-major-version 25)
      (setq w32-pipe-buffer-size (* 64 1024)))

(provide 'init)

;;; init.el
