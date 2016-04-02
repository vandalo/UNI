;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                  ;;
;;        Arxiu Generat Automaticament amb:         ;;
;;   1- 10 llibres per llegir                        
;;   2- 5 llibres llegits                           
;;   3- 0 relacions paraleles                       
;;   4- 0 relacions de requisits                    
;;   5- Amb la llabor: 0                            
;;                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (problem schedule1) (:domain libros)
(:objects
      enero febrero marzo abril mayo junio
      julio agosto septiembre octubre noviembre diciembre
      ;;Llibres per llegir:
      llibre1 llibre2 llibre3 llibre4 llibre5 llibre6 llibre7 llibre8 llibre9 llibre10 
      ;;Llibres llegits:
      llibre11 llibre12 llibre13 llibre14 llibre15 
)
(:init
  (to_read llibre1)
  (to_read llibre2)
  (to_read llibre3)
  (to_read llibre4)
  (to_read llibre5)
  (to_read llibre6)
  (to_read llibre7)
  (to_read llibre8)
  (to_read llibre9)
  (to_read llibre10)

  (readed llibre11)
  (readed llibre12)
  (readed llibre13)
  (readed llibre14)
  (readed llibre15)



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

)
(:goal (and
  (readed llibre1)
  (readed llibre2)
  (readed llibre3)
  (readed llibre4)
  (readed llibre5)
  (readed llibre6)
  (readed llibre7)
  (readed llibre8)
  (readed llibre9)
  (readed llibre10)
  )
))

