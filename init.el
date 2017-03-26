;; Include the official repo and two unofficial, community-maintained repos
(package-initialize)
(setq package-archives
     '(("gnu" . "http://elpa.gnu.org/packages/")
       ("marmalade" . "http://marmalade-repo.org/packages/")
       ("melpa" . "http://melpa.milkbox.net/packages/")))

;; get rid of the splash screen on startup
(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; display the line and column number
(setq line-number-mode t)
(setq column-number-mode t)

;; highlight selection
(transient-mark-mode t)

;; no tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; turn on org-mode and auto-fill mode for default
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; cleanup whitespace before saving
;;(add-hook 'before-save-hook 'whitespace-cleanup)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("90d329edc17c6f4e43dbc67709067ccd6c0a3caa355f305de2041755986548f2" "91faf348ce7c8aa9ec8e2b3885394263da98ace3defb23f07e0ba0a76d427d46" default)))
 '(package-selected-packages (quote (yasnippet helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Use the atom one dark theme
;;(load-theme 'atom-one-dark)

;; enable ido mode for better buffer matching
(ido-mode t)
(setq ido-enable-flex-matching t)

;; rebind keys the way that I like them
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-o" 'other-window)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-j" 'newline-and-indent)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; create a code-mode hook, which displays the line number on the side
(add-hook 'my-code-mode-hook
          (lambda () (linum-mode 1)))

;; format the line number to four spaces
(setq linum-format "%5d")

;; activate my code hook for python
(setq auto-mode-alist (cons '(".*\\.asm$" . c-mode) auto-mode-alist))

(add-hook 'python-mode-hook
          (lambda () (run-hooks 'my-code-mode-hook)))
(add-hook 'c-mode-hook
          (lambda () (run-hooks 'my-code-mode-hook)))


;; helm -- just trying it out for now
(require 'helm-config)
(helm-mode 1)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x f") 'ido-find-file)
(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)

(global-set-key (kbd "C-x g") 'magit-status)
;;(global-set-key (kbd "C-x e") 'eshell)

;;(require 'powerline)
;;(powerline-default-theme)

(require 'yasnippet)
(yas-global-mode 1)


(setq-default c-basic-offset 4)
(c-set-offset 'substatement-open 0)
(setq c++-tab-always-indent t)
(setq c-basic-offset 4)
(setq c-indent-level 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
(setq tab-width 4)
(setq indent-tabs-mode t)

;;(require 'xcscope)
;;(cscope-setup)

(setq load-path (cons "/users/adpatwar/.emacs.d" load-path))
(autoload 'gid "idutils" nil t)
(global-set-key "\M-\r" 'gid)

(which-function-mode 1)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-l" 'goto-line)
