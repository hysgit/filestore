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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command
   "pandoc -f markdown -t html -s -c /home/hy/store/filestore/style.css --mathjax ")
 '(menu-bar-mode nil)
 '(package-selected-packages (quote (markdown-mode)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

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

;;以下配置,使得emacs共用系统剪贴板
;; http://hugoheden.wordpress.com/2009/03/08/copypaste-with-emacs-in-terminal/
;; I prefer using the "clipboard" selection (the one the
;; typically is used by c-c/c-v) before the primary selection
;; (that uses mouse-select/middle-button-click)
(setq x-select-enable-clipboard t)

;; If emacs is run in a terminal, the clipboard- functions have no
;; effect. Instead, we use of xsel, see
;; http://www.vergenet.net/~conrad/software/xsel/ -- "a command-line
;; program for getting and setting the contents of the X selection"
(unless window-system
 (when (getenv "DISPLAY")
  ;; Callback for when user cuts
  (defun xsel-cut-function (text &optional push)
    ;; Insert text to temp-buffer, and "send" content to xsel stdin
    (with-temp-buffer
      (insert text)
      ;; I prefer using the "clipboard" selection (the one the
      ;; typically is used by c-c/c-v) before the primary selection
      ;; (that uses mouse-select/middle-button-click)
      (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
  ;; Call back for when user pastes
  (defun xsel-paste-function()
    ;; Find out what is current selection by xsel. If it is different
    ;; from the top of the kill-ring (car kill-ring), then return
    ;; it. Else, nil is returned, so whatever is in the top of the
    ;; kill-ring will be used.
    (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
      (unless (string= (car kill-ring) xsel-output)
xsel-output )))
  ;; Attach callbacks to hooks
  (setq interprogram-cut-function 'xsel-cut-function)
  (setq interprogram-paste-function 'xsel-paste-function)
  ;; Idea from
  ;; http://shreevatsa.wordpress.com/2006/10/22/emacs-copypaste-and-x/
  ;; http://www.mail-archive.com/help-gnu-emacs@gnu.org/msg03577.html
  ))

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

