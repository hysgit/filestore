(setq inhibit-startup-message t)


(setq initial-frame-alist '((top . 200) (left . 300)))
(setq initial-scratch-message "")

;;(setq-default kill-whole-line t)

(setq make-backup-files nil)
;; 设定不产生备份文件，file-name~

;; 不生成临时文件
(setq-default make-backup-files nil)

;;关闭自动保存模式
(setq auto-save-mode nil)

;;不生成 #filename# 临时文件
(setq auto-save-default nil)

(setq column-number-mode t) 
(setq line-number-mode t)
(global-linum-mode 'linum-mode);;在左边显示行号

(setq linum-format "%d ");;设置行号格式,%d表示行号数字,空格就是空格个数.

(setq-default cursor-type 'bar);;光标显示为一竖线

;;关闭烦人的出错时的提示声
(setq visible-bell t)

;;以y/n 代替 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;设置tab为4个空格的宽度
(setq default-tab-width 4)

(setq-default indent-tabs-mode nil)


;;去掉菜单,去掉工具栏,去掉滚动条
(custom-set-variables
'(scroll-bar-mode nil)
'(tool-bar-mode nil)
'(menu-bar-mode nil)
)

;;当没有区域被选中的时候，就复制或剪切一整行。
;; copy region or whole line
(global-set-key "\M-w"
(lambda ()
	(interactive)
	(if mark-active
		(kill-ring-save (region-beginning)
			(region-end))
		(progn
			(kill-ring-save (line-beginning-position)
				(line-end-position))
	(message "copied line")))))


;; kill region or whole line
(global-set-key "\C-w"
(lambda ()
  (interactive)
  (if mark-active
      (kill-region (region-beginning)
   (region-end))
    (progn
     (kill-region (line-beginning-position)
  (line-end-position))
     (message "killed line")))))


(global-set-key (kbd "C-x C-d") 'kill-whole-line) ;
