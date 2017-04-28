(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)
(require 'better-default)
(require 'my-key-set)
(require 'init-magit)
(require 'init-recentf)
(require 'init-chinese-pyim)


;; Open auto-complete mode
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

;; open auto pair mode
(require 'autopair)
(autopair-global-mode)

;; config google c/c++ style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)


;; Auto move curs to new window
(require 'popwin)
(popwin-mode 1)
;; use theme
(load-theme 'atom-dark 1)

;; open helm mode
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(helm-mode 1)
