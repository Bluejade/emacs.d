;;colorize comment text
(set-face-foreground 'font-lock-comment-face "red")
;;colorize comment delimiter
(set-face-foreground 'font-lock-comment-delimiter-face "red")

;;(color-theme-twilight)
;;(toggle-fullscreen)
(setq keybindings-file (concat dotfiles-dir "keybindings.el"))
(load keybindings-file 'noerror)
(require 'haml-mode)

;;avoid error when first opening Ruby files
(require 'tramp-cmds)

(setq auto-mode-alist
      (append
       '(("\\.haml\\'" . haml-mode))
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


(require 'modeline-posn)
(add-hook 'emacs-lisp-mode-hook (lambda () (setq modelinepos-column-limit 120)))
(add-hook 'ruby-mode-hook (lambda () (setq modelinepos-column-limit 80)))
(add-hook 'feature-mode-hook (lambda () (setq modelinepos-column-limit 300)))
(add-hook 'haml-mode-hook (lambda () (setq modelinepos-column-limit 300)))

(require 'xclip)
(turn-on-xclip)
;; (require 'ecb)

;; Ruby electric mode interfered with auto indentation, so that
;; hitting return left the cursor at the beginning of a line.
;; Not sure why, but no time to look into it now.
;; ruby-insert-end was part of ruby-mode.el, but removed from the elpa
;; version. Add it here because ruby electric mode requires it
;; See comment by Phil Hagelberg in the following thread:
;; http://groups.google.com/group/emacs-on-rails/browse_thread/thread/0ae87fc797822bf3?pli=1
(defun ruby-insert-end ()
  "Insert \"end\" at point and reindent current line."
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))
(require 'ruby-electric)
(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))

;; feature-mode for cucumber
(add-to-list 'load-path (concat dotfiles-dir "daniel/feature-mode"))
;; and load it
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
