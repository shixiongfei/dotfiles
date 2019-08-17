;; Eivindp Hjertnes' Emacs configration
(add-to-list 'load-path "~/.emacs.d/lisp/")
;; Set up the emacs package manager
(require 'package-manager)
;; Load personal.el if it exist, a file used to override settings per system. Ignored by git. Mostly used to override fonts per system
(when (file-exists-p "~/.emacs.d/personal.el") 
  (load "~/.emacs.d/personal.el"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
