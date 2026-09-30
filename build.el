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
      org-html-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"ant-seminar.css\" />")

(org-publish-all t)
(message "Build of ANT seminar site complete!")
