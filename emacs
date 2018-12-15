;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
												 ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(create-lockfiles nil)
 '(make-backup-files nil)
 '(osx-clipboard-mode 1)
 '(package-selected-packages
   (quote
    (rjsx-mode js-auto-format-mode js2-mode projectile-rails helm-ag undo-tree helm-projectile helm zenburn-theme osx-browse osx-lib osx-clipboard web-mode magit projectile)))
 '(projectile-mode 1 nil (projectile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-attr-indent-offset 2)
(setq js-indent-level 2)
(setq-default tab-width 2)


(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(global-set-key (kbd "C-x g") 'magit-status)
(load-theme 'zenburn t)

(setq insert-directory-program (executable-find "gls"))

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x O") #'org-open-at-point-global)
(helm-mode 1)
(helm-projectile-on)
(global-undo-tree-mode)

(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . rjsx-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
;; (add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
;; (add-hook 'js2-jsx-mode-hook #'js-auto-format-mode)
;; (custom-set-variables
;;   '(js-auto-format-command "prettier")
;;   '(js-auto-format-command-args "--write --single-quote --no-semi"))


(yas-global-mode 1)


(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.org/gtd.org" "Tasks")
         "* TODO %?\nEntered on %U\n%i\n%a")
        ("j" "Journal" entry (file+datetree "~/.org/journal.org")
         "* %?\nEntered on %U\n%i\n%a")
        ("n" "Network" entry (file+datetree "~/.org/network.org")
         "* %?\nEntered on %U\n%i\n%a")
        ("r" "Ruby" entry (file+datetree "~/.org/ruby.org")
         "* %?\nEntered on %U\n%i\n%a")))
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
(setq insert-directory-program (executable-find "gls"))


;; functions
(defun gtd ()
  (interactive)
  (find-file "~/.org/gtd.org")
  )
(defun find-first-non-ascii-char ()
  "Find the first non-ascii character from point onwards."
  (interactive)
  (let (point)
    (save-excursion
      (setq point
            (catch 'non-ascii
              (while (not (eobp))
                (or (eq (char-charset (following-char))
                        'ascii)
                    (throw 'non-ascii (point)))
                (forward-char 1)))))
    (if point
        (goto-char point)
      (message "No non-ascii characters."))))
(defun string-dec-to-hex ()
  "replaces decimal number under cursor with hexadecimal equivalent"
  (interactive)
  (let* ((dec-string (thing-at-point 'word))
         (bounds (bounds-of-thing-at-point 'word))
         (dec (string-to-number dec-string))
         (hex (format "%x" dec)))
    (delete-region (car bounds) (cdr bounds))
    (insert hex)))

(defun string-hex-to-dec ()
  "replaces decimal number under cursor with hexadecimal equivalent"
  (interactive)
  (let* ((dec-string (thing-at-point 'word))
         (bounds (bounds-of-thing-at-point 'word))
         (dec (string-to-number dec-string 16))
         (hex (format "%d" dec)))
    (delete-region (car bounds) (cdr bounds))
    (insert hex)))
