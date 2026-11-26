;; -*- lexical-binding: t; -*-

(require 'ox-publish)

(setq org-publish-project-alist
      (list
       (list "ant-seminar"
	     :base-directory "./org"
	     :publishing-function 'org-html-publish-to-html
	     :publishing-directory "./docs"
	     :with-author nil
	     :with-creator nil
	     :with-toc nil
	     :section-numbers nil
	     :time-stamp-file nil)))

(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"ant-seminar.css\" />")

; This snippet adds the postamble. Style it in the css in the "postamble" block.
(setq org-html-postamble t
      org-html-postamble-format
      '(("en" "<p>Last updated %C</p>"))
      org-html-metada-timestamp-format "%B %-d, %Y")

;; This snippet adds a [top] link to every abstract title. Abstract titles are
;; the only <h4> headings on the site (i.e. ***** headlines in org), so this
;; touches nothing else. 
(defun ant-seminar-top-links (text backend _info)
  (if (org-export-derived-backend-p backend 'html)
      (replace-regexp-in-string
       "</h4>" " <a class=\"to-top\" href=\"#content\">[top]</a></h4>" text t t)
    text))
(add-to-list 'org-export-filter-final-output-functions #'ant-seminar-top-links)

(org-publish-all t)
(message "Build of ANT seminar site complete!")
