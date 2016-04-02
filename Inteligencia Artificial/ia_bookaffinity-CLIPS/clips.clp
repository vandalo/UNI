; Tue Nov 24 19:23:09 CET 2015
; 
;+ (version "3.5")
;+ (build "Build 660")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot edad
		(type SYMBOL)
		(allowed-values infantil juvenil adulto)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot paginas
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot titulo
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot tipologia_sexual
		(type SYMBOL)
		(allowed-values masculino femenino indiferente)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot genero
		(type INSTANCE)
;+		(allowed-classes Genero)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot complejidad
		(type SYMBOL)
		(allowed-values facil mediana dificil)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Genero
	(is-a USER)
	(role concrete)
	(single-slot nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Narrativa
	(is-a Genero)
	(role concrete))

(defclass Novela
	(is-a USER)
	(role concrete)
        (single-slot autor
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot titulo
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot edad
		(type SYMBOL)
		(allowed-values infantil juvenil adulto)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot tipologia_sexual
		(type SYMBOL)
		(allowed-values masculino femenino indiferente)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot genero
		(type INSTANCE)
;+		(allowed-classes Genero)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot paginas
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot complejidad
		(type SYMBOL)
		(allowed-values facil mediana dificil)
;+		(cardinality 1 1)
		(create-accessor read-write))
        (single-slot bestseller
		(type SYMBOL)
;+		(cardinality 1 1)
		(create-accessor read-write)))


;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------                                   INSTANCIAS                                                      ----------                                                              INSTANCIAS
;;;------------------------------------------------------------------------------------------------------------------------------------------------------
(definstances instancies 
; Tue Nov 24 19:23:09 CET 2015
; 
;+ (version "3.5")
;+ (build "Build 660")

([CienciaFiccion] of  Genero

        (nombre "Ciencia ficcion"))

([Clasica] of  Narrativa

        (nombre "Clasica"))

([Contemporanea] of  Narrativa

        (nombre "Contemporanea"))

([Fantasia] of  Genero

        (nombre "Fantasia"))

([Romantica] of  Genero

        (nombre "Romantica"))

([Terror] of  Genero

        (nombre "Terror"))

([Policiaca] of  Genero

        (nombre "Policiaca"))

([Aventuras] of  Genero

        (nombre "Aventuras"))

([Comedia] of  Genero

        (nombre "Comedia"))

([Novela_9788420499055] of  Novela
(complejidad facil)
(edad juvenil)
(genero [Romantica])
(paginas 832)
(tipologia_sexual femenino)
(titulo "Amanecer (Saga Crepusculo 4)")
(autor "Stephenie Meyer")
(bestseller TRUE)
)

([Novela_8420405698] of  Novela
(complejidad facil)
(edad juvenil)
(genero [Romantica])
(paginas 312)
(tipologia_sexual femenino)
(titulo "Noches de baile en el Infierno")
(autor "Stephenie Meyer")
(bestseller TRUE)
)

([Novela_9788420499062] of  Novela
(complejidad facil)
(edad juvenil)
(genero [Romantica])
(paginas 512)
(tipologia_sexual femenino)
(titulo "Crepusculo (Saga Crepusculo 1)")
(autor "Stephenie Meyer")
(bestseller TRUE)
)

([Novela_1417795131] of  Novela
(complejidad facil)
(edad juvenil)
(genero [Romantica])
(paginas 574)
(tipologia_sexual femenino)
(titulo "Luna Nueva = New Moon")
(autor "Stephenie Meyer")
(bestseller TRUE)
)

([Novela_1941999638] of  Novela
(complejidad facil)
(edad juvenil)
(genero [Romantica])
(paginas 832)
(tipologia_sexual femenino)
(titulo "Crepsculo / Vida y muerte / Twilight / Life and Death")
(autor "Stephenie Meyer")
(bestseller TRUE)
)

([Novela_1603960228] of  Novela
(complejidad facil)
(edad juvenil)
(genero [Romantica])
(paginas 637)
(tipologia_sexual femenino)
(titulo "Crepusculo")
(autor "Stephenie Meyer")
(bestseller TRUE)
)

([Novela_8420409855] of  Novela
(complejidad facil)
(edad juvenil)
(genero [Romantica])
(paginas 232)
(tipologia_sexual femenino)
(titulo "Crepusculo II. La novela grafica")
(autor "Stephenie Meyer")
(bestseller TRUE)
)

([Novela_0882723243] of  Novela
(complejidad facil)
(edad juvenil)
(genero [Romantica])
(paginas 762)
(tipologia_sexual femenino)
(titulo "Huesped")
(autor "Stephenie Meyer")
(bestseller TRUE)
)

([Novela_8420406139] of  Novela
(complejidad facil)
(edad juvenil)
(genero [Romantica])
(paginas 224)
(tipologia_sexual femenino)
(titulo "Crepusculo : la novela grafica")
(autor "Stephenie Meyer")
(bestseller TRUE)
)

([Novela_8420471933] of  Novela
(complejidad facil)
(edad juvenil)
(genero [Romantica])
(paginas 512)
(tipologia_sexual femenino)
(titulo "Crepusculo (Edicion de regalo en cartone)")
(autor "Stephenie Meyer")
(bestseller TRUE)
)

([Novela_8483651807] of  Novela
(complejidad facil)
(edad juvenil)
(genero [Romantica])
(paginas 760)
(tipologia_sexual femenino)
(titulo "La huesped (The host) (Edicion especial en rustica)")
(autor "Stephenie Meyer")
(bestseller TRUE)
)

([Novela_1514231638] of  Novela
(complejidad facil)
(edad juvenil)
(genero [Romantica])
(paginas 244)
(tipologia_sexual femenino)
(titulo "Luna Nueva: Stephenie Meyer (Spanish Edition)")
(autor "Stephenie Meyer")
(bestseller TRUE)
)

([Novela_8420472360] of  Novela
(complejidad facil)
(edad juvenil)
(genero [Romantica])
(paginas 574)
(tipologia_sexual femenino)
(titulo "Luna nueva (Edicion de regalo en cartone)")
(autor "Stephenie Meyer")
(bestseller TRUE)
)

([Novela_842047388X] of  Novela
(complejidad facil)
(edad juvenil)
(genero [Romantica])
(paginas 792)
(tipologia_sexual femenino)
(titulo "A trenc d'alba")
(autor "Stephenie Meyer")
(bestseller TRUE)
)

([Novela_8435015955] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 262)
(tipologia_sexual indiferente)
(titulo "Blade runner")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_9788445001332] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 256)
(tipologia_sexual indiferente)
(titulo "Esperando el ano pasado")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_1517251052] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 268)
(tipologia_sexual indiferente)
(titulo "Deus Irae")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_8445076353] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 240)
(tipologia_sexual indiferente)
(titulo "Los tres estigmas de Palmer Eldritch")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_844507623X] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 480)
(tipologia_sexual indiferente)
(titulo "Cuentos completos / Beyond Lies the Wub")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_9505815824] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 292)
(tipologia_sexual indiferente)
(titulo "La Mente Alien")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_8445077740] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 304)
(tipologia_sexual indiferente)
(titulo "El hombre en el castillo")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_8445076329] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 224)
(tipologia_sexual indiferente)
(titulo "Simulacra")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_1517250226] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 226)
(tipologia_sexual indiferente)
(titulo "Planetas Morales")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_151724966X] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 374)
(tipologia_sexual indiferente)
(titulo "Radio Libre Albemuth")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_1517244080] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 350)
(tipologia_sexual indiferente)
(titulo "La Penultima Verdad")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_9788445000502] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 224)
(tipologia_sexual indiferente)
(titulo "Tiempo desarticulado")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_8435022072] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 288)
(tipologia_sexual indiferente)
(titulo "Un Ojo en el Cielo")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_9788445001356] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 256)
(tipologia_sexual indiferente)
(titulo "La invasion divina")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_9788445001189] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 272)
(tipologia_sexual indiferente)
(titulo "Dr. Bloodmoney : o como nos las apanamos despues de la bomba")
(autor "Philip K. Dick")
(bestseller FALSE)
)

([Novela_8498723523] of  Novela
(complejidad facil)
(edad adulto)
(genero [Policiaca])
(paginas 603)
(tipologia_sexual indiferente)
(titulo "El Padrino")
(autor "Mario Puzo")
(bestseller TRUE)
)

([Novela_8498729025] of  Novela
(complejidad facil)
(edad adulto)
(genero [Policiaca])
(paginas 720)
(tipologia_sexual indiferente)
(titulo "El Ultimo Don")
(autor "Mario Puzo")
(bestseller TRUE)
)

([Novela_8466639764] of  Novela
(complejidad facil)
(edad adulto)
(genero [Policiaca])
(paginas 174)
(tipologia_sexual indiferente)
(titulo "Seis tumbas en Munich")
(autor "Mario Puzo")
(bestseller TRUE)
)

([Novela_8420658936] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 464)
(tipologia_sexual indiferente)
(titulo "Fiasco")
(autor "Stanislaw Lem")
(bestseller FALSE)
)

([Novela_8420659096] of  Novela
(complejidad dificil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 192)
(tipologia_sexual indiferente)
(titulo "Aventuras estelares del piloto Pirx")
(autor "Stanislaw Lem")
(bestseller FALSE)
)

([Novela_8420659630] of  Novela
(complejidad dificil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 304)
(tipologia_sexual indiferente)
(titulo "Mas relatos del piloto Pirx")
(autor "Stanislaw Lem")
(bestseller FALSE)
)

([Novela_8415130090] of  Novela
(complejidad dificil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 296)
(tipologia_sexual indiferente)
(titulo "Solaris")
(autor "Stanislaw Lem")
(bestseller FALSE)
)

([Novela_8420610992] of  Novela
(complejidad dificil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 280)
(tipologia_sexual indiferente)
(titulo "Relatos del piloto Pirx")
(autor "Stanislaw Lem")
(bestseller FALSE)
)

