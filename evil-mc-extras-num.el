;;; evil-mc-extras-num.el --- Functions for incrementing/decrementing numbers at cursors

;;; Commentary:

;;; Code

(require 'evil-mc)
(require 'evil-numbers)

(defun evil-mc-change-num-at-each-cursor (change-cmd)
  "Run CHANGE-CMD that changes the number at cursor."
  (evil-mc-make-and-goto-first-cursor)
  (evil-mc-execute-for-all-cursors
   (lambda (cursor)
     (let ((index (evil-mc-get-cursor-property cursor :index)))
       (funcall change-cmd index)))))

(defun evil-mc-inc-num-at-each-cursor ()
  "Increment the number at each active cursor by the index amount."
  (interactive)
  (evil-mc-change-num-at-each-cursor 'evil-numbers/inc-at-pt))

(defun evil-mc-dec-num-at-each-cursor ()
  "Decrement the number at each active cursor by the index amount."
  (interactive)
  (evil-mc-change-num-at-each-cursor 'evil-numbers/dec-at-pt))

(provide 'evil-mc-extras-num)

;;; evil-mc-extras-num.el ends here
