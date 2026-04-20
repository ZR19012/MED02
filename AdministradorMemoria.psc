SubProceso InicializarRAM(MarcoOcupado, MarcoPagina)
    Para i <- 1 Hasta 4 Hacer
        MarcoOcupado[i] <- 0
        MarcoPagina[i] <- -1
    FinPara
FinSubProceso

SubProceso MostrarMapaBits(MarcoOcupado)
    Escribir "Mapa de bits: " Sin Saltar
    Para i <- 1 Hasta 4 Hacer
        Escribir MarcoOcupado[i], " " Sin Saltar
    FinPara
    Escribir ""
FinSubProceso


Funcion pos <- BuscarPagina(pag, Marcos, Ocupado)
    pos <- -1
    Para i <- 1 Hasta 3 Hacer
        Si Ocupado[i] = 1 Y Marcos[i] = pag Entonces
            pos <- i
        FinSi
    FinPara
FinFuncion


Funcion fallos <- SimularFIFO(Referencias)
    Dimension Marcos[3]
    Dimension Ocupado[3]
	
    Para i <- 1 Hasta 3 Hacer
        Marcos[i] <- -1
        Ocupado[i] <- 0
    FinPara
	
    fallos <- 0
    puntero <- 1
	
    Para t <- 1 Hasta 12 Hacer
        pag <- Referencias[t]
		
        Si BuscarPagina(pag, Marcos, Ocupado) = -1 Entonces
            fallos <- fallos + 1
			
            libre <- -1
			
            Para i <- 1 Hasta 3 Hacer
                Si Ocupado[i] = 0 Entonces
                    libre <- i
                FinSi
            FinPara
			
            Si libre <> -1 Entonces
                Marcos[libre] <- pag
                Ocupado[libre] <- 1
            Sino
                Marcos[puntero] <- pag
                puntero <- puntero + 1
                Si puntero > 3 Entonces
                    puntero <- 1
                FinSi
            FinSi
        FinSi
    FinPara
FinFuncion


Funcion victima <- ElegirVictimaOPT(tActual, Marcos, Referencias)
    mayorDist <- -1
    victima <- 1
	
    Para i <- 1 Hasta 3 Hacer
        pag <- Marcos[i]
        dist <- 999
        encontrado <- Falso
		
        Para k <- tActual + 1 Hasta 12 Hacer
            Si Referencias[k] = pag Entonces
                dist <- k - tActual
                encontrado <- Verdadero
            FinSi
        FinPara
		
        Si encontrado = Falso Entonces
            dist <- 999   // nunca vuelve a aparecer
        FinSi
		
        Si dist > mayorDist Entonces
            mayorDist <- dist
            victima <- i
        FinSi
    FinPara
FinFuncion

Funcion fallos <- SimularOPT(Referencias)
    Dimension Marcos[3]
    Dimension Ocupado[3]
	
    Para i <- 1 Hasta 3 Hacer
        Marcos[i] <- -1
        Ocupado[i] <- 0
    FinPara
	
    fallos <- 0
	
    Para t <- 1 Hasta 12 Hacer
        pag <- Referencias[t]
		
        Si BuscarPagina(pag, Marcos, Ocupado) = -1 Entonces
            fallos <- fallos + 1
			
            libre <- -1
			
            Para i <- 1 Hasta 3 Hacer
                Si Ocupado[i] = 0 Entonces
                    libre <- i
                FinSi
            FinPara
			
            Si libre <> -1 Entonces
                Marcos[libre] <- pag
                Ocupado[libre] <- 1
            Sino
                v <- ElegirVictimaOPT(t, Marcos, Referencias)
                Marcos[v] <- pag
            FinSi
        FinSi
    FinPara
FinFuncion


Algoritmo AdministradorMemoria
	
    Dimension MarcoOcupado[4]
    Dimension MarcoPagina[4]
    Dimension Referencias[12]
	
    Referencias[1] <- 1
    Referencias[2] <- 2
    Referencias[3] <- 3
    Referencias[4] <- 4
    Referencias[5] <- 1
    Referencias[6] <- 2
    Referencias[7] <- 5
    Referencias[8] <- 1
    Referencias[9] <- 2
    Referencias[10] <- 3
    Referencias[11] <- 4
    Referencias[12] <- 5
	
    InicializarRAM(MarcoOcupado, MarcoPagina)
    MostrarMapaBits(MarcoOcupado)
	
    fallosFIFO <- SimularFIFO(Referencias)
    fallosOPT <- SimularOPT(Referencias)
	
    Escribir "Fallos FIFO: ", fallosFIFO
    Escribir "Fallos OPT: ", fallosOPT
	
FinAlgoritmo