([Novela_8415130104] of  Novela
(complejidad dificil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 248)
(tipologia_sexual indiferente)
(titulo "La investigacion")
(autor "Stanislaw Lem")
(bestseller FALSE)
)

([Novela_8420659746] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 568)
(tipologia_sexual indiferente)
(titulo "Diarios de las estrellas")
(autor "Stanislaw Lem")
(bestseller FALSE)
)

([Novela_8493760129] of  Novela
(complejidad dificil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 144)
(tipologia_sexual indiferente)
(titulo "Magnitud imaginaria")
(autor "Stanislaw Lem")
(bestseller FALSE)
)

([Novela_8441410666] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 256)
(tipologia_sexual indiferente)
(titulo "La sombra sobre Onnsmouth")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8420643343] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 736)
(tipologia_sexual indiferente)
(titulo "Los mitos de Cthulhu")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8478339787] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 120)
(tipologia_sexual indiferente)
(titulo "Lovecraft: Desde el mas alla")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_9789635230792] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 42)
(tipologia_sexual indiferente)
(titulo "El Horror de Dunwich")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8415530188] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 128)
(tipologia_sexual indiferente)
(titulo "En las montanas de la locura")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8498851394] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 112)
(tipologia_sexual indiferente)
(titulo "La guarida del horror")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_849283739X] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 128)
(tipologia_sexual indiferente)
(titulo "La llamada de Cthulhu")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8420691917] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 307)
(tipologia_sexual indiferente)
(titulo "Dagon y otros cuentos macabros")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8495994135] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 157)
(tipologia_sexual indiferente)
(titulo "El color surgido del espacio; dagon; la sombra sobre innsmouth")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8441413789] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 96)
(tipologia_sexual indiferente)
(titulo "La Casa Maldita")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_OCLC3354339] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 207)
(tipologia_sexual indiferente)
(titulo "Viajes al otro mundo")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_9788441422841] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 328)
(tipologia_sexual indiferente)
(titulo "La llamada de Cthulhu y otros cuentos de terror")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_9509546844] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 115)
(tipologia_sexual indiferente)
(titulo "El horror sobrenatural en la literatura")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8492837756] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 184)
(tipologia_sexual indiferente)
(titulo "La busqueda en suenos de Kadath la desconocida")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8441414548] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 96)
(tipologia_sexual indiferente)
(titulo "Polaris")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8476409869] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 368)
(tipologia_sexual indiferente)
(titulo "El intruso")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8476407548] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 552)
(tipologia_sexual indiferente)
(titulo "Los que acechan en el abismo")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_9788026802266] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 480)
(tipologia_sexual indiferente)
(titulo "La Llamada de Cthulhu (texto completo, con indice activo)")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8441414998] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 96)
(tipologia_sexual indiferente)
(titulo "La busqueda Onirica de la Desconocida Kadath")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8441408955] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 264)
(tipologia_sexual indiferente)
(titulo "El que susurra en la oscuridad")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8476404778] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 176)
(tipologia_sexual indiferente)
(titulo "Noche del oceano y otros escritos ineditos")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8420672564] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 232)
(tipologia_sexual indiferente)
(titulo "La habitacion cerrada y otros cuentos de terror")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8477025878] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 960)
(tipologia_sexual indiferente)
(titulo "Narrativa completa")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8441413762] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 96)
(tipologia_sexual indiferente)
(titulo "La llave de plata")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8441413797] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 96)
(tipologia_sexual indiferente)
(titulo "La ultima prueba")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_1517329744] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 60)
(tipologia_sexual indiferente)
(titulo "Herber West Reanimador")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_8490721963] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 136)
(tipologia_sexual indiferente)
(titulo "LAS ALAS DE LA DIOSA")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_9781497691728] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 196)
(tipologia_sexual indiferente)
(titulo "Relatos de los mitos de Cthulhu")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_1517329825] of  Novela
(complejidad dificil)
(edad adulto)
(genero [Terror])
(paginas 64)
(tipologia_sexual indiferente)
(titulo "Encerrado con los faraones")
(autor "H.P. Lovecraft")
(bestseller FALSE)
)

([Novela_OCLC55311681] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 610)
(tipologia_sexual indiferente)
(titulo "El retorno de la sombra")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8445075748] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 476)
(tipologia_sexual indiferente)
(titulo "El Senor de los anillos")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_0061756776] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 608)
(tipologia_sexual indiferente)
(titulo "El senor de los anillos: El retorno del rey")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_844507430X] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 476)
(tipologia_sexual indiferente)
(titulo "El senor de los anillos 2")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_OCLC11706289] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 201)
(tipologia_sexual indiferente)
(titulo "El Senor de los anillos")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_9505470673] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 547)
(tipologia_sexual indiferente)
(titulo "El Senor De Los Anillos : LA Comunidad Del Anillo / Lord of the Rings : The Fellowship of the Ring")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8445074857] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 360)
(tipologia_sexual indiferente)
(titulo "El Hobbit, o, Historia de una Ida y de una Vuelta")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_844507248X] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 158)
(tipologia_sexual indiferente)
(titulo "Egidio, el granjero de Ham / Hoja de Niggle / El herrero de Wootton Mayor")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8445071416] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 309)
(tipologia_sexual indiferente)
(titulo "El hobbit")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_9788445001462] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 258)
(tipologia_sexual indiferente)
(titulo "La caida de Arturo")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_0606244263] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 309)
(tipologia_sexual indiferente)
(titulo "El Hobbit / the Hobbit")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8445071386] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 362)
(tipologia_sexual indiferente)
(titulo "El libro de los cuentos perdidos")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8445072978] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 144)
(tipologia_sexual indiferente)
(titulo "Roverandom")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_0606244255] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 413)
(tipologia_sexual indiferente)
(titulo "El Senor De Los Anillos / the Lord of the Rings")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8435002608] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 461)
(tipologia_sexual indiferente)
(titulo "El Senor de los Anillos. 2, Las dos torres")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_0606305645] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 461)
(tipologia_sexual indiferente)
(titulo "DOS Torres (Two Towers)")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8435002799] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 413)
(tipologia_sexual indiferente)
(titulo "El Senor de los Anillos. 3, El retorno del Rey")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8445072919] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 574)
(tipologia_sexual indiferente)
(titulo "Cuentos inconclusos de Numenor y la Tierra Media")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8476697619] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 111)
(tipologia_sexual indiferente)
(titulo "Cartas de Papa Noel")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8445072064] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 96)
(tipologia_sexual indiferente)
(titulo "Poemas")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8445077503] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 480)
(tipologia_sexual indiferente)
(titulo "El Senor de los Anillos II. Las Dos Torres")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_9788445073971] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 249)
(tipologia_sexual indiferente)
(titulo "La Lengua de los Elfos")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8445000659] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 309)
(tipologia_sexual indiferente)
(titulo "El hobbit")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8466609792] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 298)
(tipologia_sexual indiferente)
(titulo "Tolkien")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8445077279] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 336)
(tipologia_sexual indiferente)
(titulo "Los hijos de Hurin")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_844507637X] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 350)
(tipologia_sexual indiferente)
(titulo "Narn i chin Hurin")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8445071726] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 540)
(tipologia_sexual indiferente)
(titulo "La Guerra Del Anillo")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8445077821] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 40)
(tipologia_sexual indiferente)
(titulo "La ultima cancion de Bilbo")
(autor "J.R.R. Tolkien")
(bestseller TRUE)
)

([Novela_8490629978] of  Novela
(complejidad facil)
(edad adulto)
(genero [Romantica])
(paginas 588)
(tipologia_sexual femenino)
(titulo "Cincuenta sombras mas oscuras")
(autor "E.L. James")
(bestseller TRUE)
)

([Novela_9788425349874] of  Novela
(complejidad facil)
(edad adulto)
(genero [Romantica])
(paginas 656)
(tipologia_sexual femenino)
(titulo "Cincuenta sombras liberadas (version argentina) (Cincuenta sombras 3)")
(autor "E.L. James")
(bestseller TRUE)
)

([Novela_9788425349867] of  Novela
(complejidad facil)
(edad adulto)
(genero [Romantica])
(paginas 592)
(tipologia_sexual femenino)
(titulo "Cincuenta sombras mas oscuras (version argentina) (Cincuenta sombras 2)")
(autor "E.L. James")
(bestseller TRUE)
)

