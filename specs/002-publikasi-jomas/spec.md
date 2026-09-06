---
id: "002"
title: "Publikasi Artikel Jurnal JoMAS (E-Service Quality & Complaint Handling)"
tier: 1
layer: publication
divisions: [publication, design]
status: approved
created: 2026-09-06
updated: 2026-09-06
depends_on: []
---

# Domain Spec: Publikasi Artikel JoMAS (`specs/002-publikasi-jomas`) - Ekspansi Opsi 2 (High Rigour 16--18 Halaman)

> **Dokumen Spesifikasi Hidup (Living Spec)**: Spesifikasi ini mendefinisikan persyaratan teknis layout LaTeX (`jomas.cls`), visualisasi grafis (TikZ/PGFPlots), dan ekspansi naskah artikel ilmiah untuk submisi ke *Journal of Management Analytical and Solution* (JoMAS) FEB Universitas Sumatera Utara (SINTA 4), dengan target panjang 16--18 halaman (batas absolut <= 25 halaman).

---

## 1. Visi Domain & Batasan Publikasi

### 1.1 Visi
Menghasilkan artikel jurnal ilmiah terapan bertaraf tinggi (*high academic rigour*) mengenai dinamika kualitas layanan digital, friksi operasional pemenuhan pesanan, taksonomi keluhan pelanggan, dan model pemulihan layanan bertingkat pada platform GrabFood, berbasis studi kasus mendalam Rumah Makan Nasi Gerilya di Kota Medan.

### 1.2 Batasan Perlindungan Novelty (Invarian Mutlak)
1. **DILARANG** memuat komponen makro skripsi berikut:
   - Matriks IFAS dan skor tertimbang ($2{,}50$).
   - Matriks EFAS dan skor tertimbang ($2{,}51$).
   - Titik koordinat dan diagram kartesius Kuadran I ($X=0{,}02, Y=0{,}09$).
   - Matriks 8 sel alternatif strategi SWOT (SO, WO, ST, WT).
   - Analisis makro STP terintegrasi.
2. Seluruh matriks strategis makro di atas **dicadangkan 100% untuk Naskah Utama Skripsi** (target publikasi luar: Scopus Q2/Q3 / SINTA 1).
3. Konten JoMAS berfokus penuh pada **aspek mikro operasional jasa & analitik empiris**:
   - Analisis isi 4.584 ulasan GrabFood (taksonomi keluhan, polaritas sentimen, pemicu penalti asimetris).
   - Dinamika temporal antrean dan waktu siklus pemenuhan pesanan (*order cycle time*: persiapan, peracikan, serah terima kurir).
   - Matriks keabsahan data kualitatif (*trustworthiness audit trail*: Lincoln & Guba, 1985).
   - Model pemulihan kegagalan layanan bertingkat (*hierarchical service recovery protocol*).
   - Servicescape decoupling (Bitner, 1992) dan sistem kendali mutu poka-yoke (Chase & Stewart, 1994).
   - Nada bahasa: strictly academic, data-driven, bebas dari gaya klise atau hiperbolis (zero AI slop).

---

## 2. Spesifikasi Teknis Layout (`jomas.cls`)

Berdasarkan hasil ekstraksi dan audit dokumen resmi `Template JoMAS.docx`:

### 2.1 Geometri Halaman
- **Ukuran Kertas**: US Letter ($8{,}5 \times 11$ inci / $215{,}9 \times 279{,}4\text{ mm}$).
- **Margin**: 1 inci ($25{,}4\text{ mm}$) pada seluruh sisi (Atas, Bawah, Kiri, Kanan).
- **Kolom**: 1 kolom (*single column*).
- **Nomor Halaman**: Angka arab di sudut kanan atas atau bawah tengah standar jurnal.

### 2.2 Tipografi & Spasi (Times New Roman)
1. **Judul Artikel**:
   - Font: Times New Roman, 14 pt, Bold.
   - Posisi: Rata tengah (*centered*).
   - Batasan: Maksimal 150 karakter.
2. **Penulis & Afiliasi**:
   - Font: Times New Roman, 10 pt, Regular.
   - Posisi: Rata tengah (*centered*), *Space Before* 12 pt.
   - Format Penulis: `Penulis1*, Penulis2, Penulis3`.
   - Format Afiliasi: `^1Departemen, Fakultas, Universitas, Kota, Negara`.
   - Email Korespondensi: `*email@usu.ac.id`.
3. **Abstrak (Bilingual: Indonesia & Inggris)**:
   - Judul Abstrak: `ABSTRAK` / `ABSTRACT`, 12 pt, Bold, *Space Before* 18 pt.
   - Isi Abstrak: Times New Roman, 11 pt, Rata Kanan-Kiri (*Justified*), Spasi 1.0 (*single*), *Space Before* 6 pt.
   - Batasan Kata: Maksimal 160 kata, berdiri sendiri (*no citation*).
   - Kata Kunci: `Kata Kunci:` / `Keywords:`, Bold, TNR 11 pt, maksimal 5 kata/frasa dipisah koma.
