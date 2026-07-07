# Laporan Audit Kekurangan Skripsi

Tanggal audit: 10 Juni 2026  
Lokasi proyek: `c:\Users\reido\Documents\Marsia\skripsi\tex`  
Dokumen utama yang diperiksa: `main.tex`, `proposal.tex`, seluruh file pada `chapters`, `frontmatter`, `metadata`, `appendices`, `backmatter`, `referensi.bib`, serta log/PDF hasil kompilasi.

## Ringkasan Eksekutif

Secara umum, naskah proposal pada Bab I sampai Bab III sudah cukup kuat: masalah penelitian jelas, data pra-survei sudah banyak, landasan teori sudah relevan, dan metodologi sudah selaras dengan pendekatan kualitatif deskriptif berbasis SWOT. Build LaTeX juga sehat: `main.tex` dan `proposal.tex` dapat dikompilasi, tidak ada sitasi atau referensi silang yang hilang, serta Biber tidak memberi peringatan.

Namun, untuk status sebagai skripsi lengkap, masih ada kekurangan besar. `main.tex` memasukkan Bab IV dan Bab V, tetapi kedua bab itu masih kosong. Selain itu, abstrak Indonesia dan Inggris masih berupa teks dummy yang sudah muncul di `main.pdf`. Ada juga inkonsistensi judul pada beberapa lampiran, serta beberapa bagian metodologi yang masih perlu dibuat lebih operasional agar tidak dipertanyakan dosen pembimbing/penguji.

Prioritas perbaikan paling mendesak:

1. Isi atau sementara keluarkan Bab IV dan Bab V dari dokumen final `main.tex`.
2. Ganti abstrak dan kata kunci dummy di `metadata/abstrak-id.tex` dan `metadata/abstract-en.tex`.
3. Samakan judul penelitian pada metadata, Bab I, dan lampiran.
4. Lengkapi Bab III dengan detail operasional: jumlah/target informan, prosedur wawancara, cara coding, skala bobot/rating IFAS-EFAS, dan cara validasi data.
5. Perjelas sumber, tanggal, dan cara normalisasi data indeks/periode pada lampiran.

## Status Teknis LaTeX

| Area | Hasil Pemeriksaan | Catatan |
| --- | --- | --- |
| Kompilasi `main.tex` | Berhasil, `main.pdf` up-to-date | `main.pdf` berisi 83 halaman. |
| Kompilasi `proposal.tex` | Berhasil, `proposal.pdf` up-to-date | `proposal.pdf` berisi 78 halaman. |
| Biber / bibliografi | Tidak ada warning | Tidak ditemukan sitasi hilang pada `main.blg` dan `proposal.blg`. |
| Referensi silang | Tidak ada warning undefined reference di log | Daftar isi, daftar tabel, daftar gambar, dan daftar lampiran terbentuk. |
| Overfull / underfull | Ada beberapa warning minor | Terutama pada tabel/paragraf. Overfull hanya sekitar 0.11-0.14 pt, tidak kritis. |
| `chktex` | Hanya warning kosmetik | `\makecover` dianggap "Command terminated with space" di `main.tex:18` dan `proposal.tex:18`. |

Kesimpulan teknis: proyek secara teknis dapat dibangun. Masalah utama bukan kerusakan LaTeX, melainkan kelengkapan isi dan konsistensi akademik.

## Temuan Prioritas Tinggi

### 1. Bab IV dan Bab V masih kosong, tetapi sudah masuk `main.pdf`

**Bukti:**

- `main.tex:35-36` memasukkan:
  - `chapters/04-hasil-dan-pembahasan`
  - `chapters/05-penutup`
- `chapters/04-hasil-dan-pembahasan.tex:1` hanya berisi `\chapter{HASIL DAN PEMBAHASAN}`.
- `chapters/05-penutup.tex:1` hanya berisi `\chapter{KESIMPULAN DAN SARAN}`.
- `main.toc:50-51` menunjukkan Bab IV dan Bab V sudah tampil di daftar isi.
- Hasil `pdftotext main.pdf` menunjukkan Bab IV langsung diikuti Bab V tanpa isi.

**Dampak:**

