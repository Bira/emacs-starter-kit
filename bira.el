;;; elisp libraries I run from source checkouts:

;(add-to-list 'load-path "/home/phil/src/elisp/clojure-mode")

(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'esk-paredit-nonlisp))

;; unfortunately some codebases use tabs. =(
(set-default 'tab-width 2)
(set-default 'c-basic-offset 2)

(defun eshell/rm (&rest args)
  "Eshell's built-in rm is ridiculously slow."
  (shell-command (format "rm %s" (mapconcat 'identity args " "))))

;;; broken ido
(defun ido-directory-too-big-p (arg) nil)

(color-theme-blackboard)
