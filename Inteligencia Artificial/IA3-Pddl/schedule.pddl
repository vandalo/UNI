(define (problem schedule1) (:domain libros)
(:objects 
        enero febrero marzo abril mayo junio num_pag
        julio agosto septiembre octubre noviembre diciembre
	harrypotter3 harrypotter2 harrypotter4 starwars
	harrypotter1 startrek elgranuniversodedaniconandroid 
)
(:init
  (to_read starwars)
  (to_read harrypotter3)
  (to_read harrypotter2)
  (to_read harrypotter4)
  (readed harrypotter1)
  (readed startrek)
  (readed elgranuniversodedaniconandroid)
  (paralel starwars startrek)
  (paralel startrek starwars)
  (required harrypotter2 harrypotter1)
  (required harrypotter4 harrypotter3)
  (required harrypotter3 harrypotter2)

  (seguidos enero febrero)
  (seguidos febrero marzo)
  (seguidos marzo abril)
  (seguidos abril mayo)
  (seguidos mayo junio)
  (seguidos junio julio)
  (seguidos julio agosto)
  (seguidos agosto septiembre)
  (seguidos septiembre octubre)
  (seguidos octubre noviembre)
  (seguidos noviembre diciembre)

  (mes junio startrek)

  ;;(= (num_paginas num_pg starwars) 0)
)

(:goal   
        (not(exists (?y) (to_read ?y)))
))