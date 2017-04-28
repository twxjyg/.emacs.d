;; Find Executable Path on OS, ???
(when (memq window-system '(mac x ns))
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
(setq linum-format "%d ")
;; Close auto-backup, 'xxx.txt~ file'
(setq make-backup-files nil)
;; close auto save files,because git is every where
(setq auto-save-default nil)
;; Change font size
(set-face-attribute 'default nil :height 140)
;; auto load external edited files
(global-auto-revert-mode 1)
;; fast input
(fset 'yes-or-no-p 'y-or-n-p)

(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'better-default)
