;; Quick open init.el
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f12>") 'open-init-file)

(defun kill-current-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line 1))
(global-set-key (kbd "M-k") 'kill-current-line)

;; config quick find file
(require 'find-file-in-repository)
(global-set-key (kbd "C-x f") 'find-file-in-repository)

(provide 'my-key-binds)
