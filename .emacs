
(load-theme 'wombat)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(setq visible-bell t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

(set-face-attribute 'default nil
		    :family "Consolas"
		    :height 100)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ;; ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ;; ("org" . "http://orgmode.org/elpa/")
	))

;; packages I'm using:
;; outorg, outshine, rainbow-delimmitters, vimrc-mode, origami

(package-initialize)

(load-file "~/.emacs-nav.el")
(load-file "./.emacs-coding.el")

(global-set-key (kbd "M-j")
            (lambda ()
                  (interactive)
                  (join-line -1)))

(setq calendar-latitude 47.6)
(setq calendar-longitude -122.3)
(setq calendar-location-name "Seattle, WA")

(put 'overwrite-mode 'disabled t)

(setq display-time-day-and-date t)
(display-time)
