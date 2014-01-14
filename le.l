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
			(get (car N) 'template))
		@)
		
		(T 
		'((t "fuck")))
	)
)
'(debug 'bits4node)

(de hcml4bits (N B)
	(println "generating markup for node" N "with template" B)
	(append '((node N)) (mapcar hcml4bit B) '((/node)))
)

(de hcml4bit (B)
	(let (V (cdr B))
		(case (car B)
			(t V)
			(T B )
		)
	)
)


(de to_lemon (N) (list 'l ''(metadata) N))

(de l (N)
	(println "executing" (cddr N))
	((cddr N))
)




(de trc (N) 
	(if 
		(and 
			(lst? N) 
			(= (car N) 'de)) 
		(trace (car (cdr N))))
)


))(l0)


(println (lintAll))
(println "tracing:" (mapcar 'trc l0))


(setq l1 (to_lemon '(and 2 3)))

(put 'and 'template '((ch 1)(t " and ")(ch 2)))
(put 'and 'template '((ch 1)(t " and ")(ch 2)(t " and ")(ch 3)))

(println "HCML" (hcml4node l1) "/HCML" )

(println "running" l1)
(l1)











(bye)











			

'(the simplest option would be to save the template data in attributes:
(put 'and 'template '(1 " and " 2))
but...)

'(are pieces classes or pairs?)

(de tt (X)
	(let V (cdr X)
		(println (car X) V)
		(case (car X)
			('t 'V)
			('ch (tt V))
			('nl "\n")
			(T V)
		)
	)
)


(de repr(N)
(if (get 'X 'repr)
		(mapcar ((I
		(


(class +Node)



items....how much do i want to keep plain text representation usable? should text still be a string and get special handling? or do i depend on the editor fully?

no markup: you have a list processing language, ..


(class +Piece)

(class +Text +Piece)
(T (V)(=: v V))
(dm repr> ()
	('(: v))


	
(assertz '(representation (and '(1 "and" 2))))

(de representation(N)
	(let (R R)
		(pilog (list(list 'representation N '@X))
			(setq R @X)
		)
	)
)
tt
ft




(assertz '(has_class (








......

(l0)
(setq l1 l0)
(loop)


(require :update)
(assertz '(repr require ((t "
 
(system.update:install-allegrograph)
 
 
(repr (node)) or (docs (node))
 
 
 
 
 
(menu loop)
 
 
....

vsechno lemon (vs specialni handlovani lispu a lemonu)
-> (de to_lemon (N),,,

list x object?

(l (metadata) (and 1 2))

and:
	(1 "and" 2)
	(1 "and" 2 "and" 3)


