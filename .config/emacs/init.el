;;Initialize package sources
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   '("77f281064ea1c8b14938866e21c4e51e4168e05db98863bd7430f1352cab294a"
	 "b40f11c174e7e475508f1e2c1cfca354d37212494c143a494f27239c7d71a294"
	 "18631300c9090ac9f588b07d0ef4b1d093143a31e8c8c29e9fc2a57db1cdf502"
	 "2cc1b50120c0d608cc5064eb187bcc22c50390eb091fddfa920bf2639112adb6"
	 "fc608d4c9f476ad1da7f07f7d19cc392ec0fb61f77f7236f2b6b42ae95801a62"
	 default))
 '(org-agenda-files
   '("/home/diego/org/orgRoam/opsystexamprep-20240113171733.org"
	 "/home/diego/org/orgRoam/examprepmathstats-20231029202039.org"
	 "/home/diego/org/orgRoam/ethhousing-20240313161623.org"
	 "tasks.org" "schedule.org"))
 '(org-agenda-sorting-strategy
   '((agenda habit-down time-up priority-down category-keep)
	 (todo timestamp-up priority-down category-keep)
	 (tags timestamp-up priority-down category-keep)
	 (search category-keep)))
 '(org-directory "~/org")
 '(org-image-actual-width 700)
 '(org-link-frame-setup
   '((vm . vm-visit-folder-other-frame)
	 (vm-imap . vm-visit-imap-folder-other-frame)
	 (gnus . org-gnus-no-new-news) (file . find-file)
	 (wl . wl-other-frame)))
 '(org-scheduled-past-days 0)
 '(package-selected-packages nil))
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
 '(cfw:face-toolbar ((t :background "#grey10")))
 '(org-agenda-time-grid ((t (:foreground "white")))))

(org-babel-load-file (expand-file-name "~/.config/emacs/myinit.org"))
