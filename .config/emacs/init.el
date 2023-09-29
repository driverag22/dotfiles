;;Initialize package sources
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-tokyo-night))
 '(custom-safe-themes
   '("821c37a78c8ddf7d0e70f0a7ca44d96255da54e613aa82ff861fe5942d3f1efc" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "b6269b0356ed8d9ed55b0dcea10b4e13227b89fd2af4452eee19ac88297b0f99" "c8b83e7692e77f3e2e46c08177b673da6e41b307805cd1982da9e2ea2e90e6d7" "462418b9b55cb41d878f2f30b6f533a56f644bc5576072a134db6ab2a5dc2545" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "24168c7e083ca0bbc87c68d3139ef39f072488703dcdd82343b8cab71c0f62a7" "4dcf06273c9f5f0e01cea95e5f71c3b6ee506f192d75ffda639d737964e2e14e" default))
 '(org-agenda-files
   '("/home/diego/org/orgRoam/20230816125732-masters.org" "/home/diego/org/orgRoam/20230821153251-emacssetupp.org"))
 '(org-agenda-sorting-strategy
   '((agenda habit-down time-up priority-down category-keep)
	 (todo timestamp-up priority-down category-keep)
	 (tags timestamp-up priority-down category-keep)
	 (search category-keep)))
 '(org-directory "~/org")
 '(org-image-actual-width 700)
 '(package-selected-packages
   '(org-superstar tron-legacy-theme affe calfw-org calfw org-roam-ui visual-fill vulpea golden-ratio evil-nerd-commenter projectile general which-key org-roam monokai-pro-theme evil use-package haki-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cfw:face-day-title ((t :background "#grey10")))
 '(cfw:face-default-day ((t :foreground "#ffffff" :background "#grey10")))
 '(cfw:face-grid ((t :foreground "#5E81AB")))
 '(cfw:face-header ((t (:foreground "#ffffff" :weight bold))))
 '(cfw:face-holiday ((t :foreground "#ba3c53" :background "grey10" :weight bold)))
 '(cfw:face-saturday ((t :foreground "#5E81AB" :weight bold)))
 '(cfw:face-select ((t :background "#5E81AB")))
 '(cfw:face-sunday ((t :foreground "#5E81AB" :weight bold)))
 '(cfw:face-title ((t (:foreground "#5E81AB" :weight bold :height 2.0 :inherit variable-pitch))))
 '(cfw:face-today ((t :background: "grey10" :weight bold)))
 '(cfw:face-today-title ((t :foreground "#ff001e" :background "#grey10" :weight bold)))
 '(cfw:face-toolbar ((t :background "#grey10"))))

(org-babel-load-file (expand-file-name "~/.config/emacs/myinit.org"))
