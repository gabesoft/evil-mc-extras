;;; evil-mc-extras-num.el --- Functions for incrementing/decrementing numbers at cursors

;;; Commentary:

;;; Code

(require 'evil-mc)
(require 'evil-numbers)

(defun evil-mc-change-num-at-each-cursor (change-cmd amount)
  "Run CHANGE-CMD that changes the number at cursor by index and AMOUNT."
  (evil-mc-make-and-goto-first-cursor)
  (evil-mc-execute-for-all-cursors
   (lambda (cursor)
     (let* ((index (evil-mc-get-cursor-property cursor :index))
            (value (+ index (or (and amount (prefix-numeric-value amount)) 0))))
       (funcall change-cmd value)))))

(defun evil-mc-inc-num-at-each-cursor (amount)
  "Increment the number at each active cursor by the cursor index
with the first cursor starting at AMOUNT."
  (interactive "P")
  (evil-mc-change-num-at-each-cursor 'evil-numbers/inc-at-pt amount))

(defun evil-mc-dec-num-at-each-cursor (amount)
  "Decrement the number at each active cursor by the cursor index
with the first cursor starting at AMOUNT."
  (interactive "P")
  (evil-mc-change-num-at-each-cursor 'evil-numbers/dec-at-pt amount))

(provide 'evil-mc-extras-num)

;;; evil-mc-extras-num.el ends here
