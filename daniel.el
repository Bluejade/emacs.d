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

;;don't overwrite the Emacs Starter Kit init.el file when setting
;;Emacs options via the customize-option and customize-group commands
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;enable use of control key sequence instead of alt key
;;also, I don't use emacs for e-mail, so make control-x m
;;act as the modifier sequence, rather than e-mail
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-xm" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-cm" 'execute-extended-command)

;;(global-set-key "\C-x\C-g" 'goto-line)
(global-set-key "\C-xz" 'undo)
(global-set-key "\C-z" 'undo)

(global-set-key "\C-t" 'beginning-of-buffer)
(global-set-key "\C-xt" 'end-of-buffer)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key "\M-r" 'isearch-backward-regexp)

(global-set-key "\M-i" 'indent-relative)

;;assign macro execution to F5 key
(global-set-key [f5] 'call-last-kbd-macro)

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
(global-set-key [(f4)] 'ecb-activate)

