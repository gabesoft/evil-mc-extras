;;; evil-mc-extras.el --- Extra functionality for evil-mc

;; Copyright @ 2016 Gabriel Adomnicai <gabesoft@gmail.com>

;; Author: Gabriel Adomnicai <gabesoft@gmail.com>
;; Maintainer: Gabriel Adomnicai <gabesoft@gmail.com>
;; Version: 0.0.1
;; Keywords: evil editing multiple-cursors vim evil-multiple-cursors evil-mc evil-mc-extras
;; Homepage: https://github.com/gabesoft/evil-mc-extras
;;
;; Package-Requires: ((emacs "24.3") (evil "1.2.12") (cl-lib "0.5") (evil-mc "0.0.2") (evil-numbers "0.4"))
;; This file is NOT part of GNU Emacs.

;;; Commentary:

;; This library provides functions that build upon the core functionality from evil-mc
;;
;; Install:
;;
;; (require 'evil-mc-extras)
;;
;;
;; Usage:
;;
;; (evil-mc-extras-mode 1)        ; enable for a single buffer
;;
;; (global-evil-mc-extras-mode 1) ; enable for all buffers
;;
;;
;; See the README for more details

;;; Code:

(require 'evil)
(require 'evil-mc-extras-num)

(defvar evil-mc-extras-key-map
  (let ((map (make-sparse-keymap))
        (keys '(("gr+" . evil-mc-inc-num-at-each-cursor)
                ("gr-" . evil-mc-dec-num-at-each-cursor))))
    (dolist (key-data keys)
      (evil-define-key 'normal map (kbd (car key-data)) (cdr key-data))
      (evil-define-key 'visual map (kbd (car key-data)) (cdr key-data)))
    map))

;;;###autoload
(define-minor-mode evil-mc-extras-mode
  "Toggle evil multiple cursors extras in a single buffer."
  :group 'evil-mc-extras
  :init-value nil
  :keymap evil-mc-extras-key-map
  (evil-normalize-keymaps))

(put 'evil-mc-extras-mode 'permanent-local t)

(define-globalized-minor-mode global-evil-mc-extras-mode
  evil-mc-extras-mode evil-mc-extras-initialize)

;;;###autoload
(defun evil-mc-extras-initialize ()
  "Enable `evil-mc-extras-mode' in the current buffer."
  (evil-mc-extras-mode 1))

;;;###autoload
(defun turn-on-evil-mc-extras-mode ()
  "Turn on `evil-mc-extras-mode' in the current buffer."
  (interactive)
  (evil-mc-extras-mode 1))

;;;###autoload
(defun turn-off-evil-mc-extras-mode ()
  "Turn off `evil-mc-extras-mode' in the current buffer."
  (interactive)
  (evil-mc-extras-mode -1))

(provide 'evil-mc-extras)

;;; evil-mc-extras.el ends here
