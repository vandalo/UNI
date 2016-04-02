(define (domain libros)
  (:requirements :strips :adl :equality )
  
  (:predicates  (paralel ?x ?y)
                (required ?x ?y)
                (readed ?x)
                (to_read ?x)
                (seguidos ?mes_actual ?siguiente)
                (mes ?Mes ?x)
                (num_paginas ?num_pag ?libro)
  )

  (:action 
    ;; legeix paralels
    read_a_book_paralel
    :parameters (?x ?mes)
    :precondition (and 
                    (to_read ?x) 
                    (exists (?y) (paralel ?x ?y))
                  )
    :effect (and 
                (readed ?x)
                (not(to_read ?x))
                (mes ?mes ?x)
            )
    )

  (:action 
    ;; sexecuta quan no queden paralel per llegir
    read_a_book_when_no_paralel_possibility 
    :parameters (?x ?mes)
    :precondition 
        (and 
            (to_read ?x)
            (forall (?z)
                (and 
                    (not (exists (?y)
                        (or
                            (and
                                (paralel ?z ?y)
                                (readed ?y)
                                (to_read ?z)
                            )
                            (and
                                (paralel ?y ?z)
                                (readed ?z)
                                (to_read ?y)
                            )
                                
                        )
                    ))
                )
            )
            (forall (?n) 
            (or (not(required ?x ?n))
            (and (required ?x ?n) (readed ?n)) ) )  
         )
    :effect (and (readed ?x) (mes ?mes ?x) (not(to_read ?x)))
  )

)