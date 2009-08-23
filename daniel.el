(setq keybindings-file "~/.emacs.d/keybindings.el")
(load keybindings-file)


;;use Twilight color scheme
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     ;;if this ever fails, include the following line
     ;;(color-theme-initialize)
     (color-theme-twilight)))


;;maximize the window
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)

;;disable system beep
(setq visible-bell t)
(global-hl-line-mode)
;;highlight the marked region & un-mark upon buffer modification
(transient-mark-mode t)

;;enable Emacs to copy to and from clipboard using normal
;;kill and yank commands
(setq x-select-enable-clipboard t)

;;for better buffer navigation
(require 'ido)
(ido-mode t)

(require 'haml-mode)

;; ;;ruby and ruby on rails
;;(require 'snippet)
;;(require 'find-files-in-project.el)
;;(require 'inf-ruby)
;;(setq load-path (cons "~/.emacs.d/daniel/rails" load-path))
;;(add-to-list 'load-path "~/.emacs.d/daniel/rails")
;;(require 'rails)
;;end:ruby and ruby on rails


(setq load-path (cons (expand-file-name "~/.emacs.d/daniel/rails-reloaded") load-path))
(require 'rails-autoload)

;Allows syntax highlighting to work, among other things
;(global-font-lock-mode 1)

(require 'ecb)

;;Omit this if using Emacs >22 or if not using git
(setq load-path (cons (expand-file-name "/usr/share/doc/git-core/contrib/emacs") load-path))
(require 'vc-git)
(when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
(require 'git)
(autoload 'git-blame-mode "git-blame"
  "Minor mode for incremental blame for Git." t)
