(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(fill-column 80)
 '(lua-default-application "luajit")
 '(safe-local-variable-values
   (quote
    ((eval modify-syntax-entry 43 "'")
     (eval modify-syntax-entry 36 "'")
     (eval modify-syntax-entry 126 "'")
     (bug-reference-bug-regexp . "<https?://\\(debbugs\\|bugs\\)\\.gnu\\.org/\\([0-9]+\\)>")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(show-paren-mode 1)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))
(require 'use-package)
(add-to-list 'package-archives
	     '("elpy" . "https://jorgenschaefer.github.io/packages"))
(setq use-package-always-ensure t)
(use-package slime)
(use-package elpy)
(use-package emms)
(use-package smart-compile)
(use-package eww)
(use-package geiser)
(use-package magit)
(use-package rainbow-delimiters)
(use-package paredit)
(use-package auctex)
(use-package forth-mode)
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
					;(color-theme-deep-blue)
(add-to-list 'load-path "~/.guix-profile/share/emacs/site-lisp/")
(require 'guix-init nil t)
(setq slime-contribs '(slime-fancy)) ; YAYYY
(add-hook 'lisp-mode-hook (lambda ()
			   (paredit-mode)
			   (rainbow-delimiters-mode)
			   (auto-fill-mode)))

(require 'emms-setup)
(emms-standard)
(emms-default-players)
(define-emms-simple-player mplayer '(file url)
  (regexp-opt
  '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma" ".mov" ".avi" ".divx"
    ".ogm" ".asf" "mkv" "http://" "mms://" ".rm" ".rmvb" ".mp4" ".flac" ".vob"
    ".m4a" ".flv" ".ogv" ".pls" ".opus"))
  "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")

(elpy-enable)

(require 'smart-compile)
(add-to-list 'smart-compile-alist '(ada-mode . "gnatmake -o %n %f -g -cargs -gnatq -gnatQ -bargs  -largs"))

(add-to-list 'load-path "~/.emacs.d/manual-stuff/")

(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

(defun brainpower (prefix)
  (interactive "P")
  (format "prefix: ~a" prefix)
  (let ((foo))
    (dotimes (i (prefix-numeric-value prefix) foo)
      (insert "O-oooooooooo AAAAE-A-A-I-A-U- JO-oooooooooooo AAE-O-A-A-U-U-A- E-eee-ee-eee AAAAE-A-E-I-E-A- JO-ooo-oo-oo-oo EEEEO-A-AAA-AAAA"))))

;(global-set-key (kbd "C-c C-l") 'brainpower)

(require 'clhs-use-local "~/quicklisp/clhs-use-local.el" t)
(defun shrug (prefix)
  (interactive "P")
  (insert "¯\\_(ツ)_/¯"))

(setq password-cache-expiry nil)