Dokumen `main.pdf` terlihat seperti skripsi lengkap, tetapi bagian hasil, pembahasan, kesimpulan, dan saran belum ada. Ini risiko paling besar jika file `main.pdf` dikirim sebagai dokumen final atau bahan bimbingan skripsi lengkap.

**Rekomendasi:**

- Jika target saat ini masih proposal/sempro, gunakan `proposal.tex` sebagai dokumen utama karena hanya memuat Bab I sampai Bab III.
- Jika `main.tex` tetap dipakai, tambahkan minimal kerangka Bab IV dan Bab V yang jelas sebagai placeholder akademik, atau sementara nonaktifkan input Bab IV-V sampai data penelitian utama tersedia.
- Rekomendasi struktur Bab IV:
  - Gambaran umum Rumah Makan Nasi Gerilya dan kanal GrabFood.
  - Hasil wawancara dan observasi berdasarkan STP dan 7P.
  - Identifikasi faktor internal: kekuatan dan kelemahan.
  - Identifikasi faktor eksternal: peluang dan ancaman.
  - Matriks IFAS dan EFAS.
  - Matriks SWOT dan alternatif strategi SO, WO, ST, WT.
  - Pembahasan strategi pemasaran untuk meningkatkan penjualan.
- Rekomendasi struktur Bab V:
  - Kesimpulan sesuai tiga rumusan masalah.
  - Saran praktis untuk Nasi Gerilya.
  - Saran akademik untuk penelitian selanjutnya.

### 2. Abstrak dan kata kunci masih dummy

**Bukti:**

- `metadata/abstrak-id.tex:1` berisi `Ini adalah isi paragraf abstrak dalam bahasa Indonesia.`
- `metadata/abstrak-id.tex:3` berisi kata kunci `Marsia, Cantik`.
- `metadata/abstract-en.tex:1` berisi `This is the abstract text in English.`
- `metadata/abstract-en.tex:3` berisi kata kunci `Marsia, Gorgeous`.
- `main.tex:20-21` memasukkan abstrak Indonesia dan Inggris ke dokumen utama.
- Hasil `pdftotext main.pdf` membuktikan teks dummy tersebut sudah muncul di PDF.

**Dampak:**

Ini sangat mencolok dan dapat membuat dokumen tampak belum siap, bahkan jika isi Bab I-III sudah baik. Kata kunci dummy juga tidak akademik.

**Rekomendasi:**

- Jika dokumen yang dikumpulkan adalah proposal, abstrak bisa dihilangkan bila format proposal tidak mewajibkan abstrak.
- Jika dokumen yang dikumpulkan adalah skripsi lengkap, abstrak harus ditulis setelah Bab IV-V selesai.
- Kata kunci yang lebih sesuai:
  - Bahasa Indonesia: `strategi pemasaran`, `GrabFood`, `SWOT`, `UMKM kuliner`, `penjualan`.
  - Bahasa Inggris: `marketing strategy`, `GrabFood`, `SWOT`, `culinary MSME`, `sales`.

### 3. Judul penelitian tidak konsisten antara metadata/Bab I dan lampiran

**Bukti:**

- Judul utama pada `metadata/skripsi.tex:4`:
  - `Strategi Pemasaran Rumah Makan Nasi Gerilya pada Platform GrabFood untuk Meningkatkan Penjualan Berdasarkan Analisis SWOT`
- Judul pada Bab I di `chapters/01-pendahuluan.tex:222` mengikuti versi metadata.
- Namun, lampiran memakai judul lama:
  - `appendices/01-observasi-grabfood-nasi-gerilya-dan-kompetitor.tex:4`
  - `appendices/02-wawancara-awal-pemilik-nasi-gerilya.tex:4`
  - `appendices/03-dokumentasi-indeks-kinerja-nasi-gerilya-dan-kompetitor-grabfood.tex:4`
  - Di sana tertulis `Analisis Strategi Pemasaran ... Menggunakan Matriks SWOT`.

**Dampak:**

Perbedaan frasa judul dapat menimbulkan kesan dokumen belum diselaraskan setelah revisi. Secara substantif tidak fatal, tetapi secara format akademik mudah terlihat.

