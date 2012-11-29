(set-language-environment 'Chinese-GB)
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

