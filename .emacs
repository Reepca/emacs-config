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
    (pov-mode yaml-mode gnu-apl-mode csharp-mode web-mode guix mmm-mode php-mode cyberpunk-theme color-theme-solarized w3m w3 use-package swiper smart-compile slime rainbow-delimiters paredit nhexl-mode magit lua-mode glsl-mode geiser eww-lnum emms elpy auctex-latexmk)))
 '(safe-local-variable-values
   (quote
    ((eval modify-syntax-entry 43 "'")
     (eval modify-syntax-entry 36 "'")
     (eval modify-syntax-entry 126 "'")
     (bug-reference-bug-regexp . "<https?://\\(debbugs\\|bugs\\)\\.gnu\\.org/\\([0-9]+\\)>"))))
 '(send-mail-function (quote mailclient-send-it)))
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
(use-package web-mode)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
;; (if (file-exists-p "~/.emacs.d/manual-stuff/forth-mode")
;;     (progn (push "~/.emacs.d/manual-stuff/forth-mode" load-path)
;; 	   (require 'forth-mode)
;; 	   (require 'forth-block-mode)
;; 	   (require 'forth-interaction-mode))
;;   (use-package forth-mode))
(setq inferior-lisp-program "sbcl")
(add-to-list 'load-path "~/.emacs.d/lisp/")

					;(color-theme-deep-blue)
(setq slime-contribs '(slime-fancy)) ; YAYYY
(defun lisp-defaults ()
  (paredit-mode)
  (rainbow-delimiters-mode)
  (auto-fill-mode))
(add-hook 'scheme-mode-hook #'lisp-defaults)
(add-hook 'emacs-lisp-mode-hook #'lisp-defaults)

(defun cstyle-defaults ()
  (auto-fill-mode)
  (company-mode))
(add-hook 'c-mode-common-hook #'cstyle-defaults)

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

(autoload 'forth-mode "gforth.el")
(setq auto-mode-alist (cons '("\\.fs\\'" . forth-mode)
     			    auto-mode-alist))
(autoload 'forth-block-mode "gforth.el")
(setq auto-mode-alist (cons '("\\.fb\\'" . forth-block-mode)
     			    auto-mode-alist))
(add-hook 'forth-mode-hook (function (lambda ()
				       (auto-fill-mode)
				       ;; customize variables here:
				       (setq forth-indent-level 4)
				       (setq forth-minor-indent-level 2)
				       (setq forth-hilight-level 3))))


(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(set-face-attribute 'default nil :height 110)
(setq message-send-mail-function 'smtpmail-send-it)
(setq ring-bell-function 'ignore)
(add-hook 'org-mode-hook (lambda ()
			   (auto-fill-mode)))

;; ggtags conf
(setq company-backends '((company-dabbrev-code company-gtags)))
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))
(require 'ggtags)
(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

(set-fontset-font "fontset-default" nil "Unifont Upper" nil 'append)
