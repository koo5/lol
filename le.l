(setq l0 '(prog

'(put the whole program into variable l0, so we can access it later and edit it as l1 in the ide)

'(the data structures of this program:
	node - 
		an ast node..its unclear what it will mean here. the program should be able to 	render its own source code in a semi-lemonic way, and be fully able to manipulate its own native nodes..which might be the same, or not...
	pieces - 
		newline, child(name), "text", space; these say how a node should appear
	template - 
		a sequence of pieces
	markup - the resulting tree structure that the renderer deals with
)

(de hc (N)
	(hc4bits N (bits4node N))
)

(de bits4node (N)
	(if (lst? N)
		(if (== (car N) NIL)
			'((t "nil")))
		(if (get (car N) 'template)
			'((@)))
	)
)

(de hc4bits (N B)
	(println "generating markup for node" N "with template" B)
	(append '((node N)) (mapcar hc4bit T) '((/node)))
)

(de hc4bit (B)
	(let (V (cdr B))
		(case (car B)
			('t V)
			(T "fuck" )
		)
	)
)

(put 'and 'template '((t "1 and 2")))

(load "s2.l")

))(l0)


(setq l1 '(and 2 3))
(println (hc l1))

'(get 'and 'template)

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
 
 