**Rekomendasi:**

Samakan semua penyebutan judul dengan metadata, yaitu:

`Strategi Pemasaran Rumah Makan Nasi Gerilya pada Platform GrabFood untuk Meningkatkan Penjualan Berdasarkan Analisis SWOT`

### 4. Metodologi belum cukup operasional untuk pelaksanaan penelitian utama

**Bukti:**

- `chapters/03-metodologi-penelitian.tex:60` menyebut informan primer: pemilik/pengelola, admin/karyawan, pelanggan, dan pesaing.
- `chapters/03-metodologi-penelitian.tex:80` menjelaskan jenis informan, tetapi belum ada jumlah target/minimum informan.
- `chapters/03-metodologi-penelitian.tex:93-96` menyajikan kriteria informan, tetapi belum ada kriteria eksklusi, cara rekrutmen, atau target jumlah per kategori.
- `chapters/03-metodologi-penelitian.tex:149-151` menjelaskan triangulasi secara umum.
- `chapters/03-metodologi-penelitian.tex:156` dan `178` menjelaskan IFAS/EFAS, tetapi belum merinci skala rating, logika pemberian bobot, dan siapa yang memvalidasi bobot.

**Dampak:**

Bab III sudah benar secara arah, tetapi masih dapat dipertanyakan pada saat seminar:

- Berapa informan yang akan diwawancarai?
- Bagaimana pelanggan dipilih?
- Bagaimana jika kompetitor tidak bersedia diwawancarai?
- Bagaimana data wawancara diubah menjadi faktor SWOT?
- Siapa yang memberi bobot dan rating IFAS/EFAS?
- Bagaimana mengurangi subjektivitas peneliti?

**Rekomendasi:**

Tambahkan bagian atau paragraf yang menjelaskan:

- Target informan, misalnya:
  - 1 pemilik/pengelola.
  - 1-2 admin/karyawan.
  - 5-8 pelanggan GrabFood, mencakup pelanggan baru dan pelanggan ulang.
  - 1-2 informan pembanding dari kompetitor jika memungkinkan.
- Teknik pemilihan informan:
  - purposive sampling berdasarkan relevansi pengalaman dengan GrabFood.
  - snowball sampling opsional jika perlu mencari pelanggan/kompetitor.
- Kriteria pelanggan:
  - pernah membeli Nasi Gerilya melalui GrabFood dalam periode tertentu.
  - bersedia diwawancarai.
  - mewakili variasi pelanggan baru dan pelanggan ulang.
- Rencana jika pesaing tidak bersedia:
  - gunakan observasi platform, ulasan publik, harga, promo, rating, dan dokumentasi pembanding sebagai sumber sekunder.
- Prosedur analisis:
  - transkripsi/ringkasan wawancara.
  - coding tematik berdasarkan STP, 7P, faktor internal, dan faktor eksternal.
  - pengelompokan temuan menjadi S, W, O, T.
  - validasi ringkasan temuan kepada informan kunci.
- IFAS/EFAS:
  - jelaskan skala rating 1-4.
  - jelaskan bahwa bobot total kekuatan+kelemahan = 1,00 dan peluang+ancaman = 1,00.
  - jelaskan dasar bobot: frekuensi temuan, dampak terhadap penjualan, dan konfirmasi informan.

### 5. Data indeks dan periode perlu definisi yang lebih eksplisit

**Bukti:**

- `appendices/02-wawancara-awal-pemilik-nasi-gerilya.tex:36` menyebut komposisi pelanggan "saat ini" dan "sebelumnya".
- `appendices/02-wawancara-awal-pemilik-nasi-gerilya.tex:117-126` menyajikan perubahan pelanggan tanpa tanggal atau batas periode.
- `appendices/03-dokumentasi-indeks-kinerja-nasi-gerilya-dan-kompetitor-grabfood.tex:33-62` menyajikan indeks AOV dan indeks kunjungan harian.
- `appendices/03-dokumentasi-indeks-kinerja-nasi-gerilya-dan-kompetitor-grabfood.tex:65-86` menyajikan indeks kompetitor.
- `chapters/03-metodologi-penelitian.tex:27` menyatakan data sensitif disajikan dalam bentuk indeks/derivatif, tetapi rumus indeks belum dijelaskan.

