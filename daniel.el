;; (require 'haml-mode)


;; Ruby on Rails mode
;;(let* ((this-file (or load-file-name buffer-file-name))
;;       (this-dir (file-name-directory this-file))
;;       (rails-path (concatenate 'string this-dir "daniel/rails-reloaded")))
;;  (setq load-path (cons rails-path load-path)))

;;(require 'rails-autoload)

;;(require 'snippet)
;;(require 'find-recursive)
;;(require 'rails)
;; end:Ruby on Rails mode

;Allows syntax highlighting to work, among other things
;(global-font-lock-mode 1)

(require 'ecb)

;;Omit this if using Emacs >22 or if not using git
;; (setq load-path (cons (expand-file-name "/usr/share/doc/git-core/contrib/emacs") load-path))
;; (require 'vc-git)
;; (when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
;; (require 'git)
;; (autoload 'git-blame-mode "git-blame"
;;   "Minor mode for incremental blame for Git." t)