([Novela_8420638978] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 313)
(tipologia_sexual indiferente)
(titulo "La tierra de Canaan")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8420635340] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 263)
(tipologia_sexual indiferente)
(titulo "La Republica Romana")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8440644183] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 507)
(tipologia_sexual indiferente)
(titulo "La Ultima pregunta y otros cuentos")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_9788490324752] of  Novela
(complejidad facil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 488)
(tipologia_sexual indiferente)
(titulo "Suenos de robot")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_9681803213] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 203)
(tipologia_sexual indiferente)
(titulo "El rio viviente")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8420602825] of  Novela
(complejidad facil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 536)
(tipologia_sexual indiferente)
(titulo "La mente errabunda")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8427254709] of  Novela
(complejidad facil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 54)
(tipologia_sexual indiferente)
(titulo "Como descubrimos los germenes")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_9788490325360] of  Novela
(complejidad facil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 464)
(tipologia_sexual indiferente)
(titulo "Nemesis")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8420635375] of  Novela
(complejidad facil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 291)
(tipologia_sexual indiferente)
(titulo "La formacion de Inglaterra")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8420657654] of  Novela
(complejidad facil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 296)
(tipologia_sexual indiferente)
(titulo "Cuentos de los viudos negros")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8420674257] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 176)
(tipologia_sexual indiferente)
(titulo "Momentos estelares de la ciencia")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8420602086] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 352)
(tipologia_sexual indiferente)
(titulo "Opus 200 1c Isaac Asimov")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8420635332] of  Novela
(complejidad facil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 313)
(tipologia_sexual indiferente)
(titulo "Constantinopla")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_9788490323519] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 512)
(tipologia_sexual indiferente)
(titulo "Robots e Imperio (Saga de la Fundacion 5)")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8498890586] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 496)
(tipologia_sexual indiferente)
(titulo "El robot completo")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8434452146] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 1106)
(tipologia_sexual indiferente)
(titulo "Historia y cronologia del mundo")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8420675547] of  Novela
(complejidad facil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 304)
(tipologia_sexual indiferente)
(titulo "El electron es zurdo y otros ensayos cientificos")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_9788490622148] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 288)
(tipologia_sexual indiferente)
(titulo "El fin de la eternidad")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8420602345] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 320)
(tipologia_sexual indiferente)
(titulo "Enciclopedia biografica de ciencia y tecnologia")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_9788499084367] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 496)
(tipologia_sexual indiferente)
(titulo "Trilogia de la Fundacion")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8435014274] of  Novela
(complejidad facil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 338)
(tipologia_sexual indiferente)
(titulo "Sobre la ciencia ficcion")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8420673315] of  Novela
(complejidad facil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 200)
(tipologia_sexual indiferente)
(titulo "Los lagartos terribles y otros ensayos cientificos")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8497934369] of  Novela
(complejidad facil)
(edad adulto)
(genero [CienciaFiccion])
(paginas 416)
(tipologia_sexual indiferente)
(titulo "Anochecer")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8401803209] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 149)
(tipologia_sexual indiferente)
(titulo "El cometa Halley")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8434453444] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 913)
(tipologia_sexual indiferente)
(titulo "Historia y cronologia de la ciencia y los descubrimientos")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8498006120] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 378)
(tipologia_sexual indiferente)
(titulo "Hacia la fundacion / Forward the Foundation")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_OCLC733955852] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 313)
(tipologia_sexual indiferente)
(titulo "Historia Universal Asimov")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_9788490322826] of  Novela
(complejidad mediana)
(edad adulto)
(genero [CienciaFiccion])
(paginas 560)
(tipologia_sexual indiferente)
(titulo "Visiones de robot (Saga de la Fundacion 1)")
(autor "Isaac Asimov")
(bestseller FALSE)
)

([Novela_8498721016] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 475)
(tipologia_sexual indiferente)
(titulo "Mis Rincones Oscuros")
(autor "James Ellroy")
(bestseller FALSE)
)

([Novela_9788439726258] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 240)
(tipologia_sexual indiferente)
(titulo "A la caza de la mujer")
(autor "James Ellroy")
(bestseller FALSE)
)

([Novela_8440699662] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 880)
(tipologia_sexual indiferente)
(titulo "Seis de Los Grandes")
(autor "James Ellroy")
(bestseller FALSE)
)

([Novela_846663844X] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 288)
(tipologia_sexual indiferente)
(titulo "Noches en Hollywood/ Hollywood Nocturnes")
(autor "James Ellroy")
(bestseller FALSE)
)

([Novela_8498721229] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 544)
(tipologia_sexual indiferente)
(titulo "L.A CONFIDENTIAL")
(autor "James Ellroy")
(bestseller FALSE)
)

([Novela_8466602445] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 411)
(tipologia_sexual indiferente)
(titulo "Clandestino")
(autor "James Ellroy")
(bestseller FALSE)
)

([Novela_8466600817] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 276)
(tipologia_sexual indiferente)
(titulo "Tierras fronterizas")
(autor "James Ellroy")
(bestseller FALSE)
)

([Novela_9580443823] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 232)
(tipologia_sexual indiferente)
(titulo "El maestro de las marionetas")
(autor "Katherine Paterson")
(bestseller FALSE)
)

([Novela_0613645820] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 122)
(tipologia_sexual indiferente)
(titulo "Puente Hasta Terabithia (Bridge to Terabithia)")
(autor "Katherine Paterson")
(bestseller FALSE)
)

([Novela_842043633X] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 152)
(tipologia_sexual indiferente)
(titulo "Un puente hasta Terabithia")
(autor "Katherine Paterson")
(bestseller FALSE)
)

([Novela_8427900899] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 240)
(tipologia_sexual indiferente)
(titulo "Ame a Jacob (Jacob Have I Loved)")
(autor "Katherine Paterson")
(bestseller FALSE)
)

([Novela_9703511449] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 52)
(tipologia_sexual indiferente)
(titulo "Abrir O Cerrar Mundos/ Opening and Closing Worlds")
(autor "Katherine Paterson")
(bestseller FALSE)
)

([Novela_1512378666] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 148)
(tipologia_sexual indiferente)
(titulo "Harry Potter")
(autor "J.K. Rowling")
(bestseller TRUE)
)

([Novela_8498381959] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 118)
(tipologia_sexual indiferente)
(titulo "Los cuentos de Beedle el Bardo")
(autor "J.K. Rowling")
(bestseller TRUE)
)

([Novela_8498381452] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 638)
(tipologia_sexual indiferente)
(titulo "Harry Potter and the deathly hallows")
(autor "J.K. Rowling")
(bestseller TRUE)
)

([Novela_8478889019] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Fantasia])
(paginas 893)
(tipologia_sexual indiferente)
(titulo "Harry Potter")
(autor "J.K. Rowling")
(bestseller TRUE)
)

([Novela_9788432214233] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 190)
(tipologia_sexual indiferente)
(titulo "Manolito Gafotas")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_8420472409] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 56)
(tipologia_sexual indiferente)
(titulo "Bolinga")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_8434856530] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 22)
(tipologia_sexual indiferente)
(titulo "Olivia no quiere banarse")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_9788432214981] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 204)
(tipologia_sexual indiferente)
(titulo "Pobre Manolito")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_9788432290619] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 162)
(tipologia_sexual indiferente)
(titulo "El otro barrio")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_8434851601] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 22)
(tipologia_sexual indiferente)
(titulo "Olivia y la carta a los Reyes Magos")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_8467545755] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 64)
(tipologia_sexual indiferente)
(titulo "Tres cuentos de Olivia")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_846631069X] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 143)
(tipologia_sexual indiferente)
(titulo "El Mundo es un panuelo")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_8434852896] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 22)
(tipologia_sexual indiferente)
(titulo "Olivia tiene cosas que hacer")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_9788432214967] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 187)
(tipologia_sexual indiferente)
(titulo "Manolito on the road")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_9788432214950] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 224)
(tipologia_sexual indiferente)
(titulo "Los trapos sucios (Manolito Gafotas )")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_9788432214974] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 277)
(tipologia_sexual indiferente)
(titulo "Yo y el imbecil")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_8420474088] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 152)
(tipologia_sexual indiferente)
(titulo "Manolito tiene un secreto")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_8420450006] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 123)
(tipologia_sexual indiferente)
(titulo "AComo Molo!")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_STANFORD36105028887763] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 246)
(tipologia_sexual indiferente)
(titulo "Ser mujer")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_8420450006] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 123)
(tipologia_sexual indiferente)
(titulo "¡Como molo!")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_8432298417] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 272)
(tipologia_sexual indiferente)
(titulo "Pack Lo que me queda por vivir ECI")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_8434856549] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 22)
(tipologia_sexual indiferente)
(titulo "La abuela de Olivia se ha perdido")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_8420448788] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 152)
(tipologia_sexual indiferente)
(titulo "Los Trapos Sucios")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_STANFORD36105129728288] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 46)
(tipologia_sexual indiferente)
(titulo "Cuentos para un viaje corto")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_UOM39015041804215] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 195)
(tipologia_sexual indiferente)
(titulo "Pintura dels setanta a Barcelona, superficie color")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_UTEXAS059173028048482] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 164)
(tipologia_sexual indiferente)
(titulo "Es Cri-Cri")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_9509015032] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Comedia])
(paginas 141)
(tipologia_sexual indiferente)
(titulo "Tema libre")
(autor "Elvira Lindo")
(bestseller FALSE)
)

([Novela_8467531096] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 395)
(tipologia_sexual indiferente)
(titulo "Pack Molly Moon")
(autor "Georgia Byng")
(bestseller FALSE)
)

([Novela_8467518456] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 62)
(tipologia_sexual indiferente)
(titulo "Las vacaciones hipnoticas de Molly Moon")
(autor "Georgia Byng")
(bestseller FALSE)
)

([Novela_8467547146] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 354)
(tipologia_sexual indiferente)
(titulo "Molly Moon y el increible libro del hipnotismo / Molly Moon's Incredible Book of Hypnotism")
(autor "Georgia Byng")
(bestseller FALSE)
)

([Novela_842040554X] of  Novela
(complejidad facil)
(edad infantil)
(genero [Fantasia])
(paginas 40)
(tipologia_sexual indiferente)
(titulo "DONDE VIVEN LOS MONSTRUOS RUSTICA")
(autor "Maurice Sendak")
(bestseller FALSE)
)

([Novela_8484648583] of  Novela
(complejidad facil)
(edad infantil)
(genero [Fantasia])
(paginas 48)
(tipologia_sexual indiferente)
(titulo "Donde viven los monstruos")
(autor "Maurice Sendak")
(bestseller FALSE)
)

([Novela_STANFORD36105043083208] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 181)
(tipologia_sexual indiferente)
(titulo "Cuando uno esta de suerte")
(autor "Dashiell Hammett")
(bestseller FALSE)
)

([Novela_8420653594] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 384)
(tipologia_sexual indiferente)
(titulo "El agente de la Continental")
(autor "Dashiell Hammett")
(bestseller FALSE)
)

([Novela_STANFORD36105002255300] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 182)
(tipologia_sexual indiferente)
(titulo "Muerte y Cia")
(autor "Dashiell Hammett")
(bestseller FALSE)
)

([Novela_STANFORD36105024222080] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 180)
(tipologia_sexual indiferente)
(titulo "Ciudad de pesadilla")
(autor "Dashiell Hammett")
(bestseller FALSE)
)

([Novela_8420637572] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 238)
(tipologia_sexual indiferente)
(titulo "El hombre delgado")
(autor "Dashiell Hammett")
(bestseller FALSE)
)

