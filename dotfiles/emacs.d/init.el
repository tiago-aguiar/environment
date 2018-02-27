;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; ----------------
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; (defvar myPackages
;;   '(better-defaults
;;     epc
;;     elpy
;;     flycheck
;;     jedi
;;     py-autopep8))

;; (mapc #'(lambda (package)
;;     (unless (package-installed-p package)
;;       (package-install package)))
;;       myPackages)

;; ;; BASIC CUSTOMIZATION
;; ;; --------------------------------------

(require 'use-package)
(require 'settings)
(require 'my-org-mode)
(require 'fic-mode)
(require 'gui)
(require 'theme)
(require 'markdown)
(require 'evil-mode)
(require 'jedi-python)
(require 'completion)
(require 'taguiar-java)
(require 'taguiar-swift)

;; php
(use-package php-mode
  :ensure t)

;; web
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-hook 'web-mode-hook 'remove-dos-eol))

;; (elpy-enable)

;; check OS type
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (message "Microsoft Windows")
    )
  )

 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (message "Mac OS X")
    ;; (set-face-attribute 'default nil :font "Source Code Pro 12")
    )
  )

 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (message "Linux")
    (elpy-use-ipython)
    )
  )

 ) ;; end cond

;; use flycheck not flymake with elpy
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a3d40cd364b9a6cc2c33be39b35d7a5bbf872f8943f170bb17bf6156c2674921" default)))
 '(eclim-eclipse-dirs
   (quote
    ("/Users/tiagoaguiar/eclipse/java-oxygen/Eclipse.app/Contents/Eclipse")))
 '(eclim-executable
   "/Users/tiagoaguiar/eclipse/java-oxygen/Eclipse.app/Contents/Eclipse/eclim")
 '(package-selected-packages
   (quote
    (web-server web-mode uuidgen use-package telephone-line swift-mode py-autopep8 powerline php-mode org-bullets nlinum-relative markdown-mode jedi ido-vertical-mode gruvbox-theme gradle-mode flymd flycheck evil elpy diff-hl company-sourcekit company-irony-c-headers company-irony better-defaults autopair))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-done ((t (:foreground "lawn green" :weight bold))))
 '(org-level-2 ((t (:inherit default))))
 '(org-todo ((t (:foreground "red" :weight bold))))
 '(secondary-selection ((t (:background "black")))))
