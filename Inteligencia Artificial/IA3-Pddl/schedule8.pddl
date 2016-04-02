;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                  ;;
;;        Arxiu Generat Automaticament amb:         ;;
;;   1- 50 llibres per llegir                        
;;   2- 50 llibres llegits                           
;;   3- 20 relacions paraleles                       
;;   4- 0 relacions de requisits                    
;;   5- Amb la llabor: 0                            
;;                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (problem schedule8) (:domain libros)
(:objects
      enero febrero marzo abril mayo junio
      julio agosto septiembre octubre noviembre diciembre
      ;;Llibres per llegir:
      llibre1 llibre2 llibre3 llibre4 llibre5 llibre6 llibre7 llibre8 llibre9 llibre10 llibre11 llibre12 llibre13 llibre14 llibre15 llibre16 llibre17 llibre18 llibre19 llibre20 llibre21 llibre22 llibre23 llibre24 llibre25 llibre26 llibre27 llibre28 llibre29 llibre30 llibre31 llibre32 llibre33 llibre34 llibre35 llibre36 llibre37 llibre38 llibre39 llibre40 llibre41 llibre42 llibre43 llibre44 llibre45 llibre46 llibre47 llibre48 llibre49 llibre50 
      ;;Llibres llegits:
      llibre51 llibre52 llibre53 llibre54 llibre55 llibre56 llibre57 llibre58 llibre59 llibre60 llibre61 llibre62 llibre63 llibre64 llibre65 llibre66 llibre67 llibre68 llibre69 llibre70 llibre71 llibre72 llibre73 llibre74 llibre75 llibre76 llibre77 llibre78 llibre79 llibre80 llibre81 llibre82 llibre83 llibre84 llibre85 llibre86 llibre87 llibre88 llibre89 llibre90 llibre91 llibre92 llibre93 llibre94 llibre95 llibre96 llibre97 llibre98 llibre99 llibre100 llibre0
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
  (to_read llibre21)
  (to_read llibre22)
  (to_read llibre23)
  (to_read llibre24)
  (to_read llibre25)
  (to_read llibre26)
  (to_read llibre27)
  (to_read llibre28)
  (to_read llibre29)
  (to_read llibre30)
  (to_read llibre31)
  (to_read llibre32)
  (to_read llibre33)
  (to_read llibre34)
  (to_read llibre35)
  (to_read llibre36)
  (to_read llibre37)
  (to_read llibre38)
  (to_read llibre39)
  (to_read llibre40)
  (to_read llibre41)
  (to_read llibre42)
  (to_read llibre43)
  (to_read llibre44)
  (to_read llibre45)
  (to_read llibre46)
  (to_read llibre47)
  (to_read llibre48)
  (to_read llibre49)
  (to_read llibre50)

  (readed llibre51)
  (readed llibre52)
  (readed llibre53)
  (readed llibre54)
  (readed llibre55)
  (readed llibre56)
  (readed llibre57)
  (readed llibre58)
  (readed llibre59)
  (readed llibre60)
  (readed llibre61)
  (readed llibre62)
  (readed llibre63)
  (readed llibre64)
  (readed llibre65)
  (readed llibre66)
  (readed llibre67)
  (readed llibre68)
  (readed llibre69)
  (readed llibre70)
  (readed llibre71)
  (readed llibre72)
  (readed llibre73)
  (readed llibre74)
  (readed llibre75)
  (readed llibre76)
  (readed llibre77)
  (readed llibre78)
  (readed llibre79)
  (readed llibre80)
  (readed llibre81)
  (readed llibre82)
  (readed llibre83)
  (readed llibre84)
  (readed llibre85)
  (readed llibre86)
  (readed llibre87)
  (readed llibre88)
  (readed llibre89)
  (readed llibre90)
  (readed llibre91)
  (readed llibre92)
  (readed llibre93)
  (readed llibre94)
  (readed llibre95)
  (readed llibre96)
  (readed llibre97)
  (readed llibre98)
  (readed llibre99)
  (readed llibre100)

  (paralel llibre3 llibre69)
  (paralel llibre9 llibre57)
  (paralel llibre10 llibre33)
  (paralel llibre12 llibre67)
  (paralel llibre16 llibre35)
  (paralel llibre21 llibre79)
  (paralel llibre26 llibre97)
  (paralel llibre27 llibre29)
  (paralel llibre30 llibre72)
  (paralel llibre42 llibre92)
  (paralel llibre58 llibre73)
  (paralel llibre78 llibre99)


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
  (readed llibre41)
  (readed llibre42)
  (readed llibre43)
  (readed llibre44)
  (readed llibre45)
  (readed llibre46)
  (readed llibre47)
  (readed llibre48)
  (readed llibre49)
  (readed llibre50)
  )
))

