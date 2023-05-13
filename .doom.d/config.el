;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "placeholder"
      user-mail-address "invalid@example.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

(set-fontset-font "fontset-default" nil (font-spec :size 14 :name "Meterial Icons"))

(setq doom-font (font-spec :family "Liberation Mono" :size 20)
     doom-variable-pitch-font (font-spec :family "Liberation Mono" :size 20)
     doom-big-font (font-spec :family "Liberation Mono" :size 26))

;(setq doom-font "Liberation Mono:pixelsize=17")

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.15))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.05))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)



(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)
(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center +doom-dashboard--width "The UwU Editor")))

(defun my-weebery-is-always-greater ()
  (let* ((banner '("⣿⣿⣿⣿⣿⣿⡿⠋⠁⠀⠀⠀⢀⣾⡿⠋⠉⠁⢠⣿⠏⢁⣿⣿⣿⠏⠉⢸⣿⡏⠉⢻⣿⣿⡇⠈⠙⢿⣿⣿⣿⣷⡆⠀⠀⢇⠢⣈⡒⡤"
"⣿⣿⣿⣿⣿⣏⣴⡇⠀⠀⠀⢠⡿⠋⠀⠀⠀⣰⣿⠋⠀⣼⣿⣿⠏⠀⠀⡾⣿⠁⠀⠀⣿⣿⣷⠀⠀⠀⠹⣿⣿⣿⣿⣄⢀⣿⣷⣿⣶⣶"
"⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⢠⡟⠁⠀⠀⠀⢰⣿⠇⠀⢰⣿⣿⡷⠀⣀⣜⣁⣻⣀⣀⣀⣸⢻⣿⡇⠀⠀⠀⠘⣿⣿⣷⠹⣿⣿⣿⣿⣿⣿"
"⣿⣿⣿⣿⣿⣿⠃⠀⠀⣠⣿⠀⠀⠀⠀⢠⣿⡏⠀⢀⣿⣿⡿⠛⣩⣿⠿⠛⢻⡏⠉⠉⢹⠉⢿⣿⡀⠀⠀⠀⠹⣿⣿⡆⠙⣿⣿⣿⣿⣿"
"⣿⣿⣿⣿⣿⡏⠀⠀⣰⣿⡟⠀⠀⠀⢀⣾⣿⠀⠀⣸⣿⡿⢥⣶⠝⠁⠀⠀⠀⡇⠀⠀⡜⠰⡀⢻⡇⠀⠀⠀⠀⢿⣿⣿⠀⠸⣿⣿⣿⡿"
"⣿⣿⢿⣿⣿⡃⠀⣼⣿⣿⡇⣀⣀⣤⣾⣿⡇⠀⠰⣼⡟⣠⠎⠁⠀⢀⣠⠔⠁⢹⣀⣠⣧⣶⣦⣤⣷⣤⣤⣠⣤⠼⣿⣿⡆⠀⢹⣿⣿⣿"
"⣿⣿⣿⣿⣿⠀⣼⣿⣿⣿⣏⣁⣼⣿⣿⣿⠀⢠⣾⣟⡔⠁⠀⠀⠀⢸⠁⠀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⣿⣿⣇⠀⠀⣿⣿⣿"
"⣿⣿⣿⣿⣿⣸⣿⣿⣿⣿⣟⣹⣿⣿⣿⡿⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⢰⣾⢟⣻⡿⠛⢻⢋⣻⣏⣱⠞⠙⣄⡀⠀⣿⡽⣿⠀⠀⢸⣿⣿"
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠉⢘⡅⠚⠋⠉⠁⠀⠀⠀⠀⣔⣾⢏⢦⢄⣿⣧⣿⡆⠀⠈⣿⣿"
"⣿⣿⣿⣿⣿⡿⢸⣿⣿⣿⡿⢻⣿⣿⡿⠋⠀⠀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠟⠉⠀⢂⢻⣿⣿⣿⡇⠀⠀⢽⣿"
"⣿⣿⣿⣿⣿⢃⣿⣿⣿⣿⣷⣿⣿⣿⣿⡷⠀⠀⡸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠉⠀⢀⣠⣾⣟⡖⢻⣿⣿⠃⠀⠀⣿⣿"
"⣿⣿⣿⣿⣟⣼⣿⣿⣿⣿⣿⣿⠟⣻⠿⠓⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠾⠿⠛⠉⠁⢰⢸⣿⡿⠀⠀⠀⣿⣿"
"⣿⣿⣿⣿⣿⣿⣿⠋⠰⢟⣿⠌⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠇⠀⠀⢠⡇⣿"
"⣿⣿⣿⣿⣿⣿⣏⠓⠓⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⠿⠿⢾⣿⡟⠀⠀⠀⣼⠃⣿"
"⣿⣿⣿⣿⣿⣿⣿⣷⢦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠤⠤⠤⠤⠤⠄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡿⠀⠀⠀⣰⠏⢰⣿"
"⣿⣿⣿⣿⣿⣿⣿⣿⡀⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⣠⢚⣡⣴⣾⣿⣿⣿⣿⡿⠿⢿⠀⠀⠀⠀⠀⠀⠀⠀⣼⡿⠁⠀⠀⣰⠏⣠⣿⣿"
"⣿⣿⣿⣿⣿⣿⣿⣿⣧⣤⣴⡾⠋⠀⠀⠀⠀⠀⠀⠀⣃⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⡸⠀⠀⠀⠀⠀⠀⠀⣼⣿⣃⠤⠚⠚⠉⠉⠉⠙⠛"
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠉⠀⢀⡄⠀⠀⠀⠀⠀⠀⠙⢽⣿⠿⠋⠉⠁⠀⢠⡆⢰⠃⠀⠀⠀⠀⠀⠀⣼⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣴⡿⠁⠀⠀⠀⠀⠀⠀⠀⠈⢯⠀⠀⠀⠀⢀⡞⢠⠋⠀⠀⠀⠀⠀⢀⣾⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⣿⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡄⠀⠀⠀⣸⢠⠃⠀⠀⠀⠀⠀⢠⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⣿⡆⢠⠉⢿⣿⣿⡟⣿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠳⡀⠀⠀⡇⠇⠀⠀⠀⠀⠀⣠⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⣿⣿⣼⠀⠈⢿⣿⡇⢹⣿⣿⣿⣿⣿⣿⣿⡗⠤⣀⠀⠀⠀⠀⠀⠑⢄⣀⡞⠀⠀⠀⠀⢀⣴⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⣿⣿⣿⣷⠀⠀⠹⢇⠀⢻⣿⣿⣿⣿⣿⣿⣧⠀⠈⠻⣷⣦⣤⣀⡀⠀⠉⠀⠀⠀⣀⡴⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⣿⣿⣿⠟⠀⠀⠀⠈⠳⣄⢻⣿⣿⣿⣿⣿⣿⣆⠀⠀⠈⠻⢿⣿⣿⣿⣷⣶⣴⣾⣿⣿⣿⣿⡿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⣿⣿⣿⣄⠀⠀⠀⠀⠀⠈⠳⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠉⡿⢿⣿⣿⣿⣿⣿⣿⣿⡿⢱⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'my-weebery-is-always-greater)

(setq ess-r--no-company-meta t)

(set-frame-parameter nil 'alpha-background 85) ; For current frame
(add-to-list 'default-frame-alist '(alpha-background . 85)) ; For all new frames henceforth

(org-babel-do-load-languages
 'org-babel-load-languages
 '((mermaid . t)
   (scheme . t)
   (emacs-lisp . t)
   (julia . t)
   (python . t)
   (jupyter . t)))

;; accept completion from copilot and fallback to company
;;(defun my-tab ()
  ;;(interactive)
  ;;((company-indent-or-complete-common nil)))

;; asm stuff
(use-package! nasm-mode
  :mode "\\.[n]*\\(asm\\|s\\)\\'")

;; Get Haxor VM from https://github.com/krzysztof-magosa/haxor
(use-package! haxor-mode
  :mode "\\.hax\\'")

(use-package! mips-mode
  :mode "\\.mips\\'")

(use-package! riscv-mode
  :mode "\\.riscv\\'")

(use-package x86-lookup
  :ensure t
  :config
  (setq  x86-lookup-pdf "~/.config/doom/asm-ref.pdf"))

;;(use-package flycheck-posframe)

(use-package! mermaid-mode)
(setq mermaid-mode-map
  (let ((map mermaid-mode-map))
    (define-key map (kbd "C-c C-c") nil)
    (define-key map (kbd "C-c C-f") nil)
    (define-key map (kbd "C-c C-b") nil)
    (define-key map (kbd "C-c C-r") nil)
    (define-key map (kbd "C-c C-o") nil)
    (define-key map (kbd "C-c C-d") nil)
    (define-key map (kbd "C-c C-d c") 'mermaid-compile)
    (define-key map (kbd "C-c C-d c") 'mermaid-compile)
    (define-key map (kbd "C-c C-d f") 'mermaid-compile-file)
    (define-key map (kbd "C-c C-d b") 'mermaid-compile-buffer)
    (define-key map (kbd "C-c C-d r") 'mermaid-compile-region)
    (define-key map (kbd "C-c C-d o") 'mermaid-open-browser)
    (define-key map (kbd "C-c C-d d") 'mermaid-open-doc)
    map))
 (setq ob-mermaid-cli-path "/usr/bin/mmdc")

(defvar native-comp-deferred-compilation-deny-list nil) ;; fix compilation error

(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

;; to debug with DAP-MODE
;;(setq dap-auto-configure-mode t)
;;(require 'dap-cpptools)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
