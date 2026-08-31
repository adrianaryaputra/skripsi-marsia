---
id: "001"
title: "Metodologi Penelitian Bab III (Metode & Instrumen SWOT/FGD)"
tier: 1
layer: publication
divisions: [publication, rnd]
status: in-review
created: 2026-08-31
depends_on: []
---

# Domain Spec: Metodologi Penelitian Bab III (`specs/001-metodologi-penelitian-bab3`)

> **Dokumen Spesifikasi Hidup (Living Spec)**: Spesifikasi ini berbasis domain fitur metodologi (bukan sprint) dan diperbarui secara berkelanjutan mengikuti temuan riset komparatif serta arahan Dosen Pembimbing (Bu Tetty).

---

## 1. Visi Domain & Tujuan Spesifikasi
Spesifikasi domain ini mendefinisikan struktur operasional, instrumen, dan prosedur metodologi untuk Bab III (`chapters/03-metodologi-penelitian.tex`). Spesifikasi ini memulihkan fungsi Bab III sebagai **cetak biru operasional (operational blueprint)** yang melandasi seluruh data empiris pada Bab IV (`chapters/04-hasil-dan-pembahasan.tex`).

---

## 2. Persyaratan & Kebutuhan Dosen (User & Dosen Requirements)

### 2.1 Kebutuhan Eksplisit Dosen (Bu Tetty)
1. **Fitur Metodologi FGD (Focus Group Discussion)**: Wajib menyajikan subbab khusus metodologi FGD panel internal usaha (Pemilik, Leader Kasir/Operasional, Leader Dapur, dan Konsultan Bisnis) sebagai forum partisipatif penyepakatan faktor S, W, O, T serta pembobotan dan rating IFAS-EFAS.
2. **Fitur Cetak Biru Matriks Kosong (Scaffolding Matrices)**: Wajib menyajikan format/template kosong untuk:
   - Tabel Matriks IFAS (*Internal Factor Analysis Summary*)
   - Tabel Matriks EFAS (*External Factor Analysis Summary*)
   - Tabel Matriks SWOT 8 Sel (Strategi SO, WO, ST, WT per David/Rangkuti)
3. **Fitur Perhitungan Rating dan Bobot**: Wajib menyajikan tabel pedoman skoring pembobotan (Skala Likert 1–5 dinormalisasi $\sum \text{Bobot} = 1{,}00$) dan tabel pedoman pemberian rating (Skala 1–4 standar Husein Umar/Freddy Rangkuti).
4. **Fitur Diagram Grafik Kuadran**: Wajib menyajikan penjelasan diagram cartesius kuadran SWOT dilengkapi formula koordinat ($X = S - W; Y = O - T$).
5. **Mandat Khusus Dosen (Tanpa Subbab Triangulasi)**: **DILARANG** menyajikan subbab khusus Triangulasi / Uji Keabsahan Data di Bab III. Penyelarasan data dilakukan secara implisit melalui FGD dan sintesis data kualitatif.

---

## 3. Sistematika Struktur Bab III (Target Architecture)

```text
\section{Jenis dan Pendekatan Penelitian}      -> Subbab 3.1
\section{Tempat dan Waktu Penelitian}         -> Subbab 3.2
\section{Subjek dan Objek Penelitian}         -> Subbab 3.3 (Dilengkapi Tabel Informan)
\section{Batasan dan Operasionalisasi Variabel} -> Subbab 3.4 (Dilengkapi Tabel Kisi-kisi Operasionalisasi)
\section{Jenis Data Penelitian}                -> Subbab 3.5 (Data Primer & Sekunder)
\section{Metode Pengumpulan Data}              -> Subbab 3.6
  ├── \subsection{Wawancara Mendalam}
  ├── \subsection{Focus Group Discussion (FGD)} -> [FITUR BARU DOSEN]
  ├── \subsection{Observasi Lapangan & Platform Digital}
  ├── \subsection{Kuesioner/Angket Penilaian Bobot & Rating IFAS-EFAS}
  ├── \subsection{Dokumentasi}
  └── \subsection{Studi Kepustakaan}
\section{Instrumen Penelitian & Pedoman Skoring} -> Subbab 3.7
  ├── \subsection{Peneliti sebagai Instrumen Utama}
  ├── \subsection{Pedoman Pembobotan Faktor Strategis} -> [TABEL SKALA BOBOT LIKERT 1-5]
  └── \subsection{Pedoman Pemberian Rating} -> [TABEL SKALA RATING 1-4 RANGKUTI/UMAR]
\section{Prosedur dan Teknik Analisis Data}     -> Subbab 3.8
  ├── \subsection{Tahap Analisis Kualitatif Model Miles \& Huberman}
  ├── \subsection{Tahap Evaluasi Faktor Internal (IFE/IFAS)} -> [TEMPLATE KOSONG TABEL IFAS]
  ├── \subsection{Tahap Evaluasi Faktor Eksternal (EFE/EFAS)} -> [TEMPLATE KOSONG TABEL EFAS]
  ├── \subsection{Tahap Penentuan Posisi Strategis} -> [GRAFIK & FORMULA KOORDINAT X, Y]
  └── \subsection{Tahap Perumusan Strategi} -> [TEMPLATE KOSONG MATRIKS SWOT 8 SEL]
```

