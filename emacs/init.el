(setq inhibit-startup-screen t)
(setq default-frame-alist '((font . "Iosevka Nerd Font 14")))
(setq create-lockfiles nil)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
;  backup-by-copying t    ; Don't delink hardlinks
;  version-control t      ; Use version numbers on backups
;  delete-old-versions t  ; Automatically delete excess backups
;  kept-new-versions 20   ; how many of the newest versions to keep
;  kept-old-versions 5    ; and how many of the old
;  )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(setq package-selected-packages '(projectile helm which-key magit all-the-icons eglot eglot-java yasnippet evil evil-collection evil-leader undo-fu doom-modeline doom-themes treemacs-evil dap-mode company company-quickhelp flycheck tree-sitter tree-sitter-langs))

(package-install-selected-packages)
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(global-evil-leader-mode)
(require 'evil)
(require 'evil-collection)
(require 'evil-leader)
(require 'undo-fu)
(setq evil-overiding-maps nil)
(evil-set-undo-system 'undo-fu)
(evil-mode 1)
(evil-collection-init)

(require 'which-key)

(require 'doom-themes)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(load-theme 'doom-one t)
(doom-themes-visual-bell-config)

;; or for treemacs users
(setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
(doom-themes-treemacs-config)
(setq doom-themes-treemacs-enable-variable-pitch nil)

(require 'eglot)
(require 'eglot-java)
(require 'flymake)
(require 'eldoc)
(require 'company)
(require 'yasnippet)
(add-hook 'after-init-hook 'global-company-mode)
(company-quickhelp-mode)
(setq company-quickhelp-delay 0.5)
(setq gdb-many-windows t)
(yas-global-mode 1)

(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'java-mode-hook 'eglot-java-mode)

(require 'treemacs-evil)
(require 'doom-modeline)
(require 'all-the-icons)
(doom-modeline-mode 1)

(require 'helm)
(helm-mode 1)
(define-key evil-motion-state-map [remap find-file] 'helm-find-files)
(define-key evil-motion-state-map [remap execute-extended-command] 'helm-M-x)
(define-key evil-motion-state-map [remap switch-to-buffer] 'helm-mini)

(setq gc-cons-threshold (* 100 1024 1024) read-process-output-max (* 1024 1024))

(require 'dap-cpptools)
;(require 'lsp-treemacs)

(evil-leader/set-leader "<SPC>")
; set leader key in evil-motion-state-map state
					;
(define-key evil-motion-state-map (kbd"C-h") 'evil-window-left)
(define-key evil-motion-state-map (kbd"C-l") 'evil-window-right)
(define-key evil-motion-state-map (kbd"C-j") 'evil-window-down)
(define-key evil-motion-state-map (kbd"C-k") 'evil-window-up)

(evil-leader/set-key
  "e" 'treemacs
  "rn" 'eglot-rename
  "ca" 'eglot-code-actions
  ;"h" 'lsp-describe-thing-at-point
  "o" 'eglot-code-actions-organize-imports
  "f" 'eglot-format-buffer
  ;"k" 'lsp-describe-thing-at-point
  "g" 'gdb
  "b" 'helm-buffers-list
  "z" 'ff-find-related-file)
(define-key evil-motion-state-map (kbd"gcc") 'comment-line)

(require 'treemacs-evil)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(require 'tree-sitter)
(require 'tree-sitter-hl)
(require 'tree-sitter-langs)
(require 'tree-sitter-debug)
(require 'tree-sitter-query)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook 'tree-sitter-hl-mode)

;; Compilation
(setq compilation-scroll-output 1) ;; automatically scroll the compilation window
;; (setq compilation-window-height 10) ;; Set the compilation window height...
(setq compilation-finish-function ;; Auto-dismiss compilation buffer...
      (lambda (buf str)
	(if (string-match "exited abevil-normal-state-maply" str)
	    (message "compilation errors, press F6 to visit")
					; no errors, make the compilation window go away after 2.5 sec
	  (run-at-time 2.5 nil 'delete-windows-on buf)
	  (message "No compilation errors!"))))

(defun my-compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
        (let* ((w (split-window-vertically))
               (h (window-height w)))
          (select-window w)
          (switch-to-buffer "*compilation*")
          (shrink-window (- h compilation-window-height)))))))
(add-hook 'compilation-mode-hook 'my-compilation-hook)

(require 'magit)

(require 'cl) ; If you don't have it already
(defun* get-closest-pathname (&optional (file "Makefile"))
					;  "This function walks up the current path until it finds Makefile and then retu
					;rns the path to it."
  (let ((root (expand-file-name "/")))
    (expand-file-name file
		      (cl-loop
		       for d = default-directory then (expand-file-name ".." d)
		       if (file-exists-p (expand-file-name file d))
		       return d
		       if (equal d root)
		       return nil))))

(evil-leader/set-key
  "cc" 'my-compile-clean-func
  "cr" 'my-compile-func)
(define-key evil-motion-state-map (kbd"gn") 'next-error)
(define-key evil-motion-state-map (kbd"gp") 'previous-error)

;;html code fold
;; When called this automatically detects the submode at the current location.
;; It will then either forward to end of tag(HTML) or end of code block(JS/CSS).
;; This will be passed to hs-minor-mode to properly navigate and fold the code.
(defun mhtml-forward (arg)
  (interactive "P")
  (pcase (get-text-property (point) 'mhtml-submode)
    ('nil (sgml-skip-tag-forward 1))
    (submode (forward-sexp))))

;; Adds the tag and curly-brace detection to hs-minor-mode for mhtml.
(add-to-list 'hs-special-modes-alist
	     '(mhtml-mode
	       "{\\|<[^/>]+?"
	       "}\\|</[^/>]*[^/]>"
	       "<!--"
	       mhtml-forward
	       nil))
(projectile-mode 1)
