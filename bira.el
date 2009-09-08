;;; elisp libraries I run from source checkouts:

;(add-to-list 'load-path "/home/bira/source/elisp/clojure-mode")

;; unfortunately some codebases use tabs. =(
(set-default 'tab-width 2)
(set-default 'c-basic-offset 2)

(defun eshell/rm (&rest args)
  "Eshell's built-in rm is ridiculously slow."
  (shell-command (format "rm %s" (mapconcat 'identity args " "))))

;;; broken ido
(defun ido-directory-too-big-p (arg) nil)

;; remove trailing whitespace before saving

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-set-key "\M-g" 'goto-line)

;;ruby-electric

(add-hook 'ruby-mode-hook
          (lambda ()
            (require 'ruby-electric)
            (ruby-electric-mode t)
            ))

(color-theme-blackboard)
