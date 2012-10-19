(defvar tt-mode nil)

(defvar tt-mode-map (make-keymap)
  "Keymap for `tt-mode'.")

(defvar tt-tag-open "[% "
  "open tag of Template::Toolkit template")

(defvar tt-tag-close " %]"
  "close tag of Template::Toolkit template")

(defun tt-insert-tag ()
  "insert tag for Template::Toolkit template"
  (interactive)
  (insert tt-tag-open)
  (save-excursion (insert tt-tag-close)))

(define-minor-mode tt-mode
  "minor mode for Template::Toolkit template"
  :lighter " TT" :keymap tt-mode-map
  (define-key tt-mode-map (kbd "C-c t") 'tt-insert-tag))

(provide 'tt)
