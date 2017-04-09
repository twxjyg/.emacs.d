;; Add chinise elpa mirror and initialize package
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
;; cl - Common Lisp Extension
(require 'cl)

 ;; Add Packages
 (defvar my/packages '(
                ;; --- Auto-completion ---
                company
                ;; --- Better Editor ---
                hungry-delete
                swiper
                counsel
                exec-path-from-shell
                ;; --- Themes ---
                monokai-theme
                ;; solarized-theme
                ) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(ns))
  (exec-path-from-shell-initialize))        


;; Replace selection with newly inputed word
(delete-selection-mode 1)
;; Set curs style
(setq-default cursor-type 'bar)
;; Close ugly toolbar UI
(tool-bar-mode -1)
;; Open line number mode
(global-linum-mode 1)
;; Close auto-backup, 'xxx.txt~ file'
(setq make-backup-files nil)
;; Change font size
(set-face-attribute 'default nil :height 140)
;; Open recentf mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; Quick open init.el
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f12>") 'open-init-file)



(global-company-mode 1)
;; Auto move curs to new window
(require 'popwin)
(popwin-mode 1)
