# Bibliografia del volume I

La bibliografia è gestita da **BibLaTeX** e Biber: `riferimenti.bib` contiene voci con chiavi stabili, richiamabili da ciascun capitolo. L'opzione `refsection=chapter` evita di ripetere studi non citati nello specifico capitolo.

La bibliografia di ogni filosofo è divisa in **Fonti antiche** (`keywords={antiche}`) e **Studi moderni** (`keywords={moderni}`). La sezione si genera in LaTeX mediante:

```latex
\addsec{Bibliografia e fonti}
\printbibliography[heading=subbibliography,title={Fonti antiche},keyword={antiche}]
\printbibliography[heading=subbibliography,title={Studi moderni},keyword={moderni}]
```

Per le fonti antiche, `\citetitle{erodotoStorie}` richiama la voce pertinente senza inserire una data anacronistica nel testo; si conservano a fianco libro e passo (Stephanus, Bekker e altre numerazioni convenzionali). Per gli studi moderni, `\cite[17--19]{palumbo2015}` indica nelle note la pagina specifica. **Le pagine non vanno inserite nei dati bibliografici generali.**

Dove l'edizione antica non è stata verificata, la voce registra solo l'opera e l'eventuale mediazione, senza inventare dati editoriali. Non si registrano testi moderni conosciuti soltanto indirettamente come se fossero stati consultati.
