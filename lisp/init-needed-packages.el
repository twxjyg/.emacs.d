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
		;; 拼音输入法和词库
		chinese-pyim
		chinese-pyim-greatdict
                ;; Auto-completion
		auto-complete
		autopair
		google-c-style
		yasnippet
                ;; Better Editor
		popwin
                hungry-delete
		helm
                swiper
                counsel
                exec-path-from-shell
		find-file-in-repository
		;; git
		magit
                ;; Themes
                monokai-theme
                solarized-theme
		atom-dark-theme
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
;; export module
(provide 'init-needed-packages)
