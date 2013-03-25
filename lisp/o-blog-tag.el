;;; o-blog-tag.el --- 

;; Copyright © 2013 Sébastien Gross <seb•ɑƬ•chezwam•ɖɵʈ•org>

;; Author: Sébastien Gross <seb•ɑƬ•chezwam•ɖɵʈ•org>
;; Keywords: emacs, 
;; Created: 2013-02-09
;; Last changed: 2013-03-25 12:47:38
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/

;; This file is NOT part of GNU Emacs.

;;; Commentary:
;; 


;;; Code:


(defclass ob:category ()
  ((display :initarg :display
	    :type string
	    :documentation "Displayed tag name string")
   (safe :initarg :safe
	 :type string
	 :documentation "HTML safe tag form"))
  "")

(defmethod ob:category:init ((self ob:category))
  ""
  (let ((name (ob:get-name self)))
    (set-slot-value self 'display name)
    (set-slot-value self 'safe (ob:sanitize-string name)))
  self)



(defclass ob:tag (ob:category)
  ((count :initarg :count
	  :type integer
	  :documentation "Tag occurance in all articles")
   (size :initarg :size
	 :type float
	 :documentation "Tag html size"))
  "")


(defmethod ob:get-name ((self ob:category))
  "Return class name"
  (if (boundp 'object-name)
      (aref self object-name)
    (eieio-object-name-string self)))



(provide 'o-blog-tag)

;; o-blog-tag.el ends here
