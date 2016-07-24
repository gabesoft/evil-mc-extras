(require 'f)

(defvar evil-mc-extras-support-path
  (f-dirname load-file-name))

(defvar evil-mc-extras-features-path
  (f-parent evil-mc-extras-support-path))

(defvar evil-mc-extras-root-path
  (f-parent evil-mc-extras-features-path))

(add-to-list 'load-path evil-mc-extras-root-path)

(require 'cl)
(require 'evil)
(require 'evil-mc)
(require 'evil-surround)
(require 'evil-numbers)
(require 'evil-mc-extras)
(require 'espuds)
(require 'ert)

(Setup
 ;; Before anything has run
 )

(Before
 (switch-to-buffer (get-buffer-create "*evil-mc-extras*"))
 (evil-surround-mode 1)
 (evil-mode 1)
 (evil-mc-mode 1)
 (evil-mc-extras-mode 1)
 (erase-buffer)
 (transient-mark-mode 1)
 (deactivate-mark))

(After
 (evil-mc-extras-mode -1)
 )

(Teardown
 ;; After when everything has been run
 )
