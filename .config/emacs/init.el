;;Initialize package sources
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-tokyo-night))
 '(custom-safe-themes
   '("462418b9b55cb41d878f2f30b6f533a56f644bc5576072a134db6ab2a5dc2545" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "24168c7e083ca0bbc87c68d3139ef39f072488703dcdd82343b8cab71c0f62a7" "4dcf06273c9f5f0e01cea95e5f71c3b6ee506f192d75ffda639d737964e2e14e" default))
 '(org-agenda-files
   '("/home/diego/org/orgRoam/20230816125732-masters.org" "/home/diego/org/orgRoam/20230821153251-emacssetupp.org"))
 '(org-directory "~/org")
 '(package-selected-packages
   '(calfw-org calfw vulpea golden-ratio evil-nerd-commenter projectile general which-key org-roam monokai-pro-theme evil use-package haki-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(org-babel-load-file (expand-file-name "~/.config/emacs/myinit.org"))
