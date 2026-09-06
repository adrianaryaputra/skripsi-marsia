# Tasks: Publikasi Artikel JoMAS (`specs/002-publikasi-jomas/tasks.md`)

## Status Tracking
- Status: Completed (Ready for Review)
- Target Submisi: Journal of Management Analytical and Solution (JoMAS) FEB USU (SINTA 4)
- Bahasa Naskah: Full English (Abstract & Full Article)

---

## Daftar Tugas

### Gelombang 1: Template & Layout
- [x] T01: Ekstraksi dan audit mendalam parameter `scratch/01-panduan-dan-materi-kuliah/Template JoMAS.docx`.
- [x] T02: Penyusunan spesifikasi domain `specs/002-publikasi-jomas/spec.md`.
- [x] T03: Pembuatan direktori terisolasi `jomas/`.
- [x] T04: Pembuatan berkas kelas LaTeX `jomas/jomas.cls` dengan aturan geometri, tipografi, dan spasi JoMAS.
- [x] T05: Pembuatan skrip kompilasi `jomas/build.sh`.

### Gelombang 2: Konten Naskah & Referensi
- [x] T06: Pembuatan berkas referensi `jomas/jomas.bib` (standar APA/Harvard BibTeX 100% otomatis, 11 referensi terindeks).
- [x] T07: Penulisan naskah artikel `jomas/main.tex` dalam Bahasa Inggris penuh:
  - Abstrak Bahasa Inggris tunggal (146 kata, batas <= 160 kata).
  - Urutan penulis: Marsia Br Pelawi, Tetty Yuliaty (Pembimbing), Arlina Nurbaity Lubis (Penguji I), Haryaji Catur Putera Hasman (Penguji II).
  - Sistematika bab sesuai template JoMAS: `INTRODUCTION`, `LITERATURE REVIEW`, `METHODS`, `RESULTS`, `DISCUSSION`, `CONCLUSION`, `ACKNOWLEDGMENTS`, `REFERENCES`.
  - Seluruh sitasi 100% terhubung ke BibTeX via `\textcite` dan `\parencite` (nol sitasi teks manual).
  - Seluruh kalimat teoretis/konseptual memiliki landasan literatur yang kokoh (Parasuraman, Wirtz-Lovelock, Bitner, Chase-Stewart, Kotler, Chaffey, Yin, Miles-Huberman).
- [x] T08: Pengayaan data empiris dari skripsi dan lampiran (*data-heavy*):
  - Tabel 1: Informant Matrix and Operational Competencies (9 informan: Owner, Kasir, Dapur, Konsultan IT APINDO, Konsumen, dan Kompetitor).
  - Tabel 2: Operational Storefront Parameters Audited on GrabFood.
  - Tabel 3: Audit of Unavailable Menu Items on GrabFood Storefront (6 item sold out, strictly max 2 baris/row).
  - Tabel 4: Distribution of Active Promotional Campaigns and Inventory Stockouts (19 promo).
  - Tabel 5: Menu Architecture and Pricing Tiers on GrabFood Storefront (6 kategori menu).
  - Tabel 6: Comparative Pricing Audit: Dine-In vs. GrabFood Platform Mark-Up (selisih mark-up 23%--25% akibat komisi platform 20%, strictly max 2 baris/row).
  - Figure 2: Service Blueprint of Order Fulfillment Journey and Operational Failure Points (TikZ flowchart 4 tahapan dan titik gagal).
  - Tabel 7: Classification of Operational Service Failures Across E-S-QUAL Dimensions (pemetaan teoretis dimensi Fulfillment, Efficiency, Physical Evidence, Availability).
  - Figure 3: PGFPlots bar chart quantitative distribution of customer grievance categories (4.584 ulasan).
  - Tabel 8: Thematic Coding of Operational Fieldwork Interviews (kutipan wawancara staf dan manajemen).
  - Tabel 9: Representative Verbatim Customer Reviews from GrabFood Storefront.
  - Tabel 10: Comparative Triangulation Across Competing Padang Restaurants on GrabFood (triangulasi lintas kompetitor, strictly max 2 baris/row).
  - Tabel 11: Proposed Two-Stage Fail-Safe Quality Verification Checklist (Model operasional Poka-Yoke Stage 1 Kitchen & Stage 2 Cashier).
  - Figure 4: Servicescape Layout Schematic: Existing Bottleneck vs. Proposed Decoupled Counter (Skematik zonasi spasial arsitektur restoran TikZ resolusi tinggi).
  - Figure 1: Side-by-side composite figure (Subfigure a: Digital Storefront & Subfigure b: Cashier Workstation).
  - Seluruh label `source/note` dan `sumber/catatan` telah dihapus 100%.
- [x] T09: Pemeriksaan invarian batasan materi (100% aman: 0 IFAS, 0 EFAS, 0 Kuadran I, 0 Matriks 8 SWOT).

### Gelombang 3: Kompilasi & Verifikasi
- [x] T10: Kompilasi dokumen `jomas/main.tex` -> `jomas/main.pdf` via `jomas/build.sh`.
- [x] T11: Audit visual halaman PDF dengan vision inspection:
  - Header author metadata padat tanpa spasi vertikal berlebih (`parskip=0pt`).
  - Email mahasiswa `marsiabr@students.usu.ac.id` dan email institusi dosen USU lengkap.
  - Seluruh teks ditulis dalam kalimat aktif murni, bebas 100% dari frasa klise AI/slop, dan 1 pokok pikiran per kalimat.
  - Bebas 100% dari em-dash (`---`).
  - Gambar (Figure 1 di halaman 3-4 dan Figure 2 di bagian bawah halaman 5) terpisah rapi di top/bottom.
  - Setiap tabel (Table 1 s.d. Table 6) menempel langsung di bawah paragraf penjelasnya pada halaman yang sama (tidak pernah terpisah halaman).
  - Tidak ada gambar dan tabel yang berurutan langsung (selalu diselingi teks narasi analisis).
  - Seluruh baris data pada Table 2, Table 3, Table 4, dan Table 6 strictly 1 baris (single-line).
  - Bebas dari label `source/note`.
  - Halaman 5 dan 6 padat terisi penuh secara alami; Halaman 6 tuntas dengan Acknowledgments; Halaman 7 khusus untuk Daftar Pustaka (References) berformat APA/Harvard rapi.
- [x] T12: Dokumentasi ringkas `jomas/README.md`.
