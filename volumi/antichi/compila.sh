#!/usr/bin/env bash
set -euo pipefail
QUI="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec "$QUI/../../scripts/compila-volume.sh" "$QUI" "${1:-stampa}"
