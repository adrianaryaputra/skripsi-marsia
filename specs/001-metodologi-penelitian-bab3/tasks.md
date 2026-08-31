# Feature Tasks Checklist: Metodologi Penelitian Bab III (`specs/001-metodologi-penelitian-bab3`)

- [x] [Publication] Restrukturisasi subbab `chapters/03-metodologi-penelitian.tex` mengikuti sistematika baru 3.1 s.d 3.8 per spec v1.0
- [x] [Publication] Menyusun Tabel Operasionalisasi Variabel & Kisi-kisi Instrumen SWOT (`tab:operasionalisasi-variabel-swot`)
- [x] [Publication] Menyusun subbab Focus Group Discussion (FGD) panel internal usaha
- [x] [Publication] Menyusun Tabel Pedoman Pembobotan (Skala Likert 1-5 dinormalisasi) dan Tabel Pedoman Rating (Skala 1-4 Rangkuti/Umar)
- [x] [Publication] Menyusun Template Kosong Tabel IFAS (`tab:template-ifas-bab3`) dan Template Kosong Tabel EFAS (`tab:template-efas-bab3`)
- [x] [Publication] Menyusun Template Kosong Matriks SWOT 8 Sel (`tab:template-matriks-swot-bab3`)
- [x] [Publication] Memastikan subbab Triangulasi / Uji Keabsahan Data TIDAK dimasukkan di Bab III per petunjuk dosen
- [x] [Publication] **[v1.1]** Tambahkan makro `\swotheader` dengan garis diagonal TikZ (`Internal \ Eksternal`) pada header sel kiri atas `tab:template-matriks-swot-bab3` di Bab III (`chapters/03-metodologi-penelitian.tex`)
- [x] [Publication] **[v1.1]** Terapkan makro `\swotheader` dengan header diagonal TikZ (`Internal \ Eksternal`) pada Tabel Formulasi Matriks SWOT Nasi Gerilya `tab:swot-bab4` di Bab IV (`chapters/04-hasil-dan-pembahasan.tex`) dengan isi empiris lengkap
- [x] [Publication] **[v1.2]** Sederhanakan label header diagonal `\swotheader` menjadi murni `EFAS` dan `IFAS` tanpa teks tambahan dalam kurung pada Bab III dan Bab IV.
- [ ] [Publication] Rebuild PDF 4-pass (`pdflatex` -> `biber` -> `pdflatex` -> `pdflatex`) dan verifikasi 0 undefined reference
- [ ] [Publication] Buat Pull Request ke `main` dan minta persetujuan Pak Adrian
