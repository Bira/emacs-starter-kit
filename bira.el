;;; elisp libraries I run from source checkouts:
(add-to-list 'load-path "/home/bira/source/elisp")
(add-to-list 'load-path "/home/bira/source/elisp/rspec-mode")


(autoload 'cucumber-mode "cucumber-mode" "Mode for editing cucumber files" t)
(autoload 'feature-mode "feature-mode" "Mode for editing feature files" t)
(autoload 'rspec-mode "rspec-mode" "Mode for editing RSpec files" t)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))

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
(color-theme-zenburn)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode2 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode3 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode4 ((((class color) (min-colors 88) (background dark)) nil))))
