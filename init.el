(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)
(require 'better-default)
(require 'my-key-binds)

;; Open recentf mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)


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
