;;colorize comment text
(set-face-foreground 'font-lock-comment-face "red")
;;colorize comment delimiter
(set-face-foreground 'font-lock-comment-delimiter-face "red")

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


(require 'modeline-posn)
(setq modelinepos-column-limit 80)
(column-number-mode 1)

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


;; The following is from http://hugoheden.wordpress.com/2009/03/08/copypaste-with-emacs-in-terminal/
;; If emacs is run in a terminal, the clipboard- functions have no
;; effect. Instead, we use of xsel, see
;; http://www.vergenet.net/~conrad/software/xsel/ -- "a command-line
;; program for getting and setting the contents of the X selection"
(unless window-system
  ;; Callback for when user cuts
  (defun xsel-cut-function (text &optional push)

    ;; Insert text to temp-buffer, and "send" content to xsel
    ;; stdin
    (with-temp-buffer
      (insert text)

      ;; I prefer using the "clipboard" selection (the
      ;; one the
      ;; typically is used by c-c/c-v) before the
      ;; primary selection
      ;; (that uses mouse-select/middle-button-click)
      (call-process-region (point-min)
                           (point-max)
                           "xsel" nil 0 nil "--clipboard" "--input")))

  ;; Call back for when user pastes
  (defun xsel-paste-function ()

    ;; Find out what is current selection by xsel. If it is
    ;; different
    ;; from the top of the kill-ring (car kill-ring), then
    ;; return
    ;; it. Else, nil is returned, so whatever is in the top of
    ;; the
    ;; kill-ring will be used.
    (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))

      (unless (string= (car kill-ring)
                       xsel-output)

        xsel-output)))

  ;; Attach callbacks to hooks
  (setq interprogram-cut-function 'xsel-cut-function)

  (setq interprogram-paste-function 'xsel-paste-function)

  ;; Idea from
  ;; http://shreevatsa.wordpress.com/2006/10/22/emacs-copypaste-and-x/
  ;; http://www.mail-archive.com/help-gnu-emacs@gnu.org/msg03577.html
  )
