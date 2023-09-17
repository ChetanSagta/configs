(setq inhibit-startup-screen t)
(setq default-frame-alist '((font . "Iosevka Nerd Font Mono 14")))
(setq create-lockfiles nil)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(global-set-key (kbd "<f3>") 'compile)
(global-set-key (kbd "<f4>") 'recompile)
(setq make-backup-files nil)
(setq delete-auto-save-files t)
(setq auto-save-visited-mode t)

(setq backup-directory-alist '(("." . "~/.saves"))
;  backup-by-copying t    ; Don't delink hardlinks
;  version-control t      ; Use version numbers on backups
;  delete-old-versions t  ; Automatically delete excess backups
;  kept-new-versions 20   ; how many of the newest versions to keep
;  kept-old-versions 5    ; and how many of the old
)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(setq package-selected-packages '(cmake-project impatient-mode projectile helm which-key magit all-the-icons eglot eglot-java yasnippet evil evil-collection evil-leader undo-fu doom-modeline doom-themes treemacs-evil dap-mode company company-quickhelp flycheck tree-sitter tree-sitter-langs rust-mode ansi-color multiple-cursors))

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
(require 'rust-mode)
(add-hook 'after-init-hook 'global-company-mode)
(company-quickhelp-mode)
(setq company-quickhelp-delay 0.5)
(setq gdb-many-windows t)
(yas-global-mode 1)

(setq eldoc-echo-area-prefer-doc-buffer t)
(setq eldoc-print-current-symbol-info nil)
(setq eglot-ignored-server-capabilities (list :hoverProvider))

(defun maybe-cmake-project-mode ()
  (if (or (file-exists-p "CMakeLists.txt")
          (file-exists-p (expand-file-name "CMakeLists.txt" (car (project-roots (project-current))))))
      (cmake-project-mode)))

(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'java-mode-hook 'eglot-java-mode)
(add-hook 'js-mode-hook 'eglot-java-mode)
(add-hook 'html-mode-hook 'eglot-java-mode)
(add-hook 'css-mode-hook 'eglot-java-mode)
(add-hook 'python-mode-hook 'eglot-java-mode)
(add-hook 'c-mode-hook 'maybe-cmake-project-mode)
(add-hook 'c++-mode-hook 'maybe-cmake-project-mode)
(add-hook 'js-mode-hook 'eglot-js-mode)

(add-hook 'java-mode-hook (lambda () (setq c-basic-offset 4 tab-width 4 indent-tabs-mode t)))


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
(require 'cmake-project)
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

(require 'magit)

(define-key evil-motion-state-map (kbd"gn") 'next-error)
(define-key evil-motion-state-map (kbd"gp") 'previous-error)

(defun my/ansi-colorize-buffer ()
  (let ((buffer-read-only nil))
    (ansi-color-apply-on-region (point-min) (point-max))))

(add-hook 'compilation-filter-hook 'my/ansi-colorize-buffer)

;multiple cursers
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)

(defun maybe-cmake-project-mode ()
  (if (or (file-exists-p "CMakeLists.txt")
          (file-exists-p (expand-file-name "CMakeLists.txt" (car (project-roots (project-current))))))
      (cmake-project-mode)))

