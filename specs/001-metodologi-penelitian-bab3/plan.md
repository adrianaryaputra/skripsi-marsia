# Plan: Metodologi Penelitian Bab III (`specs/001-metodologi-penelitian-bab3`)

---

## 1. Strategi Arsitektur & Rekonstruksi Document
Dokumen Bab III (`chapters/03-metodologi-penelitian.tex`) akan disatukan ulang strukturnya dengan pendekatan modular. Penulisan difokuskan pada penyajian instrumen operasional dan prosedur kerja kuantifikasi SWOT/FGD tanpa menyentuh Bab IV.

---

## 2. Rencana Gelombang Eksekusi (3-Wave Execution Plan)

### Wave 1: Formulasi Kontrak & Template Instrumen (R&D & Publication)
- Menyiapkan spesifikasi instrumen tabel operasionalisasi variabel, pedoman skoring, dan template kosong IFAS/EFAS/SWOT.
- Memastikan tidak ada subbab Triangulasi / Keabsahan Data di dalam rancangan.

### Wave 2: Implementasi LaTeX Bab III (Publication Division)
- Menulis ulang dan me-refactor `chapters/03-metodologi-penelitian.tex` sesuai dengan urutan subbab pada `spec.md`.
- Menyisipkan seluruh tabel instrumen baru (`xltabular` / `tabular`).
- Menyusun subbab Focus Group Discussion (FGD) dan prosedur skoring matematis.

### Wave 3: Verifikasi Kompilasi & Penyelarasan PDF (CEO & QA Gate)
- Rebuild PDF `main.pdf` dengan `pdflatex` + `biber` (4-pass clean build).
- Verifikasi teks hasil kompilasi via `pdftotext` untuk memastikan tidak ada *undefined reference* atau *broken label*.
- Verifikasi visual halaman Bab III pada previewer.

---

## 3. Strategi Pembagian Kerja Divisi (Division Assignment)
- **R&D (`head-rnd`)**: Merumuskan kuesioner, indikator operasional, dan tabel pedoman skoring.
- **Publication (`head-publication`)**: Mengarang teks LaTeX pada `chapters/03-metodologi-penelitian.tex` (One-File-One-Writer Rule).

---

## 4. Kriteria Keberhasilan (Acceptance Criteria)
1. `chapters/03-metodologi-penelitian.tex` berhasil memuat subbab FGD dan 5 tabel instrumen kunci.
2. Tidak ada subbab Triangulasi / Keabsahan Data.
3. PDF `main.pdf` berhasil dikompilasi dengan 0 error & 0 undefined reference warning.
4. Seluruh isi Bab III selaras dengan kebutuhan Dosen Pembimbing (Bu Tetty).
