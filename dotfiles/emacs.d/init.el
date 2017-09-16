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
(require 'jedi-python)

;; programming-language
(use-package swift-mode
  :ensure t)

(use-package gradle-mode
  :ensure t
  :config
  (add-hook 'java-mode-hook 'lambda() (gradle-mode 1)))

(elpy-enable)
(elpy-use-ipython)

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
 '(package-selected-packages
   (quote
    (py-autopep8 use-package telephone-line swift-mode powerline org-bullets nlinum-relative markdown-mode jedi ido-vertical-mode gruvbox-theme gradle-mode flymd flycheck evil elpy company-sourcekit company-irony-c-headers company-irony better-defaults autopair))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 16777215)) (:background "#282828" :foreground "#fdf4c1")) (((class color) (min-colors 255)) (:background "#262626" :foreground "#ffffaf")))))
