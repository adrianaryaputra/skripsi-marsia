#!/usr/bin/env bash
# ==============================================================================
# Script Kompilasi Otomatis Skripsi LaTeX (Marsia Br Pelawi)
# Menjalankan alur kompilasi standar: pdflatex -> biber -> pdflatex (2x)
# ==============================================================================

set -e

# Berpindah ke direktori tempat script ini berada (root repo)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_DIR"

TARGET="${1:-main}"

case "$TARGET" in
    main)
        TARGETS=("main")
        ;;
    proposal)
        TARGETS=("proposal")
        ;;
    all)
        TARGETS=("main" "proposal")
        ;;
    clean)
        echo "==> Membersihkan berkas aux/log/temp..."
        rm -f *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.loa *.lof *.log *.lot *.run.xml *.synctex* *.toc *.out *.xml
        echo "==> Selesai dibersihkan."
        exit 0
        ;;
    *)
        echo "Penggunaan: $0 [main|proposal|all|clean]"
        echo "Default: main"
        exit 1
        ;;
esac

for DOC in "${TARGETS[@]}"; do
    if [ ! -f "${DOC}.tex" ]; then
        echo "Error: Berkas ${DOC}.tex tidak ditemukan di direktori $REPO_DIR"
        exit 1
    fi

    echo "================================================================="
    echo "  Memulai kompilasi: ${DOC}.tex -> ${DOC}.pdf"
    echo "================================================================="

    echo "[Pass 1/3] Menjalankan pdflatex awal..."
    pdflatex -interaction=nonstopmode -file-line-error "${DOC}.tex" > /dev/null

    echo "[Pass 2/3] Memperbarui sitasi bibliografi dengan biber..."
    if [ -f "${DOC}.bcf" ]; then
        biber "${DOC}" > /dev/null 2>&1 || echo "Catatan: biber selesai dengan peringatan non-fatal."
    fi

    echo "[Pass 3/3] Menyelesaikan referensi silang dan tabel (2 pass)..."
    pdflatex -interaction=nonstopmode -file-line-error "${DOC}.tex" > /dev/null
    pdflatex -interaction=nonstopmode -file-line-error "${DOC}.tex" > /dev/null

    if [ -f "${DOC}.pdf" ]; then
        PAGES=$(pdfinfo "${DOC}.pdf" 2>/dev/null | grep -i "Pages:" | awk '{print $2}')
        SIZE=$(ls -lh "${DOC}.pdf" | awk '{print $5}')
        echo "-----------------------------------------------------------------"
        echo "✓ Berhasil: ${DOC}.pdf siap!"
        echo "  Jumlah Halaman : ${PAGES:-N/A} halaman"
        echo "  Ukuran Berkas  : ${SIZE:-N/A}"
        echo "  Lokasi         : $REPO_DIR/${DOC}.pdf"
        echo "-----------------------------------------------------------------"
    else
        echo "✗ Gagal: ${DOC}.pdf tidak terbentuk. Periksa ${DOC}.log."
        exit 1
    fi
done
