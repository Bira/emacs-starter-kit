;;; elisp libraries I run from source checkouts:

(add-to-list 'load-path "/home/bira/source/elisp/cucumber.el")
(add-to-list 'load-path "/home/bira/source/clojure/clojure-mode")
(add-to-list 'load-path "/home/bira/source/clojure/swank-clojure/src/emacs")

(autoload 'cucumber-mode "cucumber-mode" "Mode for editing cucumber files" t)
(autoload 'feature-mode "feature-mode" "Mode for editing feature files" t)
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
            (ruby-electric-mode t)
            ))

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

;; SLIME e swank-clojure

(require 'clojure-mode)

(require 'swank-clojure-autoload)

(swank-clojure-config
 (setq swank-clojure-jar-path "/home/bira/source/clojure/clojure/clojure.jar")
 (setq swank-clojure-extra-classpaths
       (list "/home/bira/source/clojure/clojure-contrib/clojure-contrib.jar"
             "/home/bira/source/clojure/swank-clojure/src/main/clojure")))

(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))))

(add-to-list 'load-path "/home/bira/source/clojure/slime")
(require 'slime)

(slime-setup)


(global-linum-mode)
(setq whitespace-line-column 80)
(set-variable 'whitespace-style '(trailing lines-tail))
(global-whitespace-mode)
(color-theme-blackboard)
