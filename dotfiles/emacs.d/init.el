;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------
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

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    epc
    elpy
    flycheck
    jedi
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; ;; BASIC CUSTOMIZATION
;; ;; --------------------------------------
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'use-package)
(require 'settings)
(require 'my-org-mode)
(require 'fic-mode)
(require 'gui)
(require 'theme)
(require 'markdown)
(require 'evil-mode)
(require 'completion)
(require 'jedi-python)

;; programming-language
(use-package swift-mode
  :ensure t)

(use-package gradle-mode
  :ensure t
  :config
  (add-hook 'java-mode-hook 'lambda() (gradle-mode 1)))

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

(elpy-enable)

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
    (set-face-attribute 'default nil :font "Source Code Pro 12")
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
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a3d40cd364b9a6cc2c33be39b35d7a5bbf872f8943f170bb17bf6156c2674921" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
