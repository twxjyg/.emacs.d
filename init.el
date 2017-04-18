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
                ;; Better Editor
		popwin
                hungry-delete
		helm
                swiper
                counsel
                exec-path-from-shell
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

;; Find Executable Path on OS, ???
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))        
;; Close wellcome homepage
(setq inhibit-startup-message -1)
;; Replace selection with newly inputed word
(delete-selection-mode 1)
;; Set curs style
(setq-default cursor-type 'bar)
;; Close ugly toolbar UI
(tool-bar-mode -1)
;; Hight light current line
(global-hl-line-mode 1)
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


;; Open auto-complete mode

(ac-config-default)

;; open auto pair mode
(require 'autopair)
(autopair-global-mode)

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

;; 拼音输入法设置
(require 'chinese-pyim)
  ;; 拼音词库设置，五笔用户 *不需要* 此行设置
(require 'chinese-pyim-basedict)
  ;; 拼音词库，五笔用户 *不需要* 此行设置
(chinese-pyim-basedict-enable)   
  ;; 我使用全拼
(setq pyim-default-scheme 'quanpin)
  ;; 选词框显示5个候选词
(setq pyim-page-length 6)
  ;; 全半角切换
  ;; 执行(pyim-punctuation-toggle)
  ;; 使用外置词库
(require 'chinese-pyim-greatdict)
(chinese-pyim-greatdict-enable)
  ;; 设置默认输入法为chinese-pyim
(setq default-input-method "chinese-pyim")
  ;; 设置快捷键, 系统默认的快捷键已是该配置
;;(global-set-key (kbd "C-\\") 'toggle-input-method)
