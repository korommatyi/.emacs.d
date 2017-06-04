(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq js-indent-level 2)
(setq python-indent-offset 2)
(setq css-indent-offset 2)
(show-paren-mode t)
(global-linum-mode 1)
(setq column-number-mode t)
(put 'upcase-region 'disabled nil)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq inhibit-startup-message t inhibit-startup-echo-area-message t)
(define-key global-map (kbd "RET") 'newline-and-indent)

; add packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
(package-install 'use-package)
(require 'use-package)
(use-package scala-mode
  :ensure t
  :pin melpa-stable
  :interpreter ("scala" . scala-mode))
(use-package smartscan
  :ensure t
  :pin melpa)
(use-package monokai-theme
  :ensure t
  :pin melpa)
(use-package fill-column-indicator
  :ensure t
  :pin melpa)
(use-package magit
  :ensure t
  :pin melpa)
(use-package exec-path-from-shell
  :ensure t
  :pin melpa
  :config (exec-path-from-shell-initialize))
(use-package web-mode
  :ensure t
  :pin melpa
  :config (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(smartscan-mode 1)
(load-theme 'monokai t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(setq-default fill-column 100)
(add-hook 'python-mode-hook (lambda () (fci-mode 1)))
(add-hook 'makrdown-mode-hook (lambda () (fci-mode 1)))
(add-hook 'scala-mode-hook (lambda () (fci-mode 1)))
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 120))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(global-set-key (kbd "C-x g") 'magit-status)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit fill-column-indicator monokai-theme smartscan))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
