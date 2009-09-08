(color-theme-twilight)
(toggle-fullscreen)
(setq keybindings-file (concat dotfiles-dir "keybindings.el"))
(load keybindings-file 'noerror)
(require 'ecb)

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

