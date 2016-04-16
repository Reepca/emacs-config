(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(fill-column 80)
 '(lua-default-application "luajit"))
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

(add-to-list 'package-archives
	     '("elpy" . "https://jorgenschaefer.github.io/packages"))
(elpy-enable)

(require 'smart-compile)
(add-to-list 'smart-compile-alist '(ada-mode . "gnatmake -o %n %f -g -cargs -gnatq -gnatQ -bargs  -largs"))

(add-to-list 'load-path "~/.emacs.d/manual-stuff/")

(autoload 'forth-mode "gforth.el")
     (setq auto-mode-alist (cons '("\\.fs\\'" . forth-mode)
     			    auto-mode-alist))
     (autoload 'forth-block-mode "gforth.el")
     (setq auto-mode-alist (cons '("\\.fb\\'" . forth-block-mode)
     			    auto-mode-alist))
     (add-hook 'forth-mode-hook (function (lambda ()
        ;; customize variables here:
        (setq forth-indent-level 4)
        (setq forth-minor-indent-level 2)
        (setq forth-hilight-level 3)
        ;;; ...
     )))



(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)