([Novela_8420684732] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 314)
(tipologia_sexual indiferente)
(titulo "El halcon maltes")
(autor "Dashiell Hammett")
(bestseller FALSE)
)

([Novela_8420640875] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 256)
(tipologia_sexual indiferente)
(titulo "La maldicion de los Dain")
(autor "Dashiell Hammett")
(bestseller FALSE)
)

([Novela_STANFORD36105006065804] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 151)
(tipologia_sexual indiferente)
(titulo "El precio del delito")
(autor "Dashiell Hammett")
(bestseller FALSE)
)

([Novela_8420617024] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 242)
(tipologia_sexual indiferente)
(titulo "La maldicion de los Dain")
(autor "Dashiell Hammett")
(bestseller FALSE)
)

([Novela_STANFORD36105020310590] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 48)
(tipologia_sexual indiferente)
(titulo "La herradura dorada")
(autor "Dashiell Hammett")
(bestseller FALSE)
)

([Novela_UTEXAS059173023651931] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Policiaca])
(paginas 99)
(tipologia_sexual indiferente)
(titulo "Quien mato a Bob Teal?")
(autor "Dashiell Hammett")
(bestseller FALSE)
)

([Novela_9788499899275] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 656)
(tipologia_sexual indiferente)
(titulo "El resplandor")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_9788490322802] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 176)
(tipologia_sexual indiferente)
(titulo "Blockade Billy")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_8497931963] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 272)
(tipologia_sexual indiferente)
(titulo "Las cuatro estaciones II")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_9788401338090] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 736)
(tipologia_sexual indiferente)
(titulo "Duma Key")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_9788401338076] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 448)
(tipologia_sexual indiferente)
(titulo "Despues del anochecer")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_9788490326169] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 376)
(tipologia_sexual indiferente)
(titulo "Misery")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_9788490326046] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 128)
(tipologia_sexual indiferente)
(titulo "La batalla de Tull (La Torre Oscura [comic] 8)")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_9788499899558] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 144)
(tipologia_sexual indiferente)
(titulo "La batalla de la colina de Jerico (La Torre Oscura [comic] 5)")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_9788490326091] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 496)
(tipologia_sexual indiferente)
(titulo "Cancion de Susannah (La Torre Oscura VI)")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_8499086306] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 528)
(tipologia_sexual indiferente)
(titulo "Las dos despues de medianoche")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_8499082351] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 160)
(tipologia_sexual indiferente)
(titulo "La Torre Oscura 3 - Traicion")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_9788499899541] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 192)
(tipologia_sexual indiferente)
(titulo "La caida de Gilead (La Torre Oscura [comic] 4)")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_8499083382] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 329)
(tipologia_sexual indiferente)
(titulo "Blaze")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_9788490326237] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 272)
(tipologia_sexual indiferente)
(titulo "Dolores Claiborne")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_9780743280792] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 512)
(tipologia_sexual indiferente)
(titulo "Campeones mundiales al fin! (Faithful)")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_9788490326107] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 496)
(tipologia_sexual indiferente)
(titulo "Las cuatro despues de medianoche")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_9788490326121] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 272)
(tipologia_sexual indiferente)
(titulo "Las cuatro estaciones II")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_9788490326152] of  Novela
(complejidad facil)
(edad adulto)
(genero [Terror])
(paginas 448)
(tipologia_sexual indiferente)
(titulo "La milla verde")
(autor "Stephen King")
(bestseller TRUE)
)

([Novela_9788446019954] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 272)
(tipologia_sexual indiferente)
(titulo "Aventuras de Alicia en el Pais de las Maravillas")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8441420580] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 224)
(tipologia_sexual indiferente)
(titulo "Al otro lado del espejo")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8472810585] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 128)
(tipologia_sexual indiferente)
(titulo "A traves del espejo")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_9786074532760] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 80)
(tipologia_sexual indiferente)
(titulo "Alicia en el pais de las maravillas")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8441421021] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 64)
(tipologia_sexual indiferente)
(titulo "Alicia para ninos")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8473396944] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 328)
(tipologia_sexual indiferente)
(titulo "Alicia anotada")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8496974472] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 69)
(tipologia_sexual indiferente)
(titulo "Alimentar la mente")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_9788499893501] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 384)
(tipologia_sexual indiferente)
(titulo "Alicia en el pais de las maravillas | Alicia a traves del espejo | La caza del Snark")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8468200395] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 216)
(tipologia_sexual indiferente)
(titulo "Alicia en el Pais de las Maravillas, ESO. Material auxiliar")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8498676916] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 256)
(tipologia_sexual indiferente)
(titulo "Un cuento enmaranado y otros problemas de almohada")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_849577609X] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 165)
(tipologia_sexual indiferente)
(titulo "El dia de asueto de un fotografo")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8446032597] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 592)
(tipologia_sexual indiferente)
(titulo "Silvia y Bruno")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8497855612] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 144)
(tipologia_sexual indiferente)
(titulo "Lewis Caroll. Photopoche")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_9780307745149] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 382)
(tipologia_sexual indiferente)
(titulo "Alicia en el pais de las maravillas / Alice's Adventures in Wonderland")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8483106418] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 240)
(tipologia_sexual indiferente)
(titulo "Matematica demente")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_9505812736] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 164)
(tipologia_sexual indiferente)
(titulo "Cuando Alicia Atraveso el Espejo")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_1514250543] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 94)
(tipologia_sexual indiferente)
(titulo "Alicia a Traves Del Espejo")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8495599333] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 192)
(tipologia_sexual indiferente)
(titulo "Un cuento enmaranado")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8435040119] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 366)
(tipologia_sexual indiferente)
(titulo "Alicia; Silvia")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8439282036] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 235)
(tipologia_sexual indiferente)
(titulo "Las Aventuras de Alicia")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_849373960X] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 120)
(tipologia_sexual indiferente)
(titulo "Diario de un viaje a Rusia")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8493739642] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 144)
(tipologia_sexual indiferente)
(titulo "Cartas ineditas a Mabel Amy Burton")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_STANFORD36105038791005] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 213)
(tipologia_sexual indiferente)
(titulo "El riesgo del placer ; La caza del Snark ; Antologia de canciones y nonsense y el capitulo inedito de Alicia")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8420691739] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 526)
(tipologia_sexual indiferente)
(titulo "Estuche - Lewis Carroll")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8466786899] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 312)
(tipologia_sexual indiferente)
(titulo "Alicia en el Pais de las Maravillas / Alice in Wonderland")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_8496867803] of  Novela
(complejidad mediana)
(edad infantil)
(genero [Fantasia])
(paginas 216)
(tipologia_sexual indiferente)
(titulo "A traves del espejo y lo que Alicia encontro alli.")
(autor "Lewis Carroll")
(bestseller FALSE)
)

([Novela_9788420403410] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 920)
(tipologia_sexual indiferente)
(titulo "Cuentos completos de Roald Dahl")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_8498256690] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 20)
(tipologia_sexual indiferente)
(titulo "Charlie y la Fabrica de Chocolate")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_9788420498423] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 248)
(tipologia_sexual indiferente)
(titulo "Matilda")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_9788420411781] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 96)
(tipologia_sexual indiferente)
(titulo "Los mimpins")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_9788420490168] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 184)
(tipologia_sexual indiferente)
(titulo "James y el melocoton gigante")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_8433920863] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 316)
(tipologia_sexual indiferente)
(titulo "Relatos de lo inesperado")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_8420401439] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 202)
(tipologia_sexual indiferente)
(titulo "El gran gigante bonachon")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_8420444707] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 285)
(tipologia_sexual indiferente)
(titulo "Los mejores relatos de Roald Dahl")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_8434856840] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 48)
(tipologia_sexual indiferente)
(titulo "El vicario que hablaba al reves")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_9788420490762] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 96)
(tipologia_sexual indiferente)
(titulo "El Superzorro")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_8433920235] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 206)
(tipologia_sexual indiferente)
(titulo "Historias extraordinarias")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_8420466859] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 72)
(tipologia_sexual indiferente)
(titulo "Agu Trot")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_8420465887] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 94)
(tipologia_sexual indiferente)
(titulo "La jirafa, el pelicano y el mono")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_6073136560] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 248)
(tipologia_sexual indiferente)
(titulo "Las Brujas (the Witches)")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_8420447846] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 80)
(tipologia_sexual indiferente)
(titulo "El dedo magico")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_6070115864] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 188)
(tipologia_sexual indiferente)
(titulo "Danny el campen del mundo / Danny The Champion of the World")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_8481470406] of  Novela
(complejidad dificil)
(edad infantil)
(genero [Fantasia])
(paginas 160)
(tipologia_sexual indiferente)
(titulo "CHARLIE ETA TXOKOLATE-LANTEGIA - ZUBIA")
(autor "Roald Dahl")
(bestseller FALSE)
)

