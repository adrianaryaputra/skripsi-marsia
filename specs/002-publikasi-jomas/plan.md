# Plan: Publikasi Artikel JoMAS (`specs/002-publikasi-jomas/plan.md`)

## 1. Arsitektur Pelaksanaan 3 Gelombang (3-Wave Execution)

### Gelombang 1: Penyusunan Kontrak & Layout Template (Wave 1 - Contracts & Class)
- Merancang modul kelas LaTeX `jomas/jomas.cls` sesuai spesifikasi `specs/002-publikasi-jomas/spec.md`:
  - Geometri Letter (8,5 x 11 inci) dengan margin 1 inci (2,54 cm).
  - Skala tipografi Times New Roman (14 pt judul, 12 pt heading, 11 pt teks & abstrak, 10 pt tabel/penulis, 9 pt sumber).
  - Skema spasi: 1.0 (single line spacing), heading space before 12--24 pt, paragraf space before 6--12 pt.
  - Perintah kustom untuk metadata judul dwi-bahasa, penulis, afiliasi, email korespondensi, dan kata kunci.
  - Perintah tabel format rapi (*booktabs*) dan caption bold 10 pt dengan sumber 9 pt.
- Menyiapkan script kompilasi otomatis `jomas/build.sh` (pdflatex + biber).

### Gelombang 2: Penulisan Naskah & Sitasi (Wave 2 - Content & Bibliography)
- Menyusun naskah `jomas/main.tex` dalam Bahasa Indonesia (abstrak dwi-bahasa ID + EN) dengan batas kata abstrak <= 160 kata.
- Menyaring data empiris operasional layanan dari Bab IV skripsi (analisis ulasan 4.584, wawancara kendala packing dan antrean, SOP checker).
- Memastikan **nol pelanggaran invarian**: Dilarang memuat matriks IFAS, EFAS, diagram koordinat Kuadran I, dan 8 strategi SWOT.
- Menyusun berkas bibliografi `jomas/jomas.bib` dengan rujukan standar manajemen layanan (Parasuraman, Wirtz & Lovelock, Kotler, Chaffey).

### Gelombang 3: Verifikasi Kompilasi & Dokumentasi (Wave 3 - Verification & Delivery)
- Menjalankan kompilasi `build.sh` di direktori `jomas/`.
- Memastikan kompilasi 100% bebas error, 0 undefined reference, dan menghasilkan `jomas/main.pdf` yang rapi.
- Menyusun dokumentasi `jomas/README.md`.
