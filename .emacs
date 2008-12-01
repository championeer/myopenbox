;; Load paths
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp-personal"))
;;---------------------------------------
(prefer-coding-system 'utf-8)
(require 'unicad);encoding
(require 'linum);add line number
(require 'redo); add redo mode
;;;; fontset
;;(set-fontset-font "fontset-default"
;;                  'gb18030 '("Microsoft YaHei" . "unicode-bmp"))
(set-default-font "Monaco-12")
 (set-fontset-font (frame-parameter nil 'font)
              'unicode '("Microsoft YaHei" . "unicode-bmp")) 
;;; Global Key Mapping
;;定义"C-c c"和"C-z"为按键前缀
(define-prefix-command 'ctl-cc-map)
(global-set-key (kbd "C-c c") 'ctl-cc-map)
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)

(global-set-key [f1] 'info )
(global-set-key [C-f1] 'manual-entry)
(global-set-key [f2] 'undo)
(global-set-key [f3] 'redo)
(global-set-key [f4] 'kill-this-buffer)
(global-set-key [f6] 'dired-jump)
(global-set-key [f8] 'calendar)
(global-set-key [C-f8] 'list-bookmarks)
(global-set-key [f9] 'gnus)
 
(defun du-onekey-compile ()
"Save buffers and start compile"
(interactive)
(save-some-buffers t)
(switch-to-buffer-other-window "*compilation*")
(compile compile-command))
(global-set-key [C-f11] 'compile)
(global-set-key [f11] 'du-onekey-compile)
;; C-f11, 设置编译命令; f11, 保存所有文件然后编译当前窗口文件
 
(global-set-key [f12] 'gdb)
;;F6设置为在Emacs中调用gdb
 
(global-set-key [C-f7] 'previous-error)
(global-set-key [f7] 'next-error)
 
(defun open-eshell-other-buffer ()
"Open eshell in other buffer"
(interactive)
(split-window-vertically)
(eshell))
(global-set-key [(f5)] 'open-eshell-other-buffer)
(global-set-key [C-f5] 'eshell)
;;目的是开一个shell的小buffer，用于更方便地测试程序(也就是运行程序了)，我经常会用到。
;;f8就是另开一个buffer然后打开shell，C-f8则是在当前的buffer打开shell
 
(global-set-key (kbd "M-g") 'goto-line)
;;设置M-g为goto-line
 
(global-set-key (kbd "C-SPC") 'nil)
;;取消control+space键设为mark
 
(global-set-key (kbd "C-M-SPC") 'set-mark-command)
;;这样 我就不用按 C-@ 来 setmark 了, C-@ 很不好按。
 
(global-set-key "\C-x\C-m" 'buffer-menu-other-window);; 多开一个窗口显示已打开的缓冲区列表
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)
(global-set-key (kbd "C-<home>") 'beginning-of-buffer)
(global-set-key (kbd "C-<end>") 'end-of-buffer)
(global-set-key (kbd "C-c u") 'revert-buffer);刷新文件
(global-set-key [(control o)] 'other-window);; 切换窗口
(global-set-key [(control tab)] 'tabbar-forward);; 切换tab
(global-set-key (kbd "C-z k") 'browse-kill-ring);;查看前面删除的内容记录
(global-set-key (kbd "C-z l") 'lpr-buffer);;打印当前buffer
(global-set-key (kbd "C-z r") 'query-replace-regexp);;带正则表达式的搜索
;;-------------end of global key----------------------

;;;;-------------------- Global Setting---------------------
;; 把 C-x C-b 那个普通的 buffer menu 换成非常方便的 ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; 打开一些禁用的功能
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

;; don't create backup files
;(setq make-backup-files nil)
;; spaces instead of tabs
(setq-default indent-tabs-mode nil)
;; scroll by a single line
(setq scroll-step 1)
;; set standard indent to 2
(setq standard-indent 2)
;; make Ctrl-. repeat last command, like vi's . command
(global-set-key (kbd "C-.") 'repeat)
;; make yes or no answers for emacs y or n
(fset 'yes-or-no-p 'y-or-n-p)
;; printing
(setq ps-multibyte-buffer 'bdf-font-except-latin)
;; Exec M-x, suggest info will appear 1 second later
(setq suggest-key-bindings 1)
;; parentheses match
(delete-selection-mode 1)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; image support
(setq auto-image-file-mode t)
;; italic comments 
;(font-lock-comment-face ((t (:italic t))))
;; backup
(setq backup-directory-alist '(("." . "~/.auto-save")))
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-by-copying t)
;; syntax highlight
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(setq font-lock-verbose t)
(setq font-lock-maximum-size '((t . 1048576) (vm-mode . 5250000)))
;; remove toolbar/scroll-bar
(scroll-bar-mode -1)
(tool-bar-mode -1)
;(menu-bar-mode -1)
;; tabbar mode
;(tabbar-mode t)
;; disable startup message
(setq inhibit-startup-message t) 
;;修改中文文本的行距,3个象素就可以了吧
(setq-default line-spacing 3)
;;启用C-x,C-v,C-c这些通用设置
;(cua-mode t)
;;ido mode
(require 'ido)
(ido-mode t);;ido的配置,这个可以使你在用C-x C-f打开文件的时候在后面有提示

;;时间显示设置
;;启用时间显示设置，在minibuffer上面的那个杠上
(display-time-mode 1)
;;时间使用24小时制
(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
;;时间栏旁边启用邮件设置
(setq display-time-use-mail-icon t)
;;时间的变化频率
(setq display-time-interval 10)
;;显示时间的格式
(setq display-time-format "%m月%d日 %A%H:%M")

(setq visible-bell t);;关闭出错时的提示音
(setq default-major-mode 'text-mode);一打开就起用 text 模式。
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(mouse-avoidance-mode 'animate);光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(setq kill-ring-max 200);设置粘贴缓冲条目数量
(setq mouse-yank-at-point t);支持中键粘贴
(transient-mark-mode t);高亮显示要拷贝的区域
(setq x-select-enable-clipboard t);支持emacs和外部程序的粘贴
(setq default-fill-column 80);默认显示 80列就换行
;; 让sentence-end可以识别全角的标点符号
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
(ansi-color-for-comint-mode-on);remove broken codes in shell
;;; Turn on auto-fill.
(setq auto-fill-mode t)
(setq comment-multi-line t)
(setq fill-column 75)
(setq adaptive-fill-regexp "[ \t]+\\|[ \t]*\\([0-9]+\\.\\|\\*+\\)[ \t]*")
(setq adaptive-fill-first-line-regexp "^\\* *$")
;;; Highlight during query
(setq query-replace-highlight t)
;;; Highlight incremental search
(setq search-highlight t)
(setq scroll-margin 3 scroll-conservatively 10000);;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文
 ;; 按%寻找匹配的括号
(local-set-key "%" 'match-paren)
 
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
    (interactive "p")
      (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
              ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
                      (t (self-insert-command (or arg 1)))))

;;--------------------------------------------------------------------------
;;代码折叠
;(require 'hideshow)
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
;(add-hook 'java-mode-hook 'hs-minor-mode)
;(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;;能把一个代码块缩起来，需要的时候再展开
;;  M-x              hs-minor-mode
;;  C-c @ ESC C-s    show all
;;  C-c @ ESC C-h    hide all
;;  C-c @ C-s        show block
;;  C-c @ C-h        hide block
;;  C-c @ C-c toggle hide/show
;;--------------------------------------------------------------------------

;; Folding-mode
(load "folding" 'nomessage 'noerror)
(folding-mode-add-find-file-hook)
(folding-add-to-marks-list 'php-mode "//{" "//}" nil t)
(folding-add-to-marks-list 'prolog-mode "%{{{" "%}}}" nil t)
(folding-add-to-marks-list 'html-mode "<!-- {{{ " "<!-- }}} -->" " -->" nil t)
(folding-add-to-marks-list 'LaTeX-mode "%%% {{{" "%%% }}}" nil t)
(folding-add-to-marks-list 'latex-mode "%%%% {{{" "%%%% }}}" nil t)
(folding-add-to-marks-list 'BibTeX-mode "%%% {{{" "%%% }}}" nil t)
(folding-add-to-marks-list 'lisp-mode ";;; {" ";;; }" nil t)
(folding-add-to-marks-list 'shell-script-mode "# {{{" "# }}}" nil t)
(folding-add-to-marks-list 'sh-mode "# {{{ " "# }}}" nil t)
 
;;自动补全括号
(setq skeleton-pair t)
(local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "<") 'skeleton-pair-insert-maybe)
 
;; Insert table
(autoload 'keisen-mode "keisen-mule" "MULE table" t)
 
;;自动补全功能，按M-/
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
'(try-expand-line
try-expand-line-all-buffers
try-expand-list
try-expand-list-all-buffers
try-expand-dabbrev
try-expand-dabbrev-visible
try-expand-dabbrev-all-buffers
try-expand-dabbrev-from-kill
try-complete-file-name
try-complete-file-name-partially
try-complete-lisp-symbol
try-complete-lisp-symbol-partially
try-expand-whole-kill))

;;---------------auctex----------------------
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
 
(setq TeX-auto-untabify t) ;; 不使用 TAB字符缩进
(setq LaTeX-document-regexp "document\\|CJK\\*?") ;; CJK 环境中不缩进
(add-hook 'LaTeX-mode-hook #'LaTeX-install-toolbar)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTex-mode-hook 'turn-on-reftex)
 
;;设置XeLaTex为默认编译命令
(add-hook 'LaTeX-mode-hook (lambda()
     (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
     (TeX-PDF-mode t)
    (setq TeX-command-default "XeLaTeX")
    (setq TeX-save-query nil )
    (setq TeX-show-compilation t)
))
(custom-set-variables
 '(TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))
)
;;------------tabbar-----------------------------
(require 'tabbar)
;(setq tabbar-speedkey-use t)
;(setq tabbar-speedkey-prefix (kbd "<f1>"))
(tabbar-mode 1)
 
(global-set-key (kbd "M--") 'tabbar-backward-group)
(global-set-key (kbd "M-=") 'tabbar-forward-group)
(global-set-key (kbd "M-1") 'tabbar-backward)
(global-set-key (kbd "M-2") 'tabbar-forward)
;;-----------------dired---------------------------------
(setq dired-recursive-deletes t) ; 可以递归的删除目录
(setq dired-recursive-copies t) ; 可以递归的进行拷贝
(require 'dired-x) ; 有些特殊的功能
(setq dired-guess-shell-alist-user
      (list
        (list "\\.chm$" "chmsee")
        (list "\\.rm$" "smplayer")
        (list "\\.rmvb$" "smplayer")
        (list "\\.avi$" "smplayer")
        (list "\\.asf$" "smplayer")
        (list "\\.wmv$" "smplayer")
        (list "\\.htm$" "w3m")
        (list "\\.html$" "w3m")
        (list "\\.mpg$" "smplayer")
        (list "\\.avi$" "smplayer")
      )
) ; 设置一些文件的默认打开方式，此功能必须在(require 'dired-x)之后
;; color
;(require 'color-theme)

;; load mode
(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))

(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;;--------- Load Twit.el for twitter------------------------
(require 'twit)
;;--------- Load w3m browser--------------------------------
(require 'w3m-load)
;(setq browse-url-browser-function 'w3m-browse-url)
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "/usr/bin/conkeror")
(setq w3m-use-cookies t)
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-display-inline-image t)
(setq w3m-home-page "http://bullog.cn")
(eval-after-load "w3m-search"
    '(add-to-list 'w3m-search-engine-alist
    '("wikipedia" "http://en.wikipedia.org/wiki/%s" nil)
    '("tpb" "http://thepiratebay.org/search/%s/0/99/0" nil)))
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL" t)
(global-set-key "\C-xu"
    '(lambda () (interactive)
        (let ((url (thing-at-point 'url)))
        (let ((browse-url-browser-function 'browse-url-generic))
            (progn
                (other-frame 1)
                (browse-url url))))))
(global-set-key "\C-xm" 'browse-url-at-point)
 
(let ((map (make-keymap)))
(suppress-keymap map)
(define-key map [backspace] 'w3m-scroll-down-or-previous-url)
(define-key map [delete] 'w3m-scroll-down-or-previous-url)
(define-key map "\C-?" 'w3m-scroll-down-or-previous-url)
(define-key map "f" 'w3m-next-anchor)
(define-key map "b" 'w3m-previous-anchor)
(define-key map "n" 'next-line)
(define-key map "p" 'previous-line)
(define-key map "\C-n" 'w3m-next-buffer)
(define-key map "\C-p" 'w3m-previous-buffer)
(define-key map "\C-t" 'w3m-copy-buffer)
(define-key map "\C-m" 'w3m-view-this-url)
(define-key map "\C-c\C-k" 'w3m-process-stop)
(define-key map [(shift return)] 'w3m-view-this-url-new-session)
(define-key map [(shift kp-enter)] 'w3m-view-this-url-new-session)
(define-key map [(button2)] 'w3m-mouse-view-this-url)
(define-key map [(shift button2)] 'w3m-mouse-view-this-url-new-session)
(define-key map " " 'scroll-up)
(define-key map "a" 'w3m-bookmark-add-current-url)
(define-key map "\M-a" 'w3m-bookmark-add-this-url)
(define-key map "+" 'w3m-antenna-add-current-url)
(define-key map "A" 'w3m-antenna)
(define-key map "c" 'w3m-print-this-url)
(define-key map "C" 'w3m-print-current-url)
(define-key map "d" 'w3m-wget)
(define-key map "D" 'w3m-download-this-url)
(define-key map "g" 'w3m-goto-url)
(define-key map "G" 'w3m-goto-url-new-session)
(define-key map "h" 'describe-mode)
(define-key map "H" 'w3m-gohome)
(define-key map "I" 'w3m-toggle-inline-images)
(define-key map "\M-i" 'w3m-save-image)
(define-key map "M" 'w3m-view-url-with-external-browser)
(define-key map "B" 'w3m-view-next-page)
(define-key map "o" 'w3m-history)
(define-key map "O" 'w3m-db-history)
(define-key map "F" 'w3m-view-next-page)
(define-key map "B" 'w3m-view-previous-page)
(define-key map "q" 'w3m-close-window)
(define-key map "Q" 'w3m-quit)
(define-key map "R" 'w3m-reload-this-page)
(define-key map "s" 'w3m-search)
(define-key map "S" (lambda ()
(interactive)
(let ((current-prefix-arg t))
(call-interactively 'w3m-search))))
(define-key map "u" 'w3m-view-parent-page)
(define-key map "v" 'w3m-bookmark-view)
(define-key map "W" 'w3m-weather)
(define-key map "=" 'w3m-view-header)
(define-key map "\\" 'w3m-view-source)
(define-key map "?" 'describe-mode)
(define-key map ">" 'w3m-scroll-left)
(define-key map "<" 'w3m-scroll-right)
(define-key map "." 'beginning-of-buffer)
(define-key map "^" 'w3m-view-parent-page)
(define-key map "]" 'w3m-next-form)
(define-key map "[" 'w3m-previous-form)
(define-key map "}" 'w3m-next-image)
(define-key map "{" 'w3m-previous-image)
(define-key map "\C-c\C-c" 'w3m-submit-form)
(setq dka-w3m-map map))
 ;; optional keyboard short-cut               
 (global-set-key "\C-xm" 'browse-url-at-point)
;;;;--------------------------
;;--------- Org-mode--------------------------
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-agenda-include-diary t);include emacs diary entries into org-mode agenda
(setq org-log-done t)
(add-hook 'org-mode-hook 'turn-on-font-lock) ; Org buffers only
;;---------- erc mode-------------------------
(require 'erc)
;;---------Twit mode--------------------------
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(erc-away-nickname "qianli(away...)")
 '(erc-nick "qianli")
 '(erc-nick-uniquifier "~")
 '(erc-port 6667)
 '(erc-public-away-p t)
 '(erc-server "irc.freenode.net")
 '(twit-pass "JAZHAO1027")
 '(twit-user "qianli"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(twit-author-face ((t (:weight bold :height 0.9 :family "Dejavu Sans mono"))))
 '(twit-message-face ((default (:family "Dejavu Sans")) (nil nil))))
