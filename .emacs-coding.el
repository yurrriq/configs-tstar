

(setq-default truncate-lines t)
;; (global-linum-mode)


(eval-after-load 'js '(setq js-indent-level 8))
(add-hook 'js-mode-hook
	  (lambda ()
	    (linum-mode)))


;;; outline & outshine

(add-hook 'emacs-lisp-mode-hook       ; elisp-mode -> outline-minor-mode
          'outline-minor-mode)
(when (locate-library "outshine")     ; autoload outshine, elisp -> outshine
  (autoload 'outshine-hook-function "outshine")
  (add-hook 'emacs-lisp-mode-hook
            'outshine-hook-function))
(setq outshine-startup-folded-p t)    ; start outshine folded

;; (setq-default indent-tabs-mode nil)

;; comment-dwim is bound to M-;... that sux

(when (locate-library "rainbow-delimiters")
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode))

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning)
              end (region-end))
      (setq beg (line-beginning-position)
            end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-logical-line)))
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)

(defun my-folding-setup ()
  (interactive)
  (when (locate-library "origami")
    (require 'origami)
    (origami-mode)
    (progn
      (define-key origami-mode-map (kbd "<M-left>") 'origami-previous-fold)
      (define-key origami-mode-map (kbd "<M-right>") 'origami-next-fold)
      (define-key origami-mode-map (kbd "<M-up>") 'origami-recursively-toggle-node)
      (define-key origami-mode-map (kbd "<M-down>") 'origami-show-only-node))
    (add-to-list 'origami-parser-alist
                 '(php-mode . origami-c-style-parser))))

(add-hook 'html-mode-hook
          (lambda ()
            (linum-mode)
            (my-folding-setup)))

(when (locate-library "php-mode")
  (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode)))
(add-hook 'php-mode
          (lambda ()
            (linum-mode)
            (my-folding-setup)))

(add-hook 'js-mode-hook
          '(lambda ()
             (linum-mode)
             (my-folding-setup)))
