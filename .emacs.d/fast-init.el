;; Eivind Hjertnes' Emacs configration
;; This is a init file I use to start emacs fast, without any third party modules.
;; Mainly through $EDITOR
(add-to-list 'load-path "~/.emacs.d/lisp/")
;; Set up the emacs package manager
(require 'package-manager)
;; Loads functions I use various places in my config
(require 'funcs)
;; Configures things that are a part of emacs out of the box, and enables modes that come with emacs
(require 'pre)
;; Load personal.el if it exist, a file used to override settings per system. Ignored by git. Mostly used to override fonts per system
(when (file-exists-p "~/.emacs.d/personal.el") 
  (load "~/.emacs.d/personal.el"))
