;;; elisp libraries I run from source checkouts:

(add-to-list 'load-path "/home/bira/source/elisp/cucumber.el")
(add-to-list 'load-path "/home/bira/source/elisp/rspec-mode")

(autoload 'cucumber-mode "cucumber-mode" "Mode for editing cucumber files" t)
(autoload 'feature-mode "feature-mode" "Mode for editing feature files" t)
(autoload 'rspec-mode "rspec-mode" "Mode for editing RSpec files" t)
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

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
            (require 'rspec-mode)
            (ruby-electric-mode t)
            (rspec-mode t)))

;; Yay, no more encoding comments!

(setq ruby-insert-encoding-magic-comment nil)

;; Rudel

(defun load-rudel ()
  (interactive)
  (add-to-list 'load-path "~/source/cedet/eieio")
  (add-to-list 'load-path "~/source/cedet/common")
  (add-to-list 'load-path "~/source/rudel/")
  (add-to-list 'load-path "~/source/rudel/jupiter")
  (add-to-list 'load-path "~/source/rudel/obby")
  (require 'rudel-mode)
  (require 'rudel-obby)
  (global-rudel-minor-mode))


;; Swank-clojure customization

(setq swank-clojure-classpath
      (directory-files "~/source/ClojureX/lib" t ".jar$"))



(global-linum-mode)
(setq whitespace-line-column 80)
(set-variable 'whitespace-style '(trailing lines-tail))
(global-whitespace-mode)
(if window-system
    (color-theme-zenburn))
