(setq-default
 indent-tabs-mode nil
 tab-width 2
 next-screen-context-lines 27
 standard-indent 2)

(setq
 inhibit-startup-message t
 inhibit-startup-echo-area-message t
 column-number-mode t)

(show-paren-mode t)
(put 'upcase-region 'disabled nil)
(ido-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(global-linum-mode 1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))


;; rebind keys
(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "M-o") 'other-window)


;; add packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
(package-install 'use-package)
(require 'use-package)

(use-package typescript-mode
  :ensure t
  :pin melpa-stable)

(use-package flycheck
  :ensure t
  :pin melpa-stable
  :config (global-flycheck-mode))

(use-package scala-mode
  :ensure t
  :pin melpa-stable
  :interpreter ("scala" . scala-mode))

(use-package ensime
  :ensure t
  :pin melpa-stable
  :init (setq ensime-startup-notification nil))

(use-package smartscan
  :ensure t
  :pin melpa
  :config (global-smartscan-mode t))

(use-package monokai-theme
  :ensure t
  :pin melpa
  :config (load-theme 'monokai t))

;; (use-package fill-column-indicator
;;   :ensure t
;;   :pin melpa
;;   :init
;;   (setq-default fill-column 100)
;;   (add-hook 'python-mode-hook 'fci-mode)
;;   (add-hook 'markdown-mode-hook 'fci-mode)
;;   (add-hook 'scala-mode-hook 'fci-mode)
;;   )

(use-package magit
  :ensure t
  :pin melpa
  :bind ("C-x g" . magit-status))

(use-package exec-path-from-shell
  :ensure t
  :pin melpa
  :config (exec-path-from-shell-initialize))

(use-package web-mode
  :ensure t
  :pin melpa
  :mode ("\\.html?\\'" "\\.js[x]?\\'")
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(use-package smex
  :ensure t
  :pin melpa
  :config (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
         ("C-c C-c M-x" . execute-extended-command)))

(use-package jedi
  :ensure t
  :pin melpa
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t))
;; don't forget to M-x jedi:install-server

(use-package clojure-mode
  :ensure t
  :pin melpa)

(use-package cider
  :ensure t
  :pin melpa)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "node_modules")))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (typescript-mode flycheck ensime jedi smex web-mode use-package smartscan scala-mode monokai-theme magit fill-column-indicator exec-path-from-shell)))
 '(python-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
