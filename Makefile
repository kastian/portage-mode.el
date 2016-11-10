DIR=/usr/share/emacs/site-lisp/
PROGRAM=portage-mode.el

install:
	cp "${PROGRAM}" "${DIR}"

uninstall:
	rm "${DIR}/${PROGRAM}"