---

## 4. Spesifikasi Kontrak Fitur & Tabel Instumen

### 4.1 Tabel Operasionalisasi Variabel & Kisi-Kisi SWOT (`tab:operasionalisasi-variabel-swot`)
- **Struktur Kolom**: `Variabel / Dimensi | Definisi Konseptual | Indikator Lapangan (GrabFood) | Teknik Pengumpulan | Skala / Instrumen`.
- **Cakupan Dimensi**: Kekuatan (S), Kelemahan (W), Peluang (O), Ancaman (T) merujuk pada bauran 7P dan faktor makro/mikro Nasi Gerilya.

### 4.2 Pedoman Pembobotan & Rating (`tab:pedoman-pembobotan-swot` & `tab:pedoman-rating-swot`)
- **Tabel Pedoman Pembobotan**: Skala Likert 1 (Tidak Penting) s.d. 5 (Sangat Penting), disertai rumus normalisasi $b_i = \frac{K_i}{\sum K_j}$.
- **Tabel Pedoman Rating**: Skala 1 (Major Weakness / Poor Response), 2 (Minor Weakness / Average Response), 3 (Minor Strength / Above Average Response), 4 (Major Strength / Superior Response).

### 4.3 Template Tabel Kosong IFAS, EFAS, & Matriks SWOT (`tab:template-ifas-bab3`, `tab:template-efas-bab3`, `tab:template-matriks-swot-bab3`)
- **Template IFAS & EFAS**: Kolom `No. | Faktor Strategis | Bobot | Rating | Skor Tertimbang | Catatan / Indikator`.
- **Template Matriks SWOT (8 Sel)**: Matriks $2 \times 2$ persilangan IFAS vs EFAS (Strategi SO, WO, ST, WT). **Header Sel Kiri Atas**: Wajib menggunakan garis diagonal pembagi (`EFAS \ IFAS`) yang dipisahkan oleh TikZ (`\swotheader{EFAS}{IFAS}`) memisahkan Sisi Atas = IFAS dan Sisi Kiri = EFAS.
- **Harmonisasi Bab 4 (`tab:swot-bab4`)**: Tabel "Formulasi Matriks SWOT Nasi Gerilya pada GrabFood" di Bab IV diselaraskan 100% mengikuti struktur header diagonal `Internal \ Eksternal` dari Bab III, memuat data empiris lengkap (faktor S1..S6, W1..W6, O1..O6, T1..T5 dan alternatif strategi SO, WO, ST, WT).

---

## 5. Invarian & Aturan Validasi (Invariants & Validation)
1. **Invarian 1 (Zero Text Loss Bab IV)**: Seluruh perbaikan Bab III TIDAK BOLEH merusak, mengubah, atau mendegradasi data empiris pada Bab IV.
2. **Invarian 2 (Aturan Triangulasi)**: Subbab Triangulasi / Uji Keabsahan Data DILARANG dimunculkan. Pengujian data disatukan di dalam narasi FGD.
3. **Invarian 3 (Kesesuaian Teori)**: Penggunaan rumus koordinat $X = S - W$ dan $Y = O - T$ serta Matriks SWOT harus konsisten dengan referensi Freddy Rangkuti (2016) dan Fred R. David (2006).

---

## 6. Riwayat Revisi Spec (Revision Log)
- **v1.0 (2026-08-31)**: Inisiasi spesifikasi domain fitur Bab III berdasarkan riset komparatif 4 PDF referensi Bu Tetty (`scratch/99-temp/riset-revisi-bab3-dosen.md`).
- **v1.1 (2026-08-31)**: Amandemen format header Matriks SWOT 8 Sel di Bab III & Bab IV (`\swotheader`) menggunakan garis diagonal TikZ `Internal \ Eksternal` per petunjuk eksplisit Dosen.
- **v1.2 (2026-08-31)**: Penyederhanaan label header diagonal `\swotheader` menjadi murni `EFAS` dan `IFAS` tanpa teks tambahan dalam kurung.
