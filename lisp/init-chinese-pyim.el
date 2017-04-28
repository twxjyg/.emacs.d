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

(provide 'init-chinese-pyim)
