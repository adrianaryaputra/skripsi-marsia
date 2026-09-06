#!/usr/bin/env bash
# ==============================================================================
# Script Kompilasi Naskah Artikel Jurnal JoMAS (Marsia Br Pelawi)
# Menjalankan: pdflatex -> biber -> pdflatex (2x)
# ==============================================================================

set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

echo "================================================================="
echo "  Memulai kompilasi artikel JoMAS: main.tex -> main.pdf"
echo "================================================================="

echo "[Pass 1/3] Menjalankan pdflatex..."
pdflatex -interaction=nonstopmode -file-line-error main.tex > /dev/null

echo "[Pass 2/3] Memproses bibliografi dengan biber..."
if [ -f "main.bcf" ]; then
    biber main > /dev/null 2>&1 || echo "Catatan: biber selesai dengan peringatan non-fatal."
fi

echo "[Pass 3/3] Menyelesaikan referensi silang (2 pass)..."
pdflatex -interaction=nonstopmode -file-line-error main.tex > /dev/null
pdflatex -interaction=nonstopmode -file-line-error main.tex > /dev/null

if [ -f "main.pdf" ]; then
    PAGES=$(pdfinfo main.pdf 2>/dev/null | grep -i "Pages:" | awk '{print $2}')
    SIZE=$(ls -lh main.pdf | awk '{print $5}')
    echo "-----------------------------------------------------------------"
    echo "✓ Berhasil: main.pdf siap!"
    echo "  Jumlah Halaman : ${PAGES:-N/A} halaman"
    echo "  Ukuran Berkas  : ${SIZE:-N/A}"
    echo "  Lokasi         : $DIR/main.pdf"
    echo "-----------------------------------------------------------------"
else
    echo "✗ Gagal: main.pdf tidak terbentuk. Periksa main.log."
    exit 1
fi
