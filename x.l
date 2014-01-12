(load "s2.l")
(pilog '((syntax @ @X)) (if (= (car (chop @X)) "(") (prinl @X)))
(bye)

