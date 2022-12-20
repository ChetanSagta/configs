(setq inhibit-startup-screen t)
(setq default-frame-alist '((font . "Source Code Pro 12")))
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(global-display-line-numbers-mode)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(setq package-selected-packages
   '(lsp-mode evil evil-collection evil-leader treemacs-evil shell-pop powerline-evil helm dap-mode company company-quickhelp flycheck lsp-ui tree-sitter tree-sitter-langs))

(package-install-selected-packages)
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(require 'evil)
(require 'evil-collection)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-mode 1)
(setq evil-collection-init t)

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
(require 'powerline)
(powerline-default-theme)

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
"b" 'buffers)

(define-key evil-normal-state-map (kbd"ff") 'find-file)
(define-key evil-normal-state-map (kbd"gcc") 'comment-line)

(require 'treemacs-evil)
(define-key evil-treemacs-state-map (kbd"SPC e") 'treemacs)
(define-key evil-treemacs-state-map (kbd"a") 'treemacs-create-file)
(define-key evil-treemacs-state-map (kbd"A") 'treemacs-create-dir)
(define-key evil-treemacs-state-map (kbd"d") 'treemacs-delete)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(require 'shell-pop)
(setq shell-pop-window-size 100)
(setq shell-pop-full-span t)
(setq shell-pop-window-position "bottom")
(setq shell-pop-autocd-to-working-dir t)
(setq shell-pop-restore-window-configuration t)
(setq shell-pop-cleanup-buffer-at-process-exit t)
;(define-key evil-normal-state-map (kbd"<leader>t") 'shell-pop)

(evil-leader/set-key "t" 'shell-pop)

(require 'tree-sitter)
(require 'tree-sitter-hl)
(require 'tree-sitter-langs)
(require 'tree-sitter-debug)
(require 'tree-sitter-query)

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
