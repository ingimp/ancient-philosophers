.DEFAULT_GOAL := aiuto
.PHONY: aiuto antichi-stampa antichi-completa imperiali-stampa imperiali-completa antichi imperiali tutti pulisci pulisci-dist

aiuto:
	@echo 'Compilazione: make antichi-stampa | antichi-completa | imperiali-stampa | imperiali-completa'
	@echo 'Entrambe le edizioni: make antichi | imperiali | tutti'
	@echo 'Pulizia: make pulisci (solo temporanei) | pulisci-dist (anche PDF)'

antichi-stampa:
	@./volumi/antichi/compila.sh stampa
antichi-completa:
	@./volumi/antichi/compila.sh completa
imperiali-stampa:
	@./volumi/imperiali-tardoantichi/compila.sh stampa
imperiali-completa:
	@./volumi/imperiali-tardoantichi/compila.sh completa

antichi: antichi-stampa antichi-completa
imperiali: imperiali-stampa imperiali-completa
tutti: antichi imperiali

pulisci:
	@./volumi/antichi/compila.sh pulisci
	@./volumi/imperiali-tardoantichi/compila.sh pulisci
pulisci-dist:
	@./volumi/antichi/compila.sh pulisci-tutto
	@./volumi/imperiali-tardoantichi/compila.sh pulisci-tutto
