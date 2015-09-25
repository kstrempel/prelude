(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Install my packages
(prelude-install-packages)

(setq default-input-method "MacOSX")

(setq mac-command-modifier 'meta
      mac-option-modifier nil
      ns-function-modifier 'super)

;; Initialize python-mode

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)

(exec-path-from-shell-initialize)

(add-hook 'python-mode-hook
          '(lambda () (local-set-key (kbd "M-.") #'anaconda-mode-goto) (setq python-shell-interpreter "/usr/local/bin/python3")))

(require 'highlight-symbol)
(setq highlight-symbol-idle-delay 0.3)
(add-hook 'python-mode-hook 'highlight-symbol-mode)
(add-hook 'python-mode-hook 'highlight-symbol-nav-mode)

;; key for ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h") 'helm-projectile)
(global-set-key (kbd "C-x C-r") 'helm-recentf)


(require 'framemove)
(windmove-default-keybindings)
(setq framemove-hook-into-windmove t)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(exec-path-from-shell-copy-env "PYTHONPATH")

(require 'god-mode)
(global-set-key (kbd "<escape>") 'god-mode-all)
(setq god-exempt-major-modes nil)
(setq god-exempt-predicates nil)

(defun my-update-cursor ()
  (let ((limited-colors-p (> 257 (length (defined-colors)))))
    (cond (god-local-mode (progn
                            (set-face-background 'mode-line (if limited-colors-p "white" "#e9e2cb"))
                            (set-face-background 'mode-line-inactive (if limited-colors-p "white" "#e9e2cb"))))
          (t (progn
               (set-face-background 'mode-line (if limited-colors-p "black" "#0a2832"))
               (set-face-background 'mode-line-inactive (if limited-colors-p "black" "#0a2832")))))))

(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)
;;; 00-config.el ends here
