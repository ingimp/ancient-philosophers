#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo 'Uso: compila-volume.sh CARTELLA_VOLUME stampa|completa|entrambe|pulisci|pulisci-tutto' >&2
  exit 2
fi

volume_dir="$(cd "$1" && pwd)"
azione="$2"
volume_id="$(basename "$volume_dir")"

case "$volume_id" in
  antichi) base_pdf='filosofi_antichita_vol1' ;;
  imperiali-tardoantichi) base_pdf='filosofi_antichita_vol2' ;;
  *) echo "Volume non riconosciuto: $volume_id" >&2; exit 2 ;;
esac

pulisci() {
  rm -rf "$volume_dir/build/stampa" "$volume_dir/build/completa"
  echo "Temporanei eliminati: $volume_id/build/"
}

compila() {
  local edizione="$1" aux destinazione ingresso pdf
  command -v latexmk >/dev/null || { echo 'Manca latexmk (TeX Live/MacTeX).' >&2; exit 127; }
  command -v lualatex >/dev/null || { echo 'Manca lualatex (TeX Live/MacTeX).' >&2; exit 127; }
  aux="$volume_dir/build/$edizione"
  destinazione="$volume_dir/dist/$edizione"
  ingresso="$edizione.tex"
  mkdir -p "$aux" "$destinazione"
  echo "==> Volume: $volume_id | Edizione: $edizione"
  (
    cd "$volume_dir"
    latexmk -lualatex -interaction=nonstopmode -halt-on-error -file-line-error \
      -outdir="$aux" "$ingresso"
  )
  [[ -s "$aux/$edizione.pdf" ]] || { echo "PDF non prodotto: $aux/$edizione.pdf" >&2; exit 1; }
  pdf="$destinazione/${base_pdf}_${edizione}.pdf"
  cp "$aux/$edizione.pdf" "$pdf"
  echo "==> Creato: $pdf"
  if [[ "$(uname -s)" == "Darwin" && "${OPEN_PDF:-1}" != "0" ]]; then
    echo "==> Apro: $pdf"
    if ! open "$pdf"; then
      echo "Avviso: impossibile aprire automaticamente il PDF: $pdf" >&2
    fi
  fi
}

case "$azione" in
  stampa|completa) compila "$azione" ;;
  entrambe) compila stampa; compila completa ;;
  pulisci) pulisci ;;
  pulisci-tutto)
    pulisci
    rm -f "$volume_dir/dist/stampa/"*.pdf "$volume_dir/dist/completa/"*.pdf
    echo "PDF generati eliminati: $volume_id/dist/"
    ;;
  *) echo "Azione non riconosciuta: $azione" >&2; exit 2 ;;
esac