([Novela_844800437X] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 10)
(tipologia_sexual indiferente)
(titulo "¡Ya no llevo panales!")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_9788408040644] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 332)
(tipologia_sexual indiferente)
(titulo "La familia de Teo (ebook interactivo)")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8408100955] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 12)
(tipologia_sexual indiferente)
(titulo "Teo. Los animales")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8408072307] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 25)
(tipologia_sexual indiferente)
(titulo "¿Que hora es, Teo?")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8408100947] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 12)
(tipologia_sexual indiferente)
(titulo "Teo. Los colores")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8408091085] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 14)
(tipologia_sexual indiferente)
(titulo "¿Donde esta Teo?")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8408006029] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 12)
(tipologia_sexual indiferente)
(titulo "Mi primer Teo. Un dia con Teo")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8408060333] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 32)
(tipologia_sexual indiferente)
(titulo "Un pollito en la granja")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8448004825] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 32)
(tipologia_sexual indiferente)
(titulo "¡Vaya lio de animales!")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8408060341] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 32)
(tipologia_sexual indiferente)
(titulo "Juego con mis amigos")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8408118234] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 14)
(tipologia_sexual indiferente)
(titulo "Aprende con Teo. Colores, formas, palabras")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8448004930] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 32)
(tipologia_sexual indiferente)
(titulo "Un paseo con papa")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8448003403] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 12)
(tipologia_sexual indiferente)
(titulo "Teo Descubre Las Profesiones")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8477229260] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 17)
(tipologia_sexual indiferente)
(titulo "Disfraces")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8448002814] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 32)
(tipologia_sexual indiferente)
(titulo "Teo se va de viaje")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8448011627] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 32)
(tipologia_sexual indiferente)
(titulo "Una cabana en el bosque")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8471762560] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 32)
(tipologia_sexual indiferente)
(titulo "Teo En Tren")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8408100025] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 12)
(tipologia_sexual indiferente)
(titulo "¿Donde se esconde Teo?")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8448003489] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 17)
(tipologia_sexual indiferente)
(titulo "Juguetes, Teo Se Viste y Juega")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8471766396] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 32)
(tipologia_sexual indiferente)
(titulo "Teo se disfraza")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8448011546] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 32)
(tipologia_sexual indiferente)
(titulo "De compras en el mercado")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_9788408040620] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 149)
(tipologia_sexual indiferente)
(titulo "Un dia con Teo (ebook interactivo)")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_9788408040934] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 757)
(tipologia_sexual indiferente)
(titulo "El cumpleanos de Teo")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8477225990] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 32)
(tipologia_sexual indiferente)
(titulo "Teo juega en casa")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8408077821] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 8)
(tipologia_sexual indiferente)
(titulo "Adoptamos un perro")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8408088165] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 12)
(tipologia_sexual indiferente)
(titulo "Viste a Teo")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_8408064592] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 40)
(tipologia_sexual indiferente)
(titulo "Teo y la alimentacion")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_840808139X] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 12)
(tipologia_sexual indiferente)
(titulo "Teo juega a ser medico")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_840807363X] of  Novela
(complejidad facil)
(edad infantil)
(genero [Aventuras])
(paginas 12)
(tipologia_sexual indiferente)
(titulo "Teo juega con las herramientas")
(autor "Violeta Denou")
(bestseller FALSE)
)

([Novela_843397310X] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[CienciaFiccion]
[Comedia])
(paginas 296)
(tipologia_sexual indiferente)
(titulo "Guia del autoestopista galactico")
(autor "Douglas Adams")
(bestseller FALSE)
)

([Novela_9788433935922] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[CienciaFiccion]
[Comedia])
(paginas 192)
(tipologia_sexual indiferente)
(titulo "La vida, el universo y todo lo demas")
(autor "Douglas Adams")
(bestseller FALSE)
)

([Novela_8433973282] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[CienciaFiccion]
[Comedia])
(paginas 203)
(tipologia_sexual indiferente)
(titulo "El restaurante del fin del mundo")
(autor "Douglas Adams")
(bestseller FALSE)
)

([Novela_843397680X] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[CienciaFiccion]
[Comedia])
(paginas 160)
(tipologia_sexual indiferente)
(titulo "Hasta luego, y gracias por el pescado")
(autor "Douglas Adams")
(bestseller FALSE)
)

([Novela_9789682323973] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[CienciaFiccion]
[Comedia])
(paginas 221)
(tipologia_sexual indiferente)
(titulo "Democracia radical")
(autor "Douglas Adams")
(bestseller FALSE)
)

([Novela_UTEXAS059173006307077] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[CienciaFiccion]
[Comedia])
(paginas 422)
(tipologia_sexual indiferente)
(titulo "Memoria Critica")
(autor "Douglas Adams")
(bestseller FALSE)
)

([Novela_UCALB2791455] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[CienciaFiccion]
[Comedia])
(paginas 113)
(tipologia_sexual indiferente)
(titulo "Los problemas de la comunicacion publica en el Peru")
(autor "Douglas Adams")
(bestseller FALSE)
)

([Novela_UTEXAS059173023446852] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[CienciaFiccion]
[Comedia])
(paginas 325)
(tipologia_sexual indiferente)
(titulo "Promoviendo la democracia")
(autor "Douglas Adams")
(bestseller FALSE)
)

([Novela_0373684177] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[CienciaFiccion]
[Comedia])
(paginas 156)
(tipologia_sexual indiferente)
(titulo "Angel de Amor")
(autor "Douglas Adams")
(bestseller FALSE)
)

([Novela_UTEXAS059172131566371] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[CienciaFiccion]
[Comedia])
(paginas 128)
(tipologia_sexual indiferente)
(titulo "Pintura venezolana en la coleccion de La Casona")
(autor "Douglas Adams")
(bestseller FALSE)
)

([Novela_UCSC32106018072014] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[CienciaFiccion]
[Comedia])
(paginas 394)
(tipologia_sexual indiferente)
(titulo "Globalizacion y drogas")
(autor "Douglas Adams")
(bestseller FALSE)
)

([Novela_UTEXAS059173024153226] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[CienciaFiccion]
[Comedia])
(paginas 334)
(tipologia_sexual indiferente)
(titulo "Teorias del desarrollo nacional")
(autor "Douglas Adams")
(bestseller FALSE)
)

([Novela_UTEXAS059173018611520] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[CienciaFiccion]
[Comedia])
(paginas 236)
(tipologia_sexual indiferente)
(titulo "Tilantongo")
(autor "Douglas Adams")
(bestseller FALSE)
)

([Novela_STANFORD36105008548948] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[CienciaFiccion]
[Comedia])
(paginas 397)
(tipologia_sexual indiferente)
(titulo "Los Ausentes")
(autor "Douglas Adams")
(bestseller FALSE)
)

([Novela_8401336112] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[Fantasia]
[Comedia])
(paginas 365)
(tipologia_sexual indiferente)
(titulo "Papa Puerco/ Hogfather")
(autor "Terry Pratchett")
(bestseller TRUE)
)

([Novela_9788499086439] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[Fantasia]
[Comedia])
(paginas 496)
(tipologia_sexual indiferente)
(titulo "La luz fantastica (Mundodisco 2)")
(autor "Terry Pratchett")
(bestseller TRUE)
)

([Novela_9788499086460] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[Fantasia]
[Comedia])
(paginas 448)
(tipologia_sexual indiferente)
(titulo "Mort (Mundodisco 4)")
(autor "Terry Pratchett")
(bestseller TRUE)
)

([Novela_9788401353147] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[Fantasia]
[Comedia])
(paginas 400)
(tipologia_sexual indiferente)
(titulo "Dinero a mansalva (Mundodisco 36)")
(autor "Terry Pratchett")
(bestseller TRUE)
)

([Novela_9788401354465] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[Fantasia]
[Comedia])
(paginas 392)
(tipologia_sexual indiferente)
(titulo "La verdad (Mundodisco 25)")
(autor "Terry Pratchett")
(bestseller TRUE)
)

([Novela_9788499084374] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[Fantasia]
[Comedia])
(paginas 520)
(tipologia_sexual indiferente)
(titulo "Rechicero (Mundodisco 5)")
(autor "Terry Pratchett")
(bestseller TRUE)
)

([Novela_8401336988] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[Fantasia]
[Comedia])
(paginas 392)
(tipologia_sexual indiferente)
(titulo "La verdad")
(autor "Terry Pratchett")
(bestseller TRUE)
)

([Novela_9788499086446] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[Fantasia]
[Comedia])
(paginas 267)
(tipologia_sexual indiferente)
(titulo "Ritos iguales (Mundodisco 3)")
(autor "Terry Pratchett")
(bestseller TRUE)
)

([Novela_9788401353765] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[Fantasia]
[Comedia])
(paginas 464)
(tipologia_sexual indiferente)
(titulo "El atletico invisible (Mundodisco 37)")
(autor "Terry Pratchett")
(bestseller TRUE)
)

([Novela_9788415831174] of  Novela
(complejidad facil)
(edad adulto)
(genero 
[Fantasia]
[Comedia])
(paginas 416)
(tipologia_sexual indiferente)
(titulo "Me vestire de medianoche (Mundodisco 38)")
(autor "Terry Pratchett")
(bestseller TRUE)
)

([Novela_9788441422407] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 272)
(tipologia_sexual indiferente)
(titulo "Narraciones extraordinarias")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_9580467447] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 110)
(tipologia_sexual indiferente)
(titulo "El gato negro y otros cuentos")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_8446022117] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 504)
(tipologia_sexual indiferente)
(titulo "Historias extraordinarias")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_9788026810049] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 1230)
(tipologia_sexual indiferente)
(titulo "Coleccion integral de Edgar Allan Poe")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_9788026802129] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 350)
(tipologia_sexual indiferente)
(titulo "Los mejores cuentos de Edgar Allan Poe (con indice activo)")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_8478448543] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 256)
(tipologia_sexual indiferente)
(titulo "Cuentos de terror y misterio")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_9783734787454] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 24)
(tipologia_sexual indiferente)
(titulo "Ligeia")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_9681903552] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 175)
(tipologia_sexual indiferente)
(titulo "Cuentos Del Terror / Tales of Terror")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_8441417288] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 100)
(tipologia_sexual indiferente)
(titulo "La incomparable aventura de Hans Pfaall")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_9783734787461] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 17)
(tipologia_sexual indiferente)
(titulo "Manuscrito hallado en una botella")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_9783734787409] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 8)
(tipologia_sexual indiferente)
(titulo "El retrato oval")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_9501112829] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 71)
(tipologia_sexual indiferente)
(titulo "Clasicos de terror/ Horror Classics")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_9789635238439] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 4)
(tipologia_sexual indiferente)
(titulo "El corazon delator")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_8496509958] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 116)
(tipologia_sexual indiferente)
(titulo "El gato negro. Y otros relatos de terror")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_8441417296] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 248)
(tipologia_sexual indiferente)
(titulo "Narracion de Arthur Gordon Pym")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_8437625904] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 350)
(tipologia_sexual indiferente)
(titulo "Relatos")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_6074154309] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 446)
(tipologia_sexual indiferente)
(titulo "Lo siniestro, el horror y su vida Edgar Allan Poe")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_8481094935] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 488)
(tipologia_sexual indiferente)
(titulo "Todos los cuentos I")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_8448829395] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 32)
(tipologia_sexual indiferente)
(titulo "Chevalier Auguste Dupin y la carta robada")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_9501112845] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 70)
(tipologia_sexual indiferente)
(titulo "Clasicos policiales")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_8483086034] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 73)
(tipologia_sexual indiferente)
(titulo "El escarabajo de oro")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_UTEXAS059173023651126] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 86)
(tipologia_sexual indiferente)
(titulo "La mascara de la muerte roja y otros cuentos")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_8497934008] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 782)
(tipologia_sexual indiferente)
(titulo "Cuentos")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_9788497405492] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 334)
(tipologia_sexual indiferente)
(titulo "La historia de Arthur Gordon Pym")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_847702541X] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 280)
(tipologia_sexual indiferente)
(titulo "El relato de Arthur Gordon Pym")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_OCLC457936286] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 246)
(tipologia_sexual indiferente)
(titulo "Cuentos clasicos del norte, primera serie, por Edgar Allan Poe, traduccion de Carmen Torres Calderon de Pinillos")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_8441416443] of  Novela
(complejidad mediana)
(edad adulto)
(genero [Terror])
(paginas 136)
(tipologia_sexual indiferente)
(titulo "El demonio de la perversidad")
(autor "Edgar Allan Poe")
(bestseller FALSE)
)