**Dampak:**

Data sudah berguna, tetapi pembaca dapat bertanya:

- "Periode sebelumnya" itu bulan apa?
- "Saat ini" itu tanggal/bulan apa?
- Indeks AOV berbasis bulan apa sebagai 100?
- Data kompetitor berasal dari dokumen internal, platform, atau estimasi?
- Bagaimana perubahan persentase dihitung?

**Rekomendasi:**

Tambahkan catatan metodologis pada Bab III atau lampiran:

- Definisi periode:
  - contoh: "periode sebelumnya" = sebelum marketing plan high season, atau bulan tertentu.
  - "saat ini" = tanggal/bulan wawancara awal.
- Rumus indeks:
  - `Indeks periode t = (nilai periode t / nilai periode dasar) x 100`.
- Keterangan periode dasar:
  - AOV: Juli 2025 = 100,0.
  - Kunjungan harian: September 2025 = 100,0.
  - Kompetitor: Juli 2025 = 100,0.
- Jelaskan alasan data nominal disamarkan karena sensitif.
- Tambahkan sumber data yang lebih spesifik, misalnya "dashboard internal GrabFood Merchant" jika memang itu sumbernya.

## Temuan Prioritas Sedang

### 6. Bahasa "variabel dependen/independen" kurang ideal untuk penelitian kualitatif deskriptif

**Bukti:**

- `chapters/01-pendahuluan.tex:214` menyebut peningkatan penjualan sebagai "variabel dependen atau variabel hasil".
- `chapters/01-pendahuluan.tex:216` menyebut strategi pemasaran sebagai "variabel independen utama".
- Sementara `chapters/03-metodologi-penelitian.tex:4`, `154`, dan bagian lain menegaskan penelitian ini kualitatif deskriptif dan tidak menguji hubungan statistik.

**Dampak:**

Penggunaan istilah dependen/independen dapat membuat pembaca mengira penelitian ini kuantitatif atau menguji pengaruh. Padahal rumusan masalah dan metode sudah mengarah ke kualitatif-SWOT.

**Rekomendasi:**

Ganti istilah:

- "variabel dependen" -> "hasil yang ingin ditingkatkan" atau "masalah kinerja yang menjadi fokus penelitian".
- "variabel independen" -> "fokus analisis utama" atau "aspek strategis yang dianalisis".

### 7. Kerangka konseptual visual terlalu ringkas dibanding teori yang dibangun

**Bukti:**

- `chapters/02-tinjauan-pustaka.tex:159-163` menjelaskan alur teori yang mencakup pemasaran, strategi pemasaran, STP, 7P, OFDA, analisis lingkungan, dan SWOT.
- Namun diagram pada `chapters/02-tinjauan-pustaka.tex:221-226` hanya menampilkan alur ringkas: RM Nasi Gerilya -> Data Lapangan -> Analisis Lingkungan -> Matriks SWOT -> Alternatif Strategi -> Rumusan Strategi Pemasaran.
- Beberapa komponen teori justru terlihat dikomentari, misalnya landasan teori dan persaingan merchant pada `chapters/02-tinjauan-pustaka.tex:221-223`.

**Dampak:**

Secara naratif, kerangka konseptual sudah kuat. Namun visual diagram bisa dianggap terlalu sederhana karena STP, 7P, dan OFDA tidak tampak langsung, padahal ketiganya menjadi alat baca penting.

**Rekomendasi:**

Perkuat diagram dengan memasukkan minimal:

- Data lapangan: observasi, wawancara, ulasan, dokumentasi kinerja.
- Alat baca strategi: STP dan 7P.
- Konteks: GrabFood/OFDA.
- Analisis: internal-eksternal -> SWOT/IFAS-EFAS -> strategi SO/WO/ST/WT.

### 8. Fokus "meningkatkan penjualan" perlu dihubungkan sampai strategi akhir

**Bukti:**

- Judul menekankan "untuk meningkatkan penjualan".
- Rumusan masalah pada `chapters/01-pendahuluan.tex:224-230` berfokus pada faktor internal, faktor eksternal, dan strategi berdasarkan matriks SWOT.
- Bab III sudah menyebut pembelian ulang dan daya saing, tetapi belum memberi indikator operasional yang jelas untuk "meningkatkan penjualan".

