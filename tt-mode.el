(defvar tt-mode nil)

(defvar tt-mode-map (make-keymap)
  "Keymap for `tt-mode'.")

;;; constants

(defvar tt-tag-open "[%"
  "open tag of Template::Toolkit template")

(defvar tt-tag-close "%]"
  "close tag of Template::Toolkit template")

(defvar tt-line-start ":"
  "line prefix of Template::Toolkit template")

;;; font-lock

(defvar tt-tag-regexp (rx (group
                           (eval tt-tag-open)
                           (*? anything)
                           (eval tt-tag-close))))

(defvar tt-line-regexp (rx (group
                            bol
                            (eval tt-line-start))))

(defvar tt-font-lock-keywords
  `((,tt-tag-regexp  . font-lock-variable-name-face)
    (,tt-line-regexp . font-lock-variable-name-face)))

;;; command

(defun tt-insert-tag ()
  "insert tag for Template::Toolkit template"
  (interactive)
  (insert (concat tt-tag-open " "))
  (save-excursion (insert (concat " " tt-tag-close))))

;;; mode

(define-minor-mode tt-mode
  "minor mode for Template::Toolkit template"
  :lighter " TT" :keymap tt-mode-map
  (define-key tt-mode-map (kbd "C-c t") 'tt-insert-tag)
  (font-lock-add-keywords nil tt-font-lock-keywords))

(provide 'tt)
