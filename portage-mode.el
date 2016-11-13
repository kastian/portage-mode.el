;;; portage-mode.el --- Major mode for editing Portage-related files

;; Copyright (C) 2016 Konstantin Shakhnov.

;; Author: Konstantin Shakhnov <kastian@mail.ru>
;; Maintainer: Konstantin Shakhnov <kastian@mail.ru>
;; Created: 9 Nov 2016
;; Keywords: gentoo, portage
;; Homepage: https://github.com/kastian/portage-mode.el

;; This file is not part of GNU Emacs.

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Nano gentoo.nanorc syntax higlight settings rewritten for emacs

;;; Code:

(defvar portage-font-lock-keywords
  '(;; Package name.
    ("^.+$" 0 '((t (:foreground "green"))) t)
    ;; Enabled use flag 'openrc'
    ("[[:blank:]]+\\+?[a-zA-Z0-9_-]+" 0 '((t (:foreground "brightred"))) t)
    ;; Disabled use flag '-systemd'
    ("[[:blank:]]+-[a-zA-Z0-9_-]+" 0 '((t (:foreground "brightblue"))) t)
    ;; Package version '-3.3.9-r2'
    ("-[[:digit:]].*?\\([[:blank:]]\\|$\\)" 0 '((t (:foreground "magenta"))) t)
    ;; Package slot number ':2'
    (":[^[:blank:]]+?\\([[:blank:]]\\|$\\)" 0 '((t (:foreground "magenta"))) t)
    ;; Package architecture '~x86'
    ("\\([~-]\\|[[:blank:]]+\\)\\<\\(alpha\\|amd64\\|arm\\|hppa\\|ia64\\|mips\\|ppc\\|ppc64\\|s390\\|sh\\|sparc\\(-fbsd\\)?\\|x86\\(-fbsd\\)?\\)\\>" 0 '((t (:foreground "white"))) t)
    ;; Package architecture '~*'
    ("[[:blank:]][*~-]?\\*" 0 '((t (:foreground "white"))) t)
    ;; Package category 'app-emacs'
    ("^[[:blank:]]*.*/" 0 '((t (:foreground "cyan"))) t)
    ;; Masking regulators
    ("^[[:blank:]]*\\(~\\|<=\\|=<\\|>=\\|=>\\|=\\|<\\|>\\)" 0 '((t (:foreground "brightmagenta"))) t)
    ;; Comment
    ("#.*$" 0 '((t (:foreground "yellow"))) t)
    ;; Trailing whitespace are bad !
    ("[[:blank:]]+$" 0 '((t (:background "green"))) t)))

;;;###autoload
(define-derived-mode portage-mode fundamental-mode
  "Portage"
  "Major mode for editing portage-related files."
  (setq font-lock-defaults
	'(portage-font-lock-keywords)))

;;;###autoload
(add-to-list 'auto-mode-alist
	     '("/etc/portage/package\\.\\(accept_keywords\\|env\\|keywords\\|mask\\|unmask\\|use\\)\\(/.*$\\)?" . portage-mode))
;;;###autoload
(add-to-list 'auto-mode-alist
	     '("/var/lib/portage/world" . portage-mode))


(provide 'portage-mode)

;;; portage-mode.el ends here
