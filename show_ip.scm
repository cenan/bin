#! /bin/sh
#|
exec csi -s "$0" "$@"
|#

(use medea http-client)

(define resp
  (read-json
    (with-input-from-request
      "http://codebound.net/status/200" #f read-string)))

(display (cdr (assv 'ip resp)))
(newline)
