(set-language-environment 'UTF-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system 
            '(euc-cn . euc-cn))
(setq-default pathname-coding-system 'utf-8)

(global-set-key (kbd "s-SPC") 'nil)

(display-time)
(column-number-mode t)
(setq x-select-enable-clipboard t)

;; Yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; auto-complete 1.3.1
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete-1.3/ac-dict")
(ac-config-default)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(setq js-indent-level 2)

(add-hook 'python-mode-hook '(lambda () 
                               (setq python-indent 2)))
(setq-default python-indent 2)

(put 'upcase-region 'disabled nil)

(setq backup-directory-alist (quote(("." . "~/.backups"))))

;(global-hl-line-mode t)

; Load Dired X when Dired is loaded.
; (add-hook 'dired-load-hook '(lambda () (require 'dired-x)))

;; Enable toggling of uninteresting files.
(setq dired-omit-mode t)

(require 'dired-x)
(setq-default dired-omit-files-p t) ; this is buffer-local variable
(setq dired-omit-files
      (concat dired-omit-files "^\\.pyc$"))

; Inserting todays date
(defun insert-current-date () (interactive)
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))
(defun insert-current-time() (interactive)
  (insert (shell-command-to-string "echo -n $(date +%H:%M:%S)")))
(defun insert-current-datetime() (interactive)
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d\\ %H:%M:%S)")))
