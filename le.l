(setq l0 '(prog

(load "s2.l")

'(put the whole program into variable l0, so we can access it later and edit it as l1 in the ide)

'(the data structures of this program:
	node - 
		an ast node..its unclear what it will mean here. the program should be able to 	render its own source code in a semi-lemonic way, and be fully able to manipulate its own native nodes..which might be the same, or not...(list x object?)

	bit - 
		newline, child(name), "text", space; these say how a node should appear
	bits - 
		a sequence of pieces
	hcml - hypercode:\) the resulting tree structure that the renderer deals with
)



(de text4node (N)
	(filter '((X)(=(car X) 't)) (hcml4node N))
)

(de hcml4node (N)
	(hcml4bits N (bits4node N))
)

(de bits4node (N)
	(cond 
		((and 
			(lst? N) 
			(==  (car N) NIL))
		'((t "nil")))
		
		((and 
			(lst? N) 
			(get (function_name N) 'template))
		@)
		
		(T 
		'((t "fuck")))
	)
)
'(debug 'bits4node)

(de hcml4bits (N B)
	(append '((node N)) (mapcar '((B)(hcml4bit N B))) '((/node)))
)

(de hcml4bit (N B)
	(let (V (cdr B))
		(case (car B)
			(t B)
			(ch (hcml4node (get_child N V)))
			(T B)
		)
	)
)

(de get_child (N I)
	(nth N (+ I 1))
)

(de to_lemon (N) 
	(if (lst? N)
		(mapcar 'to_lemon N)
		(list 'l_ ''(metadata) N))
)
		
(de to_lisp (N)
	(if (= (car N) 'l_)
		(car (cddr N))
		(mapcar 'to_lisp N))
)

(de function_name (N)
	(car (to_lisp N))
)


(de l_ X
	(car (cdr X))
)




(de function_definition? (N) 
	(if 
		(and 
			(lst? N) 
			(= (car N) 'de)) 
		(car (cdr N)))
)

(de unused(X)())

(de print_banner()
	'(just a funky line that helps me not to get lost in the terminal output)
	(for I 10 (unused I)(printsp '-))
	(prin "lemon operating language")
	(for I 10 (unused I)(printsp '-))
	(prinl)
)


(setq Defuns (extract 'function_definition? l0))

))

(l0)

'(view (extract 'function_definition? l0))
'(println (lintAll))
'(extract '((N)(println N)) l0)
'(trace 'lint)
'(view (lint 'l))

(let lint_output (extract '((N)(if (lint N) (list N @))) Defuns)
	'(wait for lint output before printing the banner)
	(print_banner)
	(println 'lint ': lint_output)
)

(println "tracing:" (extract 'trace Defuns))

(setq l1 (to_lemon '(and 2 3)))

(put 'and 'template '((ch 1)(t " and ")(ch 2)))
(put 'and 'template '((ch 1)(t " and ")(ch 2)(t " and ")(ch 3)))

(println "l1:" l1 )
(println "text:" (text4node l1) )
	
'(l1)