**Dampak:**

Pada Bab IV nanti, strategi yang dihasilkan bisa terlihat hanya sebagai daftar SWOT, bukan strategi yang secara logis terkait dengan peningkatan penjualan.

**Rekomendasi:**

Di Bab III atau awal Bab IV, nyatakan bahwa peningkatan penjualan dibaca melalui indikator pendukung, misalnya:

- kenaikan jumlah pesanan/bungkus.
- peningkatan AOV.
- peningkatan repeat order.
- perbaikan rating/ulasan.
- peningkatan konversi dari kunjungan ke pembelian jika datanya tersedia.

Kemudian setiap strategi SWOT perlu diberi kaitan ke indikator tersebut.

### 9. Sumber ulasan pelanggan belum dijelaskan cukup rinci

**Bukti:**

- `chapters/01-pendahuluan.tex:220` merangkum review positif dan negatif.
- `appendices/01-observasi-grabfood-nasi-gerilya-dan-kompetitor.tex:237` menyajikan ringkasan opini konsumen.
- Belum ditemukan keterangan berapa ulasan yang dibaca, rentang tanggal ulasan, dan cara mengelompokkan opini positif/negatif.

**Dampak:**

Ringkasan ulasan tampak relevan, tetapi pembaca dapat meminta bukti prosedural: apakah ringkasan itu berasal dari 10 ulasan, 50 ulasan, ulasan terbaru, atau ulasan pilihan.

**Rekomendasi:**

Tambahkan catatan seperti:

- jumlah ulasan yang ditelaah.
- kriteria pemilihan ulasan, misalnya ulasan terbaru/ulasan berbintang rendah dan tinggi.
- tanggal observasi ulasan.
- kategori coding ulasan: rasa, porsi, harga, kemasan, akurasi pesanan, suhu makanan, layanan.

### 10. Wawancara awal belum mencantumkan tanggal, identitas peran, dan konteks pelaksanaan secara lengkap

**Bukti:**

- `appendices/02-wawancara-awal-pemilik-nasi-gerilya.tex:4` menyebut wawancara awal, tetapi tidak terlihat tanggal wawancara.
- Tabel pertanyaan dan jawaban dimulai pada `appendices/02-wawancara-awal-pemilik-nasi-gerilya.tex:12`, tetapi metadata wawancara tidak sedetail lampiran observasi GrabFood.

**Dampak:**

Lampiran wawancara sudah kaya, tetapi bukti akademiknya akan lebih kuat jika ada tanggal, lokasi/media wawancara, peran informan, dan status bahwa jawaban diringkas/diolah peneliti.

**Rekomendasi:**

Tambahkan tabel identitas wawancara awal:

- tanggal wawancara.
- lokasi atau media wawancara.
- informan: pemilik/pengelola.
- durasi jika tersedia.
- bentuk data: catatan wawancara/transkrip ringkas.
- keterangan: jawaban telah diringkas tanpa mengubah substansi.

### 11. Kata pengantar masih terlalu generik untuk skripsi final

**Bukti:**

- `frontmatter/kata-pengantar.tex:2-4` menyebut "Ibu Dosen Pembimbing" tanpa nama, dan menyatakan skripsi "dapat diselesaikan dengan baik".

**Dampak:**

Untuk dokumen final, kata pengantar perlu lebih personal dan lengkap. Untuk proposal, kata pengantar biasanya tidak selalu wajib atau bisa lebih singkat.

**Rekomendasi:**

- Isi nama dosen pembimbing jika sudah final.
- Tambahkan pihak akademik yang lazim dicantumkan sesuai format kampus.
- Jika masih proposal, pertimbangkan apakah kata pengantar memang perlu dimasukkan.

## Temuan Prioritas Rendah / Housekeeping

### 12. Ada file lock sementara Word di resource

**Bukti:**

`git status --short` menunjukkan:

`?? resource/foto-makanan/~$DATE TERBARU FORM C (Form Jadwal Pelaksanaan Sempro).docx`

