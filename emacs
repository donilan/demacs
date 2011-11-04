(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'euc-cn)
(set-clipboard-coding-system 'euc-cn)
(set-terminal-coding-system 'euc-cn)
(set-buffer-file-coding-system 'euc-cn)
(set-selection-coding-system 'euc-cn)
(modify-coding-system-alist 'process "*" 'euc-cn)
(setq default-process-coding-system 
            '(euc-cn . euc-cn))
(setq-default pathname-coding-system 'euc-cn)

(global-set-key (kbd "s-SPC") 'nil)

(display-time)
(column-number-mode t)
(setq x-select-enable-clipboard t)

(add-to-list 'load-path "~/.emacs.d/user_plugins")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote (("/" "/") ("/home/d/Desktop/eclipse/grails-gwt/src/gwt" "gwt"))))
 '(el-get-standard-packages (quote ("java-mode-indent-annotations" "php-mode-improved" "package" "php-mode" "el-get"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;; turn on syntax highlighting
(global-font-lock-mode 1)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

;Grails
(require 'grails-mode)
(setq grails-mode t)
(setq project-mode t)
(add-to-list 'auto-mode-alist '("\.gsp$" . nxml-mode)) ; Use whatever mode you want for views.


;jde
(add-to-list 'load-path (expand-file-name "/usr/local/share/emacs/site-lisp/jdee/lisp"))
(add-to-list 'load-path (expand-file-name "/usr/local/share/emacs/site-lisp/cedet/common"))
(load-file (expand-file-name "/usr/local/share/emacs/site-lisp/cedet/common/cedet.el"))
(add-to-list 'load-path (expand-file-name "/usr/local/share/emacs/site-lisp/elib-1.0"))

(require 'jde)

;Semanticdb-mode
;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/cedet/semantic")

;ECB
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/ecb")
(load-file "/usr/local/share/emacs/site-lisp/ecb/ecb.el")
(require 'ecb-autoloads)