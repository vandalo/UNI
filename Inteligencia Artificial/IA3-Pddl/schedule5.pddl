;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                  ;;
;;        Arxiu Generat Automaticament amb:         ;;
;;   1- 20 llibres per llegir                        
;;   2- 20 llibres llegits                           
;;   3- 4 relacions paraleles                       
;;   4- 4 relacions de requisits                    
;;   5- Amb la llabor: 0                            
;;                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (problem schedule5) (:domain libros)
(:objects
      enero febrero marzo abril mayo junio
      julio agosto septiembre octubre noviembre diciembre
      ;;Llibres per llegir:
      llibre1 llibre2 llibre3 llibre4 llibre5 llibre6 llibre7 llibre8 llibre9 llibre10 llibre11 llibre12 llibre13 llibre14 llibre15 llibre16 llibre17 llibre18 llibre19 llibre20 
      ;;Llibres llegits:
      llibre21 llibre22 llibre23 llibre24 llibre25 llibre26 llibre27 llibre28 llibre29 llibre30 llibre31 llibre32 llibre33 llibre34 llibre35 llibre36 llibre37 llibre38 llibre39 llibre40 llibre0
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
  (to_read llibre11)
  (to_read llibre12)
  (to_read llibre13)
  (to_read llibre14)
  (to_read llibre15)
  (to_read llibre16)
  (to_read llibre17)
  (to_read llibre18)
  (to_read llibre19)
  (to_read llibre20)

  (readed llibre21)
  (readed llibre22)
  (readed llibre23)
  (readed llibre24)
  (readed llibre25)
  (readed llibre26)
  (readed llibre27)
  (readed llibre28)
  (readed llibre29)
  (readed llibre30)
  (readed llibre31)
  (readed llibre32)
  (readed llibre33)
  (readed llibre34)
  (readed llibre35)
  (readed llibre36)
  (readed llibre37)
  (readed llibre38)
  (readed llibre39)
  (readed llibre40)

  (paralel llibre7 llibre9)
  (paralel llibre10 llibre32)
  (paralel llibre18 llibre33)
  (paralel llibre24 llibre38)

  (required llibre0 llibre5)
  (required llibre3 llibre29)
  (required llibre12 llibre2)
  (required llibre27 llibre23)

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
  (readed llibre11)
  (readed llibre12)
  (readed llibre13)
  (readed llibre14)
  (readed llibre15)
  (readed llibre16)
  (readed llibre17)
  (readed llibre18)
  (readed llibre19)
  (readed llibre20)
  )
))

