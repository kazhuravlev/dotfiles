;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Kirill Zhuravlev"
      user-mail-address "kazhuravlev@fastmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;     doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

(setq doom-font (font-spec :family "Source Code Pro" :size 13 :weight 'light)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))


;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'my-doom-one)
;; Cool themes:
;; - doom-tommororw-night
;; - my-doom-one
;; - doom-1337

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/p/org/")

(setq projectile-project-search-path '("~/p/personal/" ("~/p/" . 1)))

(setq shell-file-name (executable-find "bash"))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.




(global-set-key (kbd "C-}") 'theme-looper-enable-next-theme)
(global-set-key (kbd "C-{") 'theme-looper-enable-previous-theme)


;; gofmt
(map! :leader
      :desc "Go: Format"
      "c f" #'gofmt)

;; Fill go structure
(map! :leader
      :desc "Go: Fill structure fields"
      "c F" #'go-fill-struct)

;; Go to error
;; (map! :after go
;;       ;; :map go-mode-map
;;       :prefix "] e"
;;       "f" #'flycheck-next-error)

;; (global-set-key (kbd "] e") 'flycheck-next-error)
;; (global-set-key (kbd "[ e") 'flycheck-previous-error)


;; Toggle (it is disabled by default) Treemacs follow mode.
(after! treemacs
  (treemacs-follow-mode)
  (treemacs-git-mode 'deferred))

;; (map! :leader
;;       (:prefix-map ("c" . "applications")
;;        (:prefix ("j" . "journal")
;;         :desc "New journal entry" "j" #'org-journal-new-entry
;;         :desc "Search journal entry" "s" #'org-journal-search)))


(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)


;; NOTE: Move line up/down
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(map! :leader
      :desc "Move line up"
      "c <up>" #'move-line-up)
(map! :leader
      :desc "Move line down"
      "c <down>" #'move-line-down)

;; Go to line
(map! :leader
      :desc "Go to line number"
      "c g" #'goto-line)

;; Treemacs: edit workspaces
(map! :leader
      :desc "Treemacs: edit workspaces"
      "p E" #'treemacs-edit-workspaces)

;; (map! :leader
;;       :desc "Paste from history"
;;       "a P" #'my-yank-from-kill-ring)

;; Web-mode configuration (especially for golang templates)
(add-to-list 'auto-mode-alist '("\\.gotmpl\\'" . web-mode))

;; Cargo.lock should be in toml mode
(add-to-list 'auto-mode-alist '("Cargo.lock\\'" . conf-toml-mode))

;; (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))

;; File type to mode association
(add-to-list 'auto-mode-alist '("\\envfile\\'" . line-number-mode))

(custom-set-variables
 '(go-impl-aliases-alist '(("hh" . "http.Handler")
                           ("irw" . "io.ReadWriter"))))


(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))


;; Cut string
(defun cut-region (beg end)
  "Copies the text to the kill buffer and deletes the selected region."
  (interactive "r")
  (copy-region-as-kill beg end)
  (delete-region beg end))

(map! "s-x" #'cut-region)

;; Treemacs ignore some files
(with-eval-after-load 'treemacs
  (defun treemacs-ignore-pycache (file _)
    (string= file "__pycache__"))
  (push #'treemacs-ignore-pycache treemacs-ignored-file-predicates))


(define-key evil-normal-state-map
            (kbd "g / r")
            (lambda () (evil-paste-after)))

(evil-define-command my/paste-after-newline (count &optional register)
  "Paste over Visual selection."
  :suppress-operator t
  (interactive "*P<x>")
  (setq count (prefix-numeric-value count))
  (setq this-command 'my/paste-after-newline)
  (+default/newline-below)
  (evil-paste-before count register)
  )

(global-set-key (kbd "s-p") #'my/paste-after-newline)

;; Scroll view-port
(defun my/scroll-down ()
  (interactive)
  (scroll-up-line 1))

(defun my/scroll-up ()
  (interactive)
  (scroll-down-line 1))

(global-set-key [(control down)] 'my/scroll-down)
(global-set-key [(control up)]   'my/scroll-up)


;; Repeat last terminal command
(defun my/vterm-repeat-last-command ()
  "Repeat the last command in terminal."
  (interactive)
  (vterm-send-up)
  (vterm-send-return))

(map! :leader
      :desc "Terminal: repeat last command"
      "o R" #'my/vterm-repeat-last-command)


;; Fix rare error "too many files"
(defun my/fix-too-many-open-files ()
  "Remove all existing file notification watches from Emacs."
  (interactive)
  (maphash
   (lambda (key _value)
     (file-notify-rm-watch key))
   file-notify-descriptors))

(add-hook 'window-setup-hook 'toggle-frame-maximized t)
;; (add-to-list 'initial-frame-alist '(fullscreen . maximize-window))


;; Ignore homebrew dir
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "/opt/homebrew")
  ;; or
  ;; (add-to-list 'lsp-file-watch-ignored-files "[/\\\\]\\.my-files\\'")
  )

;; Increate the files count to watching with LSP
(setq lsp-file-watch-threshold 2048)

(customize-set-variable 'doom-themes-treemacs-theme "doom-colors")


;; Ignore dirs
(after! projectile
  (nconc projectile-globally-ignored-directories
         '("^vendor$")))

(nconc grep-find-ignored-directories
       '("vendor"))


(cl-defun +ivy-file-search (&key query in all-files (recursive t) prompt args)
  "Conduct a file search using ripgrep.

:query STRING
  Determines the initial input to search for.
:in PATH
  Sets what directory to base the search out of. Defaults to the current
  project's root.
:recursive BOOL
  Whether or not to search files recursively from the base directory."
  (declare (indent defun))
  (unless (executable-find "rg")
    (user-error "Couldn't find ripgrep in your PATH"))
  (require 'counsel)
  (let* ((this-command 'counsel-rg)
         (project-root (or (doom-project-root) default-directory))
         (directory (or in project-root))
         (args (concat (if all-files " -uu")
                       (unless recursive " --maxdepth 1")
                       ;; " --hidden -g!.git "
                       (mapconcat #'shell-quote-argument args " "))))
    (setq deactivate-mark t)
    (counsel-rg
     (or query
         (when (doom-region-active-p)
           (replace-regexp-in-string
            "[! |]" (lambda (substr)
                      (cond ((and (string= substr " ")
                                  (not (modulep! +fuzzy)))
                             "  ")
                            ((string= substr "|")
                             "\\\\\\\\|")
                            ((concat "\\\\" substr))))
            (rxt-quote-pcre (doom-thing-at-point-or-region)))))
     directory args
     (or prompt
         (format "Search project [%s]: "
                 (cond ((equal directory default-directory)
                        "./")
                       ((equal directory project-root)
                        (projectile-project-name))
                       ((file-relative-name directory project-root)))
                 (string-trim args))))))

;; (after! editorconfig
;;   (add-hook 'go-mode-hook (lambda () (setq tab-width 4))))


;; (after! editorconfig
;;   (setq tab-width 4))


;; This enable wrapper with brackets
(use-package! doom-parents)

