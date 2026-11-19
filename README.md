# I filosofi dell'antichità

Repository LaTeX di un'opera in due volumi, destinata agli studenti universitari.

- **Volume I** — *Dalle origini all'età ellenistica* (struttura ispirata al percorso didattico di Lidia Palumbo).
- **Volume II** — *Dall'età imperiale alla tarda antichità* (struttura ispirata al percorso didattico di Anna Motta).

**Criteri redazionali e citazioni:** [CRITERI_EDITORIALI.md](CRITERI_EDITORIALI.md) — protocollo vincolante per fonti, attribuzioni, parafrasi, citazioni e diritto d'autore.

Il volume I termina con le filosofie ellenistiche: **Plotino** appartiene esclusivamente al volume II. I testi delle autrici sono riferimenti per l'ordinamento, non materiale riprodotto nel repository.

## Stato del progetto

Struttura delle **parti approvata**; i capitoli e i contenuti sono ancora da progettare. I PDF generati ora sono **scheletri tipografici**, non un'edizione del testo. Il sottotitolo generale e il nome dell'autore potranno essere impostati in seguito. Le copertine illustrate saranno progettate più avanti.

## Requisiti

- TeX Live / MacTeX con `latexmk` e **LuaLaTeX**;
- font **Libertinus Serif** (`fontspec`);
- pacchetti `scrbook` (KOMA-Script), `babel`, `microtype`, `csquotes`, `etoolbox`, `hyperref`, `pdfpages`.

Il progetto è pensato per A4, 11 pt, testo su una colonna, con impostazione sobria di `scrbook`, `microtype` attivo e un lieve aumento dell'interlinea.

## Compilazione

Dalla radice del repository:

```bash
make antichi-stampa
make antichi-completa
make imperiali-stampa
make imperiali-completa
```

Per compilare **un solo libro**, entrambe le edizioni:

```bash
make antichi
make imperiali
```

Oppure, dalla cartella di ciascun volume:

```bash
cd volumi/antichi
./compila.sh stampa
./compila.sh completa
./compila.sh entrambe
```

```bash
cd volumi/imperiali-tardoantichi
./compila.sh stampa
./compila.sh completa
```

Su **macOS**, dopo ogni compilazione riuscita viene aperto automaticamente il PDF generato nell'app predefinita (di norma Anteprima). Per compilare **senza** aprire il PDF, usa ad esempio `OPEN_PDF=0 make antichi-stampa`. Il comportamento è condiviso da entrambi i volumi e dalle edizioni `stampa` e `completa`; su altri sistemi il PDF viene soltanto generato in `dist/`.

Dalla radice: `make tutti` compila tutti e quattro i PDF. `make pulisci` rimuove i file temporanei di entrambi i libri **senza cancellare `dist`**. `make pulisci-dist` rimuove anche i PDF distribuiti.

## Due edizioni indipendenti

- **Stampa**: frontespizio interno, indice, testo, **senza copertina esterna**. PDF A4 per la stampa.
- **Completa**: copertina esterna, frontespizio interno, indice, testo. Al momento la copertina è **tipografica e provvisoria**. Quando sarà pronta la copertina illustrata, basta collocare il relativo PDF A4 nella cartella `copertina/` del libro.

Gli stessi file `main.tex` e `parti/` alimentano entrambe le edizioni; il contenuto **non va duplicato**.

## Struttura

```text
.
├── Makefile                         # comandi di compilazione
├── README.md
├── .gitignore
├── comuni/
│   └── latex/
│       ├── stile.tex                # impaginazione comune approvata
│       ├── frontespizio.tex         # pagina di titolo interna
│       └── copertina.tex            # copertina temporanea / PDF esterno
├── scripts/
│   └── compila-volume.sh            # compilatore riutilizzato dai due libri
└── volumi/
    ├── antichi/
    │   ├── compila.sh               # compila solo il volume I
    │   ├── stampa.tex               # punto d'ingresso stampa
    │   ├── completa.tex             # punto d'ingresso completa
    │   ├── main.tex                 # corpo comune delle due edizioni
    │   ├── metadata.tex
    │   ├── parti/                   # una cartella per ogni parte
    │   ├── immagini/                # figure, grafici, mappe originali
    │   ├── copertina/               # copertina PDF futura
    │   ├── bibliografia/            # riferimenti da aggiungere
    │   ├── build/                   # temporanei LuaLaTeX / latexmk
    │   └── dist/
    │       ├── stampa/              # PDF pronti da stampare
    │       └── completa/            # PDF completi di copertina
    └── imperiali-tardoantichi/   # stessa struttura del volume I
```

Ogni `parti/NN-slug/parte.tex` contiene il titolo della parte; quando decideremo i capitoli inseriremo i sorgenti nella relativa cartella `capitoli/` e le istruzioni `\\input{...}` nel file `parte.tex`. Non sono stati creati capitoli fittizi.

## Copertine

In `volumi/XX-.../copertina/` potrai in futuro inserire:

- `prima.pdf` — **PDF A4 di una sola pagina**, usato come copertina iniziale dell'edizione completa;
- `quarta.pdf` — facoltativo, utilizzato come pagina finale dell'edizione completa.

Se `prima.pdf` manca, l'edizione completa genera una copertina **tipografica provvisoria**, chiaramente indicata come tale. L'edizione per la stampa ignora le copertine.

## Versionamento

I file ausiliari finiscono in `build/stampa/` o `build/completa/`. Gli output PDF finiscono in `dist/`, ma i PDF generati e gli ausiliari sono ignorati da Git per non appesantire i commit: per distribuire versioni scaricabili è preferibile una **GitHub Release**. Le directory `dist` restano nel repository tramite `.gitkeep`.

Non sono presenti GitHub Actions o compilazioni programmate: la build è **soltanto locale, su richiesta**.

## Lavoro editoriale

- Non copiare nei sorgenti i testi dei manuali di riferimento.
- Mantenere biografie, fonti antiche e bibliografia distinguibili.
- Non introdurre un sottotitolo definitivo fino alla decisione editoriale.
- Usare il medesimo stile per entrambi i volumi.

La licenza dell'opera e l'attribuzione autoriale sono da definire prima della pubblicazione. L'assenza di `LICENSE` non implica che i contenuti siano di pubblico dominio.
