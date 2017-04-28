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

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))
(global-set-key (kbd "M-<up>") 'move-line-up)

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))
(global-set-key (kbd "M-<down>") 'move-line-down)
(provide 'init-my-key-set)
