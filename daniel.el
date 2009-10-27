;;(color-theme-twilight)
;;(toggle-fullscreen)
(setq keybindings-file (concat dotfiles-dir "keybindings.el"))
(load keybindings-file 'noerror)
(require 'haml-mode)

(setq auto-mode-alist
      (append
       '(("\\.haml\\'" . haml-mode))
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))



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
;; (add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))

;;Omit this if using Emacs >22 or if not using git
;; (setq load-path (cons (expand-file-name "/usr/share/doc/git-core/contrib/emacs") load-path))
;; (require 'vc-git)
;; (when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
;; (require 'git)
;; (autoload 'git-blame-mode "git-blame"
;;   "Minor mode for incremental blame for Git." t)

;; (autoload 'test-case-mode "test-case-mode" nil t)
;; (autoload 'enable-test-case-mode-if-test "test-case-mode")
;; (autoload 'test-case-find-all-tests "test-case-mode" nil t)
;; (autoload 'test-case-compilation-finish-run-all "test-case-mode")

;; ;; Enable test-case-mode automatically when opening test files
;; (add-hook 'find-file-hook 'enable-test-case-mode-if-test)

;; feature-mode for cucumber
(add-to-list 'load-path (concat dotfiles-dir "daniel/feature-mode"))
;; and load it
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

