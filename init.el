(setq custom-file "~/.emacs.custom")
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(ido-mode 1)
(ido-everywhere 1)
;; (tool-bar-mode -1)
;; there is no tool bar as this is a nox version. Got it.
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(menu-bar-mode -1)
(global-display-line-numbers-mode 1)
(show-paren-mode 1)
(require 'package)
(add-to-list 'package-archives
    '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7" default))
 '(display-line-numbers-type 'relative)
 '(package-selected-packages '(rust-mode gruber-darker-theme markdown-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun rc/duplicate-line-2 ()
  "Duplicate current line"
  (interactive)
  (let ((column ( - (point) (point-at-bol)))
	(line (let ((s (thing-at-point 'line t)))
		(if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

;; (define-key global-map "\C-u" 'rc/duplicate-line-2)
