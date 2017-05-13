(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-needed-packages)
(require 'init-better-default)
(require 'init-my-key-set)
(require 'init-magit)
(require 'init-recentf)
(require 'init-chinese-pyim)
(require 'init-auto-complete)
(require 'init-google-c-style)
(require 'init-helm)
(require 'init-other-packages)
(require 'init-projectile)

;; use theme
(load-theme 'atom-dark 1)

