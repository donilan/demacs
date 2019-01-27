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
 '(css-indent-offset 2)
 '(js-auto-format-command "prettier")
 '(js-auto-format-command-args "--write --single-quote --no-semi --print-width 240")
 '(make-backup-files nil)
 '(osx-clipboard-mode 1)
 '(package-selected-packages
   (quote
    (rubocop rubocopfmt multiple-cursors go-autocomplete go-mode prettier-js smartparens react-snippets toml-mode yaml-mode org-pomodoro less-css-mode powerline kubernetes rvm bundler rspec-mode markdown-mode rjsx-mode js-auto-format-mode js2-mode projectile-rails helm-ag undo-tree helm-projectile helm zenburn-theme osx-browse osx-lib osx-clipboard web-mode magit projectile)))
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
(setq-default indent-tabs-mode nil)

(smartparens-global-mode)

(global-auto-revert-mode 1)
(add-hook 'dired-mode-hook 'auto-revert-mode)


(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(global-set-key (kbd "C-x g") 'magit-status)
(load-theme 'zenburn t)

(setq insert-directory-program (executable-find "gls"))

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x O") #'org-open-at-point-global)
;; mc
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C-c m >") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m <") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)

(helm-mode 1)
(helm-projectile-on)
(global-undo-tree-mode)

(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . rjsx-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
;; (add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)

;; (add-hook 'js2-jsx-mode-hook #'js-auto-format-mode)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)


(yas-global-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; ORG START
;; 创建任务时，要有一个快速的判断，包括what（做什么），who（谁来做），when（什么时候做），where（什么地点处理），why（为什么要做，可以用原始消息作为原因），how（如何做），how much（需要多长时间）。 这个判断要非常迅速，并根据判断的结果对任务进行组织，以便后来的处理和查询，通常按照可以这样的步骤分析：
;; 该任务是否属于一个项目？如果是，首先打上项目标记
;; 该任务能否在2分钟完成？如果是，马上处理，然后将任务标记为“已完成”
;; 根据重要性和紧迫性，为该任务划分优先级
;; 该任务是否需要别人处理？如果是，通知对方，然后将任务标记为“等待中”
;; 需要自己处理的任务，马上判断处理的地点/场合，并标记
;; 对于能够确定时间的任务（日程安排），标记计划处理时间，如果有截止日期，也标记上

(setq org-directory "~/.org/")
(setq org-default-notes-file "~/.org/gtd.org")
(define-key global-map "\C-cc" 'org-capture)
;; Define the custum capture templates
;; :clock-in t :clock-resume t
(setq org-capture-templates
      '(("t" "todo" entry (file+headline org-default-notes-file "Inbox")
         "* TODO %?\n%u\n%a\n")
        ("i" "Idea" entry (file+headline org-default-notes-file "Idea")
         "** SOMEDAY %? :Idea: \n%t")
        ("n" "Next Task" entry (file+headline org-default-notes-file "Tasks")
         "** NEXT %? \nDEADLINE: %t") ))
(setq org-tag-alist '(("Work" . ?w)
                      ("Project" . ?p)
                      ("Study" . ?s)
                      ("Other" . ?o)
                      ("Idea" . ?i)
                      ))
;; color for todo keywords
(setf org-todo-keyword-faces
      '(("NEXT" . (:foreground "yellow" :background "red" :bold t :weight bold))
        ("TODO" . (:foreground "cyan" :bold t :weight bold))
        ("STARTED" . (:foreground "springgreen" :bold t :weight bold))
        ("ABORT" . (:foreground "#DC143C" :bold t :weight bold))
        ("WAIT" . (:foreground "yellow" :bold t :weight bold))
        ("SOMEDAY" . (:foreground "deepskyblue" :bold t :weight bold))
        ("DONE" . (:foreground "gray50" :background "gray30"))))

(setq org-todo-keywords
  '((sequence "TODO(t)" "NEXT(n)" "WAIT(w@/!)" "SOMEDAY(s)" "|" "DONE(d!)" "ABORT(a@)")))
;; (setq org-refile-targets '(("~/.gtd/gtd.org" :maxlevel . 3)
;;                            ("~/.gtd/someday.org" :level . 1)
;;                            ("~/.gtd/todos.org" :maxlevel . 2)))

;; (setq insert-directory-program (executable-find "gls"))
(setq org-agenda-files '("~/.org"))
(setq org-refile-targets
      '((nil :maxlevel . 3)
        (org-agenda-files :maxlevel . 3)))

(global-set-key (kbd "C-c a") #'org-agenda)

(defun gtd ()
  (interactive)
  (find-file "~/.org/gtd.org")
  )
(setq org-archive-location "%s_archive::* Archive")
;; Org mode END

;; hooks
(setq ruby-insert-encoding-magic-comment nil)
(add-hook 'ruby-mode-hook #'rspec-mode)
(add-hook 'ruby-mode-hook #'rubocopfmt-mode)
(add-hook 'ruby-mode-hook #'rubocop-mode)


;; functions

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

;; (defun docs-generate ()
;;   "bundle exec rake docs:generate"
;;   (interactive)
;;   (bundle-exec "rake docs:generate")
;;   )
;; (define-key ruby-mode-map (kbd "C-c d") 'docs-generate)


;; quelpa
;; (quelpa
;;  '(quelpa-use-package
;;    :fetcher git
;;    :url "https://framagit.org/steckerhalter/quelpa-use-package.git"))
;; (require 'quelpa-use-package)

;; (use-package dired+
;;   :quelpa (dired+ :fetcher github :repo "emacsmirror/dired-plus"))
;; ;; quelpa
;; (use-package dired+
;;   :load-path "~/.emacs.d/packages/dired+")
