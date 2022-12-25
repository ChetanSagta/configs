(setq inhibit-startup-screen t)
(setq default-frame-alist '((font . "Source Code Pro 12")))
(setq create-lockfiles nil)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(global-display-line-numbers-mode)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(setq package-selected-packages
      '(helm which-key vterm magit all-the-icons lsp-mode evil evil-collection evil-leader undo-fu doom-modeline doom-themes treemacs-evil dap-mode company company-quickhelp flycheck lsp-ui tree-sitter tree-sitter-langs))

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

(require 'recentf)
(recentf-mode 1)

(require 'lsp-mode)
(require 'lsp-ui)
(add-hook 'c++-mode-hook 'lsp)
(add-hook 'c-mode-hook 'lsp)
(company-quickhelp-mode)
(setq company-quickhelp-delay 0.5)
(setq gdb-many-windows t)

(setq lsp-ui-doc-enable t)
(setq lsp-eldoc-hook nil)
(setq lsp-ui-doc-delay 2)
(setq lsp-signature-render-documentation t)

(require 'treemacs-evil)
(require 'doom-modeline)
(require 'all-the-icons)
(doom-modeline-mode 1)

;; How tall the mode-line should be. It's only respected in GUI.
;; If the actual char height is larger, it respects the actual height.
(setq doom-modeline-height 25)

;; How wide the mode-line bar should be. It's only respected in GUI.
(setq doom-modeline-bar-width 4)

;; Whether to use hud instead of default bar. It's only respected in GUI.
(setq doom-modeline-hud t)

;; The limit of the window width.
;; If `window-width' is smaller than the limit, some information won't be
;; displayed. It can be an integer or a float number. `nil' means no limit."
(setq doom-modeline-window-width-limit 85)

(setq doom-modeline-project-detection 'auto)

(setq doom-modeline-buffer-file-name-style 'auto)

(setq doom-modeline-icon t)

;; Whether display the icon for `major-mode'. It respects `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)

;; Whether display the colorful icon for `major-mode'.
;; It respects `all-the-icons-color-icons'.
(setq doom-modeline-major-mode-color-icon t)

;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
(setq doom-modeline-buffer-state-icon t)

;; Whether display the modification icon for the buffer.
;; It respects `doom-modeline-icon' and `doom-modeline-buffer-state-icon'.
(setq doom-modeline-buffer-modification-icon t)

;; Whether display the time icon. It respects variable `doom-modeline-icon'.
(setq doom-modeline-time-icon t)

;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
(setq doom-modeline-unicode-fallback t)

;; Whether display the buffer name.
(setq doom-modeline-buffer-name t)

;; Whether highlight the modified buffer name.
(setq doom-modeline-highlight-modified-buffer-name t)

;; Whether display the minor modes in the mode-line.
(setq doom-modeline-minor-modes nil)

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count nil)

;; Whether display the buffer encoding.
(setq doom-modeline-buffer-encoding t)

;; Whether display the indentation information.
(setq doom-modeline-indent-info nil)

;; If non-nil, only display one number for checker information if applicable.
(setq doom-modeline-checker-simple-format t)

;; The maximum number displayed for notifications.
(setq doom-modeline-number-limit 99)

;; The maximum displayed length of the branch name of version control.
(setq doom-modeline-vcs-max-length 12)

;; Whether display the workspace name. Non-nil to display in the mode-line.
(setq doom-modeline-workspace-name t)

;; Whether display the perspective name. Non-nil to display in the mode-line.
(setq doom-modeline-persp-name t)

;; If non nil the default perspective name is displayed in the mode-line.
(setq doom-modeline-display-default-persp-name nil)

;; If non nil the perspective name is displayed alongside a folder icon.
(setq doom-modeline-persp-icon t)

;; Whether display the `lsp' state. Non-nil to display in the mode-line.
(setq doom-modeline-lsp t)
;; Whether display the GitHub notifications. It requires `ghub' package.
(setq doom-modeline-github nil)

;; The interval of checking GitHub.
(setq doom-modeline-github-interval (* 30 60))

;; Whether display the modal state.
;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
(setq doom-modeline-modal t)

;; Whether display the modal state icon.
;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
(setq doom-modeline-modal-icon t)

;; Whether display the gnus notifications.
(setq doom-modeline-gnus t)

;; Whether gnus should automatically be updated and how often (set to 0 or smaller than 0 to disable)
(setq doom-modeline-gnus-timer 2)

;; Wheter groups should be excludede when gnus automatically being updated.
(setq doom-modeline-gnus-excluded-groups '("dummy.group"))

;; Whether display the IRC notifications. It requires `circe' or `erc' package.
(setq doom-modeline-irc t)

;; Function to stylize the irc buffer names.
(setq doom-modeline-irc-stylize 'identity)

;; Whether display the time. It respects `display-time-mode'.
(setq doom-modeline-time t)

;; Whether display the misc segment on all mode lines.
;; If nil, display only if the mode line is active.
(setq doom-modeline-display-misc-in-all-mode-lines t)

;; Whether display the environment version.
(setq doom-modeline-env-version t)

;; What to display as the version while a new one is being loaded
(setq doom-modeline-env-load-string "...")

;; Hooks that run before/after the modeline version string is updated
(setq doom-modeline-before-update-env-hook nil)
(setq doom-modeline-after-update-env-hook nil)


(require 'helm)
(helm-mode 1)
(define-key evil-normal-state-map [remap find-file] 'helm-find-files)
(define-key evil-normal-state-map [remap execute-extended-command] 'helm-M-x)
(define-key evil-normal-state-map [remap switch-to-buffer] 'helm-mini)

(setq gc-cons-threshold (* 100 1024 1024) read-process-output-max (* 1024 1024))

(require 'dap-cpptools)
(require 'lsp-treemacs)

					; set leader key in all states
;; (evil-set-leader nil (kbd"C-SPC"))
;; (evil-set-leader nil (kbd "SPC"))
(evil-leader/set-leader "<SPC>")
					; set leader key in evil-normal-state-map state
;; (evil-set-leader normal key (kbd "SPC"))
					;
(define-key evil-normal-state-map (kbd"C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd"C-l") 'evil-window-right)
(define-key evil-normal-state-map (kbd"C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd"C-k") 'evil-window-up)

(evil-leader/set-key
  "e" 'treemacs
  "rn" 'lsp-rename
  "ca" 'lsp-execute-code-action
  "h" 'lsp-describe-thing-at-point
  "o" 'lsp-organize-imports
  "f" 'lsp-format-buffer
  "k" 'lsp-describe-thing-at-point
  "g" 'gdb
  "b" 'recentf-open-files)
(define-key evil-normal-state-map (kbd"gcc") 'comment-line)

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
(setq compilation-window-height 10) ;; Set the compilation window height...
(setq compilation-finish-function ;; Auto-dismiss compilation buffer...
      (lambda (buf str)
	(if (string-match "exited abevil-normal-state-maply" str)
	    (message "compilation errors, press F6 to visit")
					; no errors, make the compilation window go away after 2.5 sec
	  (run-at-time 2.5 nil 'delete-windows-on buf)
	  (message "No compilation errors!"))))

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

(require 'vterm)
(setq vterm-max-scrollback 100000)
(setq vterm-timer-delay 0.01)

;;****************************************************************
(defun my-compile-func ()
  "This function does a compile."
  (interactive)
  (compile (format "make -C %s" (file-name-directory (get-closest-pathname)))))

(defun my-compile-clean-func ()
  "This function does a clean compile."
  (interactive)
  (compile (format "make -C %s clean" (file-name-directory (get-closest-pathname
							    )))))

(defun my-compile-package-func ()
  "This function builds an Endura package."
  (interactive)
  (compile (format "make -C %s package" (file-name-directory (get-closest-pathna
							      me)))))

(evil-leader/set-key
  "cc" 'my-compile-clean-func
  "cr" 'my-compile-func)
(define-key evil-normal-state-map (kbd"gn") 'next-error)
(define-key evil-normal-state-map (kbd"gp") 'previous-error)
;;(global-set-key [f7] 'my-compile-clean-func)
;;(global-set-key [C-f7] 'my-compile-func)
;;(global-set-key [S-f7] 'my-compile-package-func)
;;(global-set-key [g-n] 'next-error)
;;(global-set-key [g-p] 'previous-error)

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
