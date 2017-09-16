;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
   '(better-defaults))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;;(setq package-enable-at-startup nil)

;; ;; BASIC CUSTOMIZATION
;; ;; --------------------------------------
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'use-package)
(require 'settings)
(require 'gui)
(require 'org)
(require 'fic-mode)
(require 'theme)
(require 'markdown)
(require 'evil-mode)
(require 'completion)

;; programming-language
(use-package swift-mode
  :ensure t)

(use-package gradle-mode
  :ensure t
  :config
  (add-hook 'java-mode-hook 'lambda() (gradle-mode 1)))

(provide 'init)
