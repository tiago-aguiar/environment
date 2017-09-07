;; init-markdown.el
;; all configurations about markdown

(use-package flymd
  :ensure t
  :config
  (defun my-flymd-browser-function (url)
  (let ((browse-url-browser-function 'browse-url-firefox))
    (browse-url url)))
  (setq flymd-browser-open-function 'my-flymd-browser-function))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(provide 'init-markdown)
;; init-markdown.el ends here
