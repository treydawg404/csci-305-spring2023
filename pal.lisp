#|Function written by Trey Grossman|#

(defun palindromep (string)
	(cond
		((null string) t)
		((atom string) t)
		((equal  (list(first string)) (last string))                   
		
			(palindromep (rest(reverse(rest string))))       
		
		)
	)
)

(write(palindromep '(a b b a)))
(terpri)
(write(palindromep '(a b c b a)))
(terpri)
(write(palindromep '(a b c)))
(terpri)
(write(palindromep '(a (d e) b (d e) a)))
(terpri)
(write(palindromep '(a (d e) b (e d) a)))
