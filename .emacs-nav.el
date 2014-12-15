
(winner-mode)
(windmove-default-keybindings)
(global-set-key (kbd "C-M-<left>")
                (lambda ()
                   (interactive)
                  (shrink-window-horizontally 4)))
(global-set-key (kbd "C-M-<right>")
                (lambda ()
                  (interactive)
                  (enlarge-window-horizontally 4)))
(global-set-key (kbd "C-M-<down>") 'shrink-window)
(global-set-key (kbd "C-M-<up>") 'enlarge-window)

(ido-mode 1)
(setq ido-decorations '("\n-> " "" "\n " "\n ..." "[" "]"
			" [No match]" " [Matched]"
			" [Not readable]"
			" [Too big]" " [Confirm]"))
(setq ido-default-buffer-method 'selected-window)

(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

(setq-default dired-omit-files-p t)
(setq dired-omit-files
      (concat "^\\.?#"
	      "\\|^\\.$"))

(setq dired-details-hidden-string "")
(add-hook 'dired-load-hook
	  (lambda ()
	    (load "dired-x")))
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(autoload 'dired-jump "dired-x")
(define-key global-map (kbd "C-x C-j") 'dired-jump)

(eval-after-load 'grep    ; or grep-mode-hook
  '(progn
     (grep-apply-setting 'grep-command "grep --color -nH --exclude=\"*min.*\" --exclude=TAGS -e ")
     (grep-apply-setting 'grep-template "grep <X> <C> --color -nH --exclude=\"min.*\" --exclude=TAGS -e <R> <F>")
     (grep-apply-setting 'grep-find-command '("find . -type f -exec grep --color -nH --exclude=\"*min.*\" --exclude=TAGS -e  {} +" . 42))
     (grep-apply-setting 'grep-find-template "find . <X> -type f <F> -exec grep <C> --color -nH --exclude=\"*min.*\" --exclude=TAGS -e <R> {} +")))
