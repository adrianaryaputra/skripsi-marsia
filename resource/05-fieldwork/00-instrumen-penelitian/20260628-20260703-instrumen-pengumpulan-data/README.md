# Instrumen Pengumpulan Data

Dataset ini menyimpan instrumen penelitian yang sebelumnya berada di `output/pdf/`. File dipindahkan ke `resource` karena merupakan bahan metodologis yang perlu dapat ditelusuri sebagai bukti penyusunan data skripsi.

## Struktur

| Folder/file | Isi |
|---|---|
| `pdf/` | Versi PDF instrumen siap baca/cetak. |
| `source-tex/` | Sumber LaTeX instrumen yang dapat diedit ulang. |
| `INST-20260705-file-manifest.csv` | Manifest file instrumen yang dipindahkan dari `output`. |
| `INST-20260705-excluded-output-build-files.md` | Daftar artefak build yang tidak dimasukkan ke resource. |

## Instrumen yang Disimpan

| Kode | Instrumen |
|---|---|
| `INST-PL-20260628-ANGKET` | Angket terbuka pelanggan GrabFood Nasi Gerilya. |
| `INST-PL-20260628-PEDOMAN` | Pedoman wawancara pelanggan GrabFood Nasi Gerilya. |
| `INST-KR-20260701-ANGKET` | Angket terbuka karyawan Nasi Gerilya. |
| `INST-KP-20260701-ANGKET` | Angket terbuka kompetitor GrabFood Nasi Gerilya. |
| `INST-BC-20260703-PEDOMAN` | Pedoman wawancara intern business consultant Nasi Gerilya. |

## Catatan

File `.aux`, `.log`, `.out`, `.fls`, `.fdb_latexmk`, `.synctex.gz`, dan `.xdv` dari `output/pdf/` bukan bahan penelitian, sehingga dipindahkan ke `scratch/99-temp/_discarded/output-build-artifacts-20260705/`.
