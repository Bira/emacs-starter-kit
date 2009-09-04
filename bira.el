;;; elisp libraries I run from source checkouts:

(add-to-list 'load-path "/home/phil/src/elisp/clojure-mode")

;;; Random stuff

;; If we don't have XFT, let's at least pick a decent default.
(if (< emacs-major-version 23)
    (ignore-errors
      (set-default-font "-xos4-terminus-medium-r-normal--16-160-72-72-c-80-iso8859-1")))

(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'esk-paredit-nonlisp))

;; unfortunately some codebases use tabs. =(
(set-default 'tab-width 4)
(set-default 'c-basic-offset 2)

(defun eshell/rm (&rest args)
  "Eshell's built-in rm is ridiculously slow."
  (shell-command (format "rm %s" (mapconcat 'identity args " "))))

;;; broken ido
(defun ido-directory-too-big-p (arg) nil)

(color-theme-blackboard)