**Dampak:**

File `~$...docx` biasanya file sementara Microsoft Word, bukan dokumen yang perlu masuk repositori/proyek.

**Rekomendasi:**

Hapus dari folder proyek jika Word sudah ditutup dan file tidak diperlukan. Jangan masukkan ke version control.

### 13. Banyak perubahan belum dicommit

**Bukti:**

`git status --short` menunjukkan banyak file termodifikasi, termasuk bab, lampiran, `referensi.bib`, `skripsi.cls`, dan PDF.

**Dampak:**

Audit ini dilakukan di atas kondisi kerja yang sudah berubah. Jika nanti ada revisi lanjutan, sulit membedakan perubahan Claude, perubahan manual, dan perubahan baru.

**Rekomendasi:**

Sebelum revisi besar berikutnya, simpan snapshot/commit dengan pesan yang jelas, misalnya:

`chore: snapshot after Claude thesis edits`

## Kekuatan Naskah Saat Ini

Walaupun laporan ini menyoroti kekurangan, ada beberapa hal yang sudah cukup baik:

1. Bab I memiliki alur masalah yang kuat dari konteks nasional, Kota Medan, platform online food delivery, sampai kasus Nasi Gerilya.
2. Data pra-survei cukup kaya: rating, ulasan, harga, promo, penjualan bulanan, AOV, kunjungan, indeks kompetitor, dan jarak kompetitor.
3. Rumusan masalah dan tujuan penelitian sudah selaras.
4. Bab II sudah relevan dengan judul: pemasaran, strategi pemasaran, STP, 7P, OFDA, lingkungan internal-eksternal, SWOT, IFAS/EFAS, dan penelitian terdahulu.
5. Bab III sudah konsisten secara pendekatan umum: kualitatif deskriptif, purposive informants, triangulasi, dan analisis SWOT.
6. Lampiran sangat membantu karena memberi bukti awal yang dapat ditelusuri.
7. Secara teknis, LaTeX berjalan baik dan tidak ada masalah sitasi/referensi fatal.

## Checklist Perbaikan yang Disarankan

### Wajib sebelum dokumen dikirim sebagai skripsi lengkap

- [ ] Isi Bab IV.
- [ ] Isi Bab V.
- [ ] Ganti abstrak Indonesia.
- [ ] Ganti abstract Inggris.
- [ ] Ganti kata kunci Indonesia dan Inggris.
- [ ] Samakan judul penelitian di metadata, Bab I, dan semua lampiran.
- [ ] Tambahkan detail operasional informan pada Bab III.
- [ ] Tambahkan prosedur coding dan klasifikasi SWOT.
- [ ] Tambahkan skala bobot/rating IFAS-EFAS.
- [ ] Jelaskan rumus dan periode dasar data indeks.

### Wajib sebelum seminar proposal jika memakai `proposal.pdf`

- [ ] Pastikan yang dikirim adalah `proposal.pdf`, bukan `main.pdf`.
- [ ] Samakan judul pada lampiran.
- [ ] Perjelas tanggal wawancara awal.
- [ ] Tambahkan target jumlah informan dan strategi jika informan kompetitor tidak tersedia.
- [ ] Jelaskan data indeks dan periode "sebelumnya/saat ini".
- [ ] Pertimbangkan mengganti istilah "variabel dependen/independen" agar lebih cocok dengan kualitatif.

### Bagus untuk diperbaiki setelah kebutuhan utama selesai

- [ ] Perkuat diagram kerangka konseptual agar STP, 7P, dan OFDA terlihat.
- [ ] Tambahkan prosedur telaah ulasan pelanggan.
- [ ] Rapikan kata pengantar jika dokumen final.
- [ ] Hapus file temporary Word `~$...docx`.
- [ ] Simpan snapshot git sebelum revisi besar berikutnya.

## Catatan Akhir

Jika target saat ini adalah seminar proposal, naskah sudah memiliki fondasi yang layak, tetapi masih perlu merapikan konsistensi judul dan mempertegas metodologi. Jika targetnya skripsi lengkap, dokumen belum siap karena Bab IV, Bab V, abstrak, dan kata kunci masih belum selesai.