([Novela_1514148110] of  Novela
(complejidad facil)
(edad adulto)
(genero [Aventuras])
(paginas 282)
(tipologia_sexual indiferente)
(titulo "La Conspiracion: Dan Brown (Novela de Suspenso)")
(autor "Dan Brown")
(bestseller TRUE)
)

([Novela_0345806492] of  Novela
(complejidad facil)
(edad adulto)
(genero [Aventuras])
(paginas 576)
(tipologia_sexual indiferente)
(titulo "Inferno: En Espanol")
(autor "Dan Brown")
(bestseller TRUE)
)

([Novela_8496924696] of  Novela
(complejidad facil)
(edad adulto)
(genero [Aventuras])
(paginas 320)
(tipologia_sexual indiferente)
(titulo "Las Mentiras de la Ciencia")
(autor "Dan Brown")
(bestseller TRUE)
)

([Novela_9781633395770] of  Novela
(complejidad facil)
(edad adulto)
(genero [Aventuras])
(paginas 255)
(tipologia_sexual indiferente)
(titulo "35 Fabulosas Recetas Que Quisieras Que Tu Madre Cocinara")
(autor "Dan Brown")
(bestseller TRUE)
)

([Novela_8496746364] of  Novela
(complejidad facil)
(edad adulto)
(genero [Aventuras])
(paginas 576)
(tipologia_sexual indiferente)
(titulo "El Apostol de Satan")
(autor "Dan Brown")
(bestseller TRUE)
)

([Novela_8477227977] of  Novela
(complejidad facil)
(edad adulto)
(genero [Aventuras])
(paginas 360)
(tipologia_sexual indiferente)
(titulo "Dracula Insolito")
(autor "Dan Brown")
(bestseller TRUE)
)

([Novela_8484603547] of  Novela
(complejidad facil)
(edad adulto)
(genero [Aventuras])
(paginas 652)
(tipologia_sexual indiferente)
(titulo "Toda la verdad sobre el Codigo Da Vinci")
(autor "Dan Brown")
(bestseller TRUE)
)

([Novela_8484607437] of  Novela
(complejidad facil)
(edad adulto)
(genero [Aventuras])
(paginas 576)
(tipologia_sexual indiferente)
(titulo "Toda la verdad sobre Angeles y demonios")
(autor "Dan Brown")
(bestseller TRUE)
)


([Novela_8497594320] of  Novela
(complejidad dificil)
(edad adulto)
(genero 
[CienciaFiccion]
[Fantasia])
(paginas 544)
(tipologia_sexual indiferente)
(titulo "Hijos de Dune")
(autor "Frank Herbert")
(bestseller FALSE)
)

([Novela_8497597702] of  Novela
(complejidad dificil)
(edad adulto)
(genero 
[CienciaFiccion]
[Fantasia])
(paginas 638)
(tipologia_sexual indiferente)
(titulo "Casa capitular Dune")
(autor "Frank Herbert")
(bestseller FALSE)
)

([Novela_1517548489] of  Novela
(complejidad dificil)
(edad adulto)
(genero 
[CienciaFiccion]
[Fantasia])
(paginas 52)
(tipologia_sexual indiferente)
(titulo "Operacion Almiar")
(autor "Frank Herbert")
(bestseller FALSE)
)

([Novela_1400059429] of  Novela
(complejidad dificil)
(edad adulto)
(genero 
[CienciaFiccion]
[Fantasia])
(paginas 640)
(tipologia_sexual indiferente)
(titulo "Dune")
(autor "Frank Herbert")
(bestseller FALSE)
)

([Novela_UOM39076006262906] of  Novela
(complejidad dificil)
(edad adulto)
(genero 
[CienciaFiccion]
[Fantasia])
(paginas 1278)
(tipologia_sexual indiferente)
(titulo "Obras escogidas")
(autor "Frank Herbert")
(bestseller FALSE)
)

([Novela_STANFORD36105047916411] of  Novela
(complejidad dificil)
(edad adulto)
(genero 
[CienciaFiccion]
[Fantasia])
(paginas 278)
(tipologia_sexual indiferente)
(titulo "City block")
(autor "Frank Herbert")
(bestseller FALSE)
)

([Novela_UTEXAS059173024237280] of  Novela
(complejidad dificil)
(edad adulto)
(genero 
[CienciaFiccion]
[Fantasia])
(paginas 476)
(tipologia_sexual indiferente)
(titulo "Vivencias de un Hombre")
(autor "Frank Herbert")
(bestseller FALSE)
)

([Novela_9788492695379] of  Novela
(complejidad dificil)
(edad adulto)
(genero 
[CienciaFiccion]
[Fantasia])
(paginas 296)
(tipologia_sexual indiferente)
(titulo "El profesor")
(autor "Frank Herbert")
(bestseller FALSE)
)

([Novela_8400092406] of  Novela
(complejidad dificil)
(edad adulto)
(genero 
[CienciaFiccion]
[Fantasia])
(paginas 723)
(tipologia_sexual indiferente)
(titulo "Historia de la Republica Dominicana")
(autor "Frank Herbert")
(bestseller FALSE)
)

([Novela_8485436504] of  Novela
(complejidad dificil)
(edad adulto)
(genero 
[CienciaFiccion]
[Fantasia])
(paginas 204)
(tipologia_sexual indiferente)
(titulo "El Acuerdo de los euromisiles de Reikiavik a Washington")
(autor "Frank Herbert")
(bestseller FALSE)
)

([Novela_UCALB3334613] of  Novela
(complejidad dificil)
(edad adulto)
(genero 
[CienciaFiccion]
[Fantasia])
(paginas 386)
(tipologia_sexual indiferente)
(titulo "En la selva americana, 1925-1936")
(autor "Frank Herbert")
(bestseller FALSE)
)






;;; CLOSE INSTANCIAS
)

;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------                                   TEMPLATES                                                       ----------                                                              TEMPLATES
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;ibamos a usarlo para guardar sexo y edad juntos pero luego nos era mas problema que mejora, pero lo dejamos con persona sexo al menos
(deftemplate  persona   "sexe de la persona a qui va dirigida el llibre"
    (slot sexo  (type STRING))
    ;(slot edad  (type INTEGER))
)

;aqui tenemos este template que sirve para crear tantos hechos como instancias de novela
;y asi podemos puntuarlas en funcion de las respuestas y la inferencia
(deftemplate  valoracionNovela   "novela tiene puntuacion"
    (slot novela  (type INSTANCE))
    (slot puntuacion  (type INTEGER))
	(slot sexo  (type SYMBOL) (default FALSE))
	(slot edad  (type SYMBOL) (default FALSE))
	(slot genero  (type SYMBOL) (default FALSE))
	(slot dificultad  (type SYMBOL) (default FALSE))
	(slot extension  (type SYMBOL) (default FALSE))
	(slot autor (type SYMBOL) (default FALSE))
	(slot bestseller (type SYMBOL) (default FALSE));;bool para ver si hemos valorado el libro según si es bestseller o no
    (slot esBestseller (type SYMBOL) (default FALSE));;shortcut para saber si es bestseller
)




;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------                                   MENSAJES                                                        ----------                                                              MENSAJES
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;;; Mensajes a las clases 

;por si queremos imprimir el titulo de la novela o nombre del genero
(defmessage-handler Novela imprime primary ()
        (printout t ?self:titulo crlf) 
)

(defmessage-handler Genero imprime primary ()
        (printout t ?self:nombre crlf) 
)





;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------                                   FUNCIONES                                                       ----------                                                              EXTRAS
;;;-------------------------------------------------------------------------------------------------------------------------------------------------------

;;; Funcion para hacer una pregunta general que admite cualquier tipo de respuesta
(deffunction pregunta-general (?pregunta) 
        (format t "%s" ?pregunta) 
        (bind ?respuesta (read)) 
        ?respuesta
)

;;; Funcion para hacer una pregunta con respuesta en un rango dado
(deffunction pregunta-numerica (?pregunta ?rangini ?rangfi) 
        (format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi) 
        (bind ?respuesta (read)) 
        (while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do 
                (format t "Â¿%s? [%d, %d] " ?pregunta ?rangini ?rangfi) 
                (bind ?respuesta (read)) 
        ) 
        ?respuesta
)

;;; Funcion para hacer una pregunta con un conjunto definido de valores de repuesta    
(deffunction pregunta-lista (?pregunta $?valores_posibles) 
        (format t "%s" ?pregunta)  
        (bind ?resposta (readline))  
        (bind ?res (str-explode ?resposta))   
        ?res
)

