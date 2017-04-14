(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   (quote
    ("38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(fill-column 80)
 '(lua-default-application "luajit")
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (guix mmm-mode php-mode cyberpunk-theme color-theme-solarized w3m w3 use-package swiper smart-compile slime rainbow-delimiters paredit nhexl-mode magit lua-mode glsl-mode geiser eww-lnum emms elpy auctex-latexmk)))
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
(use-package auctex-latexmk)
(if (file-exists-p "~/.emacs.d/manual-stuff/forth-mode")
    (progn (push "~/.emacs.d/manual-stuff/forth-mode" load-path)
	   (require 'forth-mode)
	   (require 'forth-block-mode)
	   (require 'forth-interaction-mode))
  (use-package forth-mode))
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

(defun lenny-face (prefix)
  (interactive "P")
  (insert "( ͡° ͜ʖ ͡°)"))

;; NOTE: Some programs emacs relies on to do its bidding in this config. These
;; include Steel Bank Common Lisp, Python 3, any compiling stuff (like gcc) ,
;; git, latex, and gforth.


(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(set-face-attribute 'default nil :height 130)
