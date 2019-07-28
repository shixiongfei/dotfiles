(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/") 
			 ("marmalade" . "http://marmalade-repo.org/packages/") 
			 ("org" . "https://orgmode.org/elpa/") 
			 ("melpa" . "http://melpa.org/packages/")))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
;; Install use-package(because it is used to load all other packages) and smartparens because its package name and what I will load are different
(dolist (package 
	 '(use-package)) 
  (unless (package-installed-p package) 
    (package-install package)))
;; load use-package
(eval-when-compile 
  (require 'use-package))
(provide 'package-manager)
