# Bibliografia del volume I

Le bibliografie sono raccolte in un unico archivio BibLaTeX (`riferimenti.bib`) e vengono stampate **per capitolo** tramite `refsection=chapter`.

Ogni capitolo si conclude con `\\addsec{Bibliografia}` e `\\printbibliography[heading=none]`. La stampa mostra **solo le opere effettivamente citate** in quel capitolo; per aggiungerne una si crea una voce con chiave stabile nel file `.bib` e si richiama tramite `\\cite[<pagina>]{chiave}` nelle note a piè di pagina.

I riferimenti alle **pagine specifiche** devono comparire nelle note, non nelle voci bibliografiche generali. Le opere note soltanto attraverso citazioni o riassunti di terzi non vanno registrate come direttamente consultate. In assenza di un'edizione direttamente utilizzata, i passi degli autori antichi vengono citati nel testo con le coordinate convenzionali.

La compilazione richiede **LuaLaTeX, Biber e latexmk** (il comando `latexmk` avvia automaticamente Biber quando necessario).
