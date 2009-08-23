;;Enable use of control key sequence instead of alt key
;;because the alt key is awkward to reach.
;;Also, I don't use emacs for e-mail, so make control-x m
;;act as the modifier sequence, rather than e-mail.
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-xm" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-cm" 'execute-extended-command)

(global-set-key "\C-x\C-g" 'goto-line)
(global-set-key "\C-xz" 'undo)
(global-set-key "\C-z" 'undo)

(global-set-key "\C-t" 'beginning-of-buffer)
(global-set-key "\C-xt" 'end-of-buffer)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;;alredy set by the Emacs starter kit
;;(global-set-key "\M-s" 'isearch-forward-regexp)
;;(global-set-key "\M-r" 'isearch-backward-regexp)

;;C-i is by default bound to lisp-indent-line, which
;;is already bound to TAB, so make C-i indent-relative
(global-set-key "\C-i" 'indent-relative)

;;assign macro execution to F5 key
(global-set-key [f5] 'call-last-kbd-macro)

;;activate Emacs Code Browser with F4
(global-set-key [f4] 'ecb-activate)
;;deactivate Emacs Code Browser with shift F4
(global-set-key [S-f4] 'ecb-deactivate)