4. **Judul Bagian (*Heading 1*)**:
   - Font: Times New Roman, 12 pt, Bold, Huruf Kapital Semua (*ALL CAPS*).
   - Spasi: *Space Before* 24 pt (untuk Introduction) dan 12 pt (untuk bagian berikutnya), Spasi 1.0.
   - Urutan Bagian Wajib:
     1. `INTRODUCTION`
     2. `LITERATURE REVIEW`
     3. `METHODS`
     4. `RESULTS`
     5. `DISCUSSION`
     6. `CONCLUSION`
     7. `ACKNOWLEDGMENTS (OPTIONAL)`
     8. `REFERENCES`
5. **Paragraf Isi (Body Text)**:
   - Font: Times New Roman, 11 pt, Rata Kanan-Kiri (*Justified*), Spasi 1.0 (*single*).
   - Paragraf pertama setelah heading: *Space Before* 12 pt, tanpa indentasi awal.
   - Paragraf kedua dan seterusnya: *Space Before* 6 pt, tanpa indentasi awal.
6. **Tabel & Gambar**:
   - Judul: `Table 1. Title...` / `Tabel 1. Judul...` (Bold, TNR 10 pt, *Space Before* 12 pt, *Space After* 6 pt).
   - Isi Tabel: Times New Roman, 10 pt, garis horizontal rapi (*booktabs*).
   - Catatan / Sumber: `Source/note : ...` / `Sumber/catatan : ...`, TNR 9 pt, Regular.
7. **Format Sitasi & Referensi**:
   - Gaya: Harvard / APA (nama, tahun:halaman).
   - Font Referensi: TNR 11 pt, *Space Before* 6 pt, *hanging indent*.

---

## 3. Struktur Dokumen Proyek (`jomas/`)

Semua berkas terkait JoMAS diletakkan secara terisolasi pada direktori `jomas/`:

```text
jomas/
├── jomas.cls          # Modul kelas dokumen LaTeX JoMAS
├── main.tex           # Naskah utama artikel JoMAS
├── jomas.bib          # Bibliografi khusus artikel (APA/Harvard)
├── build.sh           # Script kompilasi mandiri (pdflatex + biber)
└── README.md          # Petunjuk ringkas kompilasi dan metadata
```

---

## 4. Rincian Konten Naskah Artikel

- **Judul**:
  *Analisis Kualitas Layanan Digital (E-Service Quality) dan Penanganan Keluhan Pelanggan pada Merchant Kuliner di Platform GrabFood (Studi Kasus: Rumah Makan Nasi Gerilya Medan)*
- **Penulis**:
  Marsia Br Pelawi$^1*$, [Dosen Pembimbing/Rekan]$^2$
- **Afiliasi**:
  $^1$Program Studi S1 Manajemen, Fakultas Ekonomi dan Bisnis, Universitas Sumatera Utara, Medan, Indonesia
- **Bagian Utama**:
  1. `PENDAHULUAN`: Pertumbuhan pesat pesan-antar makanan online di Medan pascapandemi; peran GrabFood sebagai etalase digital utama Nasi Gerilya (50% penjualan); urgensi menjaga kualitas layanan di tengah ulasan digital publik.
  2. `TINJAUAN PUSTAKA`: Dimensi *E-Service Quality* (efisiensi, pemenuhan pesanan/fulfillment, ketersediaan sistem, privasi); teori *Service Failure and Recovery*; bauran pemasaran jasa 7P (*Process, People, Physical Evidence*).
  3. `METODE PENELITIAN`: Pendekatan kualitatif deskriptif studi kasus; analisis isi terhadap 4.584 ulasan GrabFood; wawancara mendalam dengan kasir, staf dapur, kurir, dan pelanggan; triangulasi bukti dokumentasi fisik/digital.
  4. `HASIL PENELITIAN`:
     - Temuan pola kepuasan (rasa, porsi besar, ketepatan promo).
     - Temuan keluhan layanan (ketidaklengkapan bumbu/kuah/sambal, risiko salah item pada jam sibuk, waktu tunggu driver akibat antrean fisik dine-in).
     - Tabel rekapitulasi kategori komplain ulasan pelanggan.
  5. `PEMBAHASAN`:
     - Rekomendasi perbaikan proses: penerapan SOP *dual-check packing checklist*.
     - Rekomendasi penataan alur layanan: pemisahan loket kurir ojek online dari antrean dine-in.
     - Rekomendasi bukti digital: standarisasi label segel anti-rusak dan foto deskripsi porsi.
  6. `KESIMPULAN & SARAN`: Ringkasan kontribusi praktis bagi UMKM kuliner mitra pesan-antar makanan, keterbatasan penelitian studi kasus tunggal, dan arahan riset selanjutnya.