;funcion para preguntar con unos valores predefinidos en los que la respuesta ha de ser uno de ellos
(deffunction pregunta (?pregunta $?valores-permitidos)
	 (progn$
		(?var ?valores-permitidos)
		(lowcase ?var))
	 (format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
	 (bind ?respuesta (read))
	 (while (not (member (lowcase ?respuesta) ?valores-permitidos)) do
		(format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
		(bind ?respuesta (read))
	 )
	 ?respuesta
 )



 ;Funcion para preguntar rapidamente si o no
(deffunction pregunta-sino (?pregunta)
	;(format t "%s" ?pregunta)
	(bind ?respuesta (pregunta ?pregunta si no s n))
	(if (or (eq (lowcase ?respuesta) si) (eq (lowcase ?respuesta) s))
		then TRUE
		else FALSE
	 )
)





;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------                                    MAIN                                                   ----------                                                              MAIN
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; Este es el modulo principal, en este se hara la primera pregunta a partir de la cual seguira todo el proceso

(defmodule MAIN (export ?ALL))

(defrule comienzo "regla inicial"
        (initial-fact)
        =>
        (printout t crlf)
        (printout t "--------------------------------------------------------------" crlf)
        (printout t "------------- BookAffinity - Recomendador de libros ----------" crlf)
        (printout t "--------------------------------------------------------------" crlf)
        (printout t crlf)
        (assert (nueva_recomendacion))             
)

(defrule recomendacion "regla para preguntar el genero preferido o si no te importa"
    (nueva_recomendacion)
    =>
        (printout t crlf)
        (printout t "1. Indiferente" crlf)
        (printout t "2. Ciencia Ficcion" crlf)
        (printout t "3. Terror" crlf)
        (printout t "4. Narrativa" crlf)
        (printout t "5. Policiaca" crlf) 
        (printout t "6. Fantasia" crlf) 
        (printout t "7. Romantica" crlf)    
        (printout t "8. Aventuras" crlf)   
        (printout t "9. Drama" crlf)    
	(bind ?respuesta (pregunta-numerica "Que genero prefieres: " 1 9))
	(if (eq ?respuesta 1)
            then 
			(bind ?lista (create$ 
				"Ciencia ficcion" Terror Policiaca Fantasia Clasica Contemporanea))
			(assert (genero ?lista))
        else (if (eq ?respuesta 2)
            then (assert (genero "Ciencia ficcion"))
        else (if (eq ?respuesta 3)
            then (assert (genero Terror))
        else (if (eq ?respuesta 4)
            then (assert (genero Narrativa))
        else (if (eq ?respuesta 5)
            then (assert (genero Policiaca))  
        else (if (eq ?respuesta 6)
            then (assert (genero Fantasia))
        else (if (eq ?respuesta 7)
            then (assert (genero Romantica))
        else (if (eq ?respuesta 8)
            then (assert (genero Aventuras))
        else (if (eq ?respuesta 9)
            then (assert (genero Drama))
        )))))))))
        (focus hacer_preguntas)
)

;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------                           MODULO DE PREGUNTAS                                             ----------                                                      MODULO DE PREGUNTAS
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; En este se le haran las preguntas al estudiantes 
;; para obtener la informacion de sus restricciones y/o preferencias 

(defmodule hacer_preguntas
    (import MAIN ?ALL)
    (export ?ALL)
)


;en el caso de que prefieras narrativa, escoge subgenero
(defrule preguntaGeneroNarrativa "regla per obtenir el subgenere de Narrativa"
    (declare (salience 2))
	(genero Narrativa)
    =>
    (bind ?nombre (pregunta-general "Que genero de Narrativa (Clasica o Contemporanea): "))
        (while (not (any-instancep ((?genero Narrativa)) (eq (str-compare ?genero:nombre ?nombre) 0))) 
                do
                        (printout t "No existe el genero." crlf)
                        (bind ?nombre (pregunta-general "Que genero de Narrativa: ")) 
        )
    (assert (Narrativa ?nombre))       
)

(defrule preguntaSexo "regla para prguntar el sexe"
	(declare (salience 1))
	(not (sexo))
    =>
	(printout t crlf)
	(printout t "1. Masculino" crlf)
	(printout t "2. Femenino" crlf)
	(printout t "3. Neutro / indiferente" crlf)
    (bind ?sexo (pregunta-numerica "Que estilo prefieres: " 1 3))
	(switch ?sexo
			(case 1 then (assert (persona (sexo "masculino"))))
			(case 2 then (assert (persona (sexo "femenino"))))
			(case 3 then (assert (persona (sexo "indiferente"))))
    )
    (assert (sexo))    
)


(defrule preguntaEdad "regla para preguntar l'edat"
    (not (edad))
    =>
    (bind ?edad (pregunta-numerica "Cuantos años tienes:" 0 120))
        (if (< ?edad 11) 
                then (assert(edad infantil))
        else (if (< ?edad 18) 
                then (assert(edad juvenil))
        else (assert(edad adulto))
        )) 
)


;esta pregunta es relativa porque despues haremos inferencia en funcion de esta respuesta y la edad
(defrule preguntaPaginas "regla para prguntar paginas"
	(edad ?edadVal)
	(not (paginas))
    =>
	(bind ?long (pregunta "Que extension prefieres: " corto medio largo))
    (assert (largo ?long)) 
    (assert (paginas))    
)



;aqui tenemos un algoritmo para decir con que comodidad suele leer para decidir la complejidad del libro
(defrule preguntaSitios "regla para prguntar los sitios donde lee"
    (not(sitios))
    ;(genero ?genero)
    =>
	(bind ?comodidad 2) ;comodidad es como decir coste, + alto es peor
	;inicial es 2 (me sirve para las combinaciones), si lee en alguno de los 2 primeros sitios, coste mejora
    (bind ?aki (pregunta-sino "Lees en casa (en silencio, como en la cama), bibliotecas u otros sitios silenciosos?"))
	(if (neq ?aki FALSE) then (bind ?comodidad 0))
	
	(bind ?aki2 (pregunta-sino "Lees en un parque o sitios del estilo, con ruido pero poco?"))
	(if (neq ?aki2 FALSE) then (bind ?comodidad 1))
	
	(bind ?aki3 (pregunta-sino "Lees en las salas de espera?"))
	(if (neq ?aki3 FALSE) then (bind ?comodidad (+ ?comodidad 1))) 
	;si solo lee en estos sitios, malo, si al menos lee tmbn en trankilos, menos coste
	
	(bind ?aki4 (pregunta-sino "Lees con ruido (como la tele), o en transporte publico?"))
	(if (neq ?aki4 FALSE) then (bind ?comodidad (+ ?comodidad 2))) 
	;si solo lee en estos sitios, malo, si al menos lee tmbn en trankilos, menos coste (igual k el anterior)
	(assert(sitio ?comodidad))
        (assert(sitios))    
)


;preguntar si tiene algun autor que prefiera
(defrule preguntaAutorSN "regla para prguntar si prefiere algun autor"
    (not(autorPrefSN))
    =>
    (bind ?autorSN (pregunta-sino "Tienes algun autor preferido?"))
	(if (neq ?autorSN FALSE) then (assert(autorS)))  
	(assert(autorPrefSN))    
)


;aqui, si ha dicho que si, le preguntamos que autor
(defrule preguntaAutor "regla para prguntar que autor prefiere"
    (not(autorPref))
	(autorS)
    =>
    (bind ?autorSN (pregunta-general "Que autor prefieres?"))
	(assert(autor ?autorSN))  
	(assert(autorPref))    
)

;preguntar si tiene algun autor que prefiera
(defrule preguntaBestseller "regla para preguntar si prefiere bestsellers"
    (not(bestsellers))
    =>
    (bind ?leeBestsellers (pregunta-sino "¿Sueles leer bestsellers?"))
        (assert(bestsellers ?leeBestsellers))    
)


;esto nos ayudara a decidir la complejidad del libro
(defrule preguntaHoras "regla para prguntar las horas que lee"
	(declare (salience -10))
    (not(horass))
    =>
    (bind ?horas (pregunta-numerica "Cuantas horas lees a la semana?" 0 70))
	(assert(horas ?horas))
        (assert(horass))
        (focus inferir_datos)     
)







;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					MODULO DE INFERENCIAS DE DATOS				---------- 				MODULO DE INFERENCIAS DE DATOS					 		
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; En este modulo se hace la abstraccion de los datos obtenidos del modulo de pregunatas

(defmodule inferir_datos
    (import MAIN ?ALL)
    (import hacer_preguntas ?ALL)
    (export ?ALL)
)

(defrule anadirComplejidad "en funcion de las respuestas de las horas que lee y la comodidad decidimos la complejidad"
	(not (infComplejidad))
	(horas ?horas)
	(sitio ?comodidad)
	=>
	(if (and (< ?horas 3) (> ?comodidad 1))
		then (assert(complejidad facil))
	else (if (or (< ?horas 2) (> ?comodidad 2))
		then (assert(complejidad facil)))
	else (if (or (and (< ?horas 3) (> ?horas 1)) (> ?comodidad 1))
		then (assert(complejidad mediana)))
	else (if (and (> ?horas 5) (< ?comodidad 2))
		then (assert(complejidad dificil)))
	)  
	else (assert(complejidad mediana))
	(assert (infComplejidad))
)


(defrule decidirExtension "decidimos la extension. Los rangos se solapan para que simule algo analogico en vez de ser a saltos"
	(not (infExtens))
	(edad ?edadVal)
	(largo ?extension)
	=>
	(if (eq(str-compare ?edadVal infantil) 0) 
			then (if (eq ?extension corto) then
				(assert (extensionMax 15)) (assert (extensionMin 0))
			else (if (eq ?extension medio) then
				(assert (extensionMax 35)) (assert (extensionMin 12))
			else (if (eq ?extension largo) then
				(assert (extensionMax 100001)) (assert (extensionMin 30))
			) ) )
	
	else (if (eq(str-compare ?edadVal juvenil) 0) 
			then (if (eq ?extension corto) then
				(assert (extensionMax 110)) (assert (extensionMin 0))
			else (if (eq ?extension medio) then
				(assert (extensionMax 220)) (assert (extensionMin 100))
			else (if (eq ?extension largo) then
				(assert (extensionMax 100002)) (assert (extensionMin 200))
			) ) ) )
			
	else (if (eq(str-compare ?edadVal adulto) 0) 
			then (if (eq ?extension corto) then
				(assert (extensionMax 150)) (assert (extensionMin 0))
			else (if (eq ?extension medio) then
				(assert (extensionMax 280)) (assert (extensionMin 130))
			else (if (eq ?extension largo) then
				(assert (extensionMax 100003)) (assert (extensionMin 250))
			) ) ) )
	)
	(assert (infExtens))

)



(defrule crearLibros "creamos hechos de los libros para puntuarlos"
        (declare (salience 2))
	?novela <- (object (is-a Novela)(bestseller ?best) )
        =>
        (assert (valoracionNovela (novela ?novela)(puntuacion 0)(esBestseller ?best)))
)


(defrule next "en funcion de las respuestas de antes hacemos inferencia"
        (declare (salience -1))
        => (focus puntuar_libros) 
)
    








;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  					MODULO DE PUNTUAR LIBROS				---------- 				MODULO DE PUNTUAR LIBROS					 		
;;;------------------------------------------------------------------------------------------------------------------------------------------------------


(defmodule puntuar_libros
    (import MAIN ?ALL)
    (import hacer_preguntas ?ALL)
	(import inferir_datos ?ALL)
    (export ?ALL)
)


(defrule setValorLibroGenero "en funcion de las respuestas puntuamos"
        (genero ?genero)
        ?vn <- (valoracionNovela (novela ?nov)(puntuacion ?punt)(genero FALSE))
	=>        
		(bind ?gen (nth$ 1 (send ?nov get-genero)))
		(bind $?genNom (send (instance-address * ?gen) get-nombre))
        (if(eq (str-compare ?genero ?genNom) 0) then (bind ?punt (+ ?punt 3)))
        (modify ?vn (novela ?nov)(puntuacion ?punt)(genero TRUE))
)


;en el caso de que hayamos dicho genero indiferente, tendremos lista de generos
(defrule setValorLibroGenero2 "en funcion de las respuestas puntuamos"
        (genero $?genero)
        ?vn <- (valoracionNovela (novela ?nov)(puntuacion ?punt)(genero FALSE))
	=>        
		(bind ?gen (nth$ 1 (send ?nov get-genero)))
		(bind $?genNom (send (instance-address * ?gen) get-nombre))
        (if(eq (str-compare (nth$ 1 ?genero) ?genNom) 0) then (bind ?punt (+ ?punt 1))) ;aqui solo sumamos 1 porque al ser genero indiferente, no le damos tanta importancia
        (modify ?vn (novela ?nov)(puntuacion ?punt)(genero TRUE))     
)


(defrule setValorLibroEdad "en funcion de las respuestas puntuamos"
        (edad ?edad)
        ?vn <- (valoracionNovela (novela ?nov)(puntuacion ?punt)(edad FALSE))
	=>        
		(bind ?age (send ?nov get-edad))
        (if(eq (str-compare ?edad ?age) 0) then (bind ?punt (+ ?punt 2)) (modify ?vn (novela ?nov)(puntuacion ?punt)(edad TRUE))
		else (if (and(not (eq ?edad infantil) ) (eq ?age infantil)) then retract ?vn)
		else (if (and(not (eq ?age infantil) ) (eq ?edad infantil)) then retract ?vn)
		else (modify ?vn (novela ?nov)(puntuacion ?punt)(edad TRUE)))
               
)		;else (bind ?punt (- ?punt 1)))



(defrule setValorLibroComplejidad "en funcion de las respuestas puntuamos"
        (complejidad ?dificil)
        ?vn <- (valoracionNovela (novela ?nov)(puntuacion ?punt)(dificultad FALSE))
	=>        
		(bind ?dif (send ?nov get-complejidad))
        (if(eq (str-compare ?dificil ?dif) 0) then (bind ?punt (+ ?punt 1)))
        (modify ?vn (novela ?nov)(puntuacion ?punt)(dificultad TRUE))       
)


(defrule setValorLibroSexo "en funcion de las respuestas puntuamos"
        (persona (sexo ?sexo))
        ?vn <- (valoracionNovela (novela ?nov)(puntuacion ?punt)(sexo FALSE))
	=>        
		(bind ?sex (send ?nov get-tipologia_sexual))
        (if(eq (str-compare ?sexo ?sex) 0) then (bind ?punt (+ ?punt 2)))
        (modify ?vn (novela ?nov)(puntuacion ?punt)(sexo TRUE))       
)

(defrule setValorLibroBestseller "en funcion de las respuestas puntuamos"
        (bestseller ?bestseller)
        ?vn <- (valoracionNovela (novela ?nov)(puntuacion ?punt)(bestseller FALSE))
        =>        
        (bind ?bs (send ?nov get-bestseller))
        (if(eq ?bestseller ?bs) then (bind ?punt (+ ?punt 1)))
        (modify ?vn (novela ?nov)(puntuacion ?punt)(bestseller TRUE))       
)


;escogemos un rango de paginas para decidir si sumamos puntos o no
(defrule setValorLibroExtension "en funcion de las respuestas puntuamos"
        (extensionMax ?pagsMax)
		(extensionMin ?pagsMin)
        ?vn <- (valoracionNovela (novela ?nov)(puntuacion ?punt)(extension FALSE))
	=>        
		(bind ?paginas (send ?nov get-paginas))
		(if (and (> ?pagsMax ?paginas) (< ?pagsMin ?paginas)) then (bind ?punt (+ ?punt 1)))
        (modify ?vn (novela ?nov)(puntuacion ?punt)(extension TRUE))       
)


(defrule setValorLibroAutor "en funcion de las respuestas puntuamos"
        (autor ?autor)
        ?vn <- (valoracionNovela (novela ?nov)(puntuacion ?punt)(autor FALSE))
	=>        
		(bind ?aut (send ?nov get-autor))
        (if(eq ?autor ?aut) then (bind ?punt (+ ?punt 3)))
        (modify ?vn (novela ?nov)(puntuacion ?punt)(autor TRUE))       
)


(defrule next2 "en funcion de las respuestas de antes hacemos inferencia"
        (declare (salience -1))
        => (focus recomendaciones) 
)











;;;------------------------------------------------------------------------------------------------------------------------------------------------------
;;;----------  				MODULO DE RECOMENDACIONES		---------- 				MODULO DE RECOMENDACIONES		
;;;------------------------------------------------------------------------------------------------------------------------------------------------------

;; En este modulo se obtendran todas las solcuiones y se mostrara la solcuion
;; si hay mas de 3 solcuiones se mostraran las 3 con valor cuantitativo mas alto y 
;; si hay menos pues se mostraran todas  

(defmodule recomendaciones
	(import MAIN ?ALL) 
	(import hacer_preguntas ?ALL)
	(import inferir_datos ?ALL) 
	(import puntuar_libros ?ALL)
	(export ?ALL)
)

(defrule calcula-max "devuelve el siguiente libro con mas puntuacion"
	?vn <- (valoracionNovela (novela ?nov)(puntuacion ?punt))
	(test (> ?punt 3))
	 (forall (valoracionNovela (novela ?nov2&~?nov)(puntuacion ?punt2)) (test (>= ?punt ?punt2)))
	 ?ps <- (pos ?x)
	 (test (< ?x 3))
	 =>
	 (printout t "Te recomendamos este libro. Titulo: " (send ?nov get-titulo) ", de " (send ?nov get-autor) " (Puntuacion: " ?punt ")" crlf)
	 (bind ?leido (pregunta-sino "Lo has leido?"))
	 (if (eq ?leido FALSE) then  
		 (bind ?x (+ ?x 1))
		 (retract ?ps) ;nos cargamos el hecho de posicion y lo volvemos a meter porque funcionaba mal el modify
		 (assert (pos ?x))
		 ;;(printout t "puntuacion: " ?punt crlf)
		 (retract ?vn)
	 else (retract ?vn))
)

(defrule obtenerRecomendaciones "regla para obtener todas las recomendaciones que ha conseguido el sistema"
	(declare (salience 10))
	(not (pos ?))
	=> 
	(assert (pos 0))
	(printout t crlf)
	(printout t "Todas las posibles recomendaciones: " crlf)
	(printout t "----------------------------------- " crlf)
	(printout t crlf)
	(printout t "------------------------  LIBROS RECOMENDADOS -----------------------" crlf)
	(printout t crlf)
) 


;aqui recomendamos bestSellers
(defrule noHayRecomendaciones  "regla para saber que no se obtuvieron recomendacioness"
	(declare (salience -1))
	?ps <- (pos ?x)
	(test (< ?x 3))
	?nov <- (valoracionNovela (novela ?novela)(esBestseller TRUE))
	=>	
	(printout t "Te recomendamos el bestseller con Titulo: " (send ?novela get-titulo) crlf)
	(bind ?leido (pregunta-sino "¿Lo has leido?"))
	 (if (eq ?leido FALSE) then  
		 (bind ?x (+ ?x 1))
		 (retract ?ps) ;nos cargamos el hecho de posicion y lo volvemos a meter porque funcionaba mal el modify
		 (assert (pos ?x))
		 (retract ?nov) ;asi hacemos que no vuelva a recomendar el mismo bestseller
	else (retract ?nov))

)

(defrule noHayRecomendacionesNiBests  "regla para saber que no se obtuvieron recomendacioness"
	(declare (salience -2))
	(pos ?x)
	(test (< ?x 3))
	=>	
	(printout t "No tenemos mas libros para ti, lo siento" crlf)
)








