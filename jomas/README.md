# Paket Naskah Publikasi JoMAS (Journal of Management Analytical and Solution)

Direktori ini berisi naskah artikel ilmiah subset skripsi untuk dipublikasikan pada **Journal of Management Analytical and Solution (JoMAS)** FEB Universitas Sumatera Utara (Terakreditasi SINTA 4).

## 1. Metadata Artikel

- **Judul**: Electronic Service Quality and Customer Complaint Handling on Food Delivery Platforms: A Case Study of Nasi Gerilya on GrabFood
- **Penulis**: Marsia Br Pelawi$^{1*}$, Tetty Yuliaty$^2$, Arlina Nurbaity Lubis$^2$, Haryaji Catur Putera Hasman$^2$
- **Afiliasi**: Program Studi S1 Manajemen & Departemen Manajemen, Fakultas Ekonomi dan Bisnis, Universitas Sumatera Utara
- **Email Institusi**:
  - Marsia Br Pelawi: `marsiabr@students.usu.ac.id` (Corresponding)
  - Dr. Tetty Yuliaty: `tettyjuliaty@usu.ac.id`
  - Prof. Dr. Arlina Nurbaity Lubis: `arlina@usu.ac.id`
  - Haryaji Catur Putera Hasman: `haryaji@usu.ac.id`
- **Fokus Domain**: Electronic Service Quality (*E-Service Quality*), Pemenuhan Pesanan (*Order Fulfillment*), dan Pemulihan Layanan (*Service Recovery*).
- **Bahasa Naskah**: Bahasa Inggris Penuh (*Full English Paper & Abstract*).

## 2. Struktur Berkas

```text
jomas/
├── jomas.cls       # Class file LaTeX kustom sesuai template resmi JoMAS (Letter, 1 inch, TNR)
├── main.tex        # Naskah artikel ilmiah lengkap
├── jomas.bib       # Database bibliografi (gaya sitasi APA/Harvard)
├── build.sh        # Skrip kompilasi mandiri (pdflatex + biber)
├── main.pdf        # Hasil kompilasi siap submit
└── README.md       # Dokumentasi teknis paket naskah
```

## 3. Spesifikasi Tata Letak (`jomas.cls`)

Modul kelas `jomas.cls` telah disesuaikan 100% dengan `Template JoMAS.docx`:
- **Ukuran Halaman**: US Letter ($8{,}5 \times 11$ inci).
- **Margin**: 1 inci ($2{,}54\text{ cm}$) pada semua sisi.
- **Tipografi**: Times New Roman (TNR).
  - Judul: TNR 14 pt, Bold, Centered ($\le 150$ karakter).
  - Penulis & Afiliasi: TNR 10 pt, Centered.
  - Abstrak: TNR 11 pt, Justified, Spasi 1.0 ($\le 160$ kata).
  - Heading Bagian: TNR 12 pt, Bold, ALL CAPS, Space Before 12--24 pt.
  - Paragraf Isi: TNR 11 pt, Justified, Spasi 1.0, Space Before 6--12 pt.
  - Tabel: TNR 10 pt (*booktabs*), Caption Bold TNR 10 pt, Sumber/Catatan TNR 9 pt.

## 4. Cara Kompilasi Mandiri

Jalankan perintah berikut di terminal:

```bash
cd jomas
./build.sh
```

Skrip akan secara otomatis menjalankan:
1. `pdflatex main.tex` (pass 1)
2. `biber main` (sinkronisasi sitasi)
3. `pdflatex main.tex` (pass 2 & pass 3 untuk menyempurnakan cross-reference)
