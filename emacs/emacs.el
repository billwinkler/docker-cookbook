(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(backup-inhibited t t)
 '(column-number-mode t)
 '(cursor-type (quote bar) t)
 '(delete-selection-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil))

(defvar missing-packages-list nil
  "List of packages that `try-require' can't find.")

;; attempt to load a feature/library, failing silently
(defun try-require (feature)
  "Attempt to load a library or module. Return true if the
library given as argument is successfully loaded. If not, instead
of an error, just add the package to a list of missing packages."
  (condition-case err
      ;; protected form
      (progn
        (message "Checking for library `%s'..." feature)
        (if (stringp feature)
            (load-library feature)
          (require feature))
        (message "Checking for library `%s'... Found" feature))
    ;; error handler
    (file-error  ; condition
     (progn
       (message "Checking for library `%s'... Missing" feature)
       (add-to-list 'missing-packages-list feature 'append))
     nil)))


;; Package.el customization
(package-initialize)
(add-to-list 'package-archives 
	     '("marmalade" . "http://marmalade-repo.org/packages/")) 
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
 
;; paredit
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(global-set-key [f7] 'paredit-mode)
 
;; clojure-mode
(global-set-key [f9] 'nrepl-jack-in)
 
;; nrepl
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*")
(add-hook 'nrepl-mode-hook 'paredit-mode)
 
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
 
(setq nrepl-popup-stacktraces nil)
(setq nrepl-popup-stacktraces-in-repl t)

(show-paren-mode t)
;; uncomment following to see whole block highlighted
;;(setq show-paren-style 'expression)
;;(setq show-paren-style nil)

(setq ispell-dictionary "english")
;; after brew install ispell --with-lang-en
(setq ispell-program-name "/usr/local/bin/ispell")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default nil :height 180)





