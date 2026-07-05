# Checklist Data Susulan

Tanggal susun: 2026-07-05

Dokumen ini dipakai jika salah satu dari 4 gap berhasil dilengkapi setelah Bab IV/V versi awal disusun. Prinsipnya: data masuk ke `resource/` lebih dulu, diberi kode, diverifikasi, lalu dipakai untuk revisi.

## 1. Jika Wawancara Pemilik Utama Didapat

Kode yang disarankan: `W-PM-YYYYMMDD`

Lokasi:

`resource/05-fieldwork/01-wawancara/YYYYMMDD-wawancara-pemilik/`

Struktur:

- `raw/audio/` untuk rekaman asli jika ada.
- `transcripts/` untuk transkrip bersih.
- `notes/` untuk catatan manual jika tidak ada audio.
- `manifest/` untuk manifest file dan manifest sumber.
- `compiled/analysis/` untuk ringkasan/koding wawancara.

Pertanyaan minimum:

1. Peran GrabFood terhadap penjualan saat ini.
2. Menu yang paling diprioritaskan di GrabFood.
3. Target pelanggan utama di GrabFood.
4. Strategi harga, promo, voucher, dan ongkir.
5. Pertimbangan margin, HPP, pajak, dan komisi platform.
6. Kendala stok, dapur, packing, driver, dan peak hour.
7. Evaluasi rating, ulasan, foto menu, dan deskripsi menu.
8. Kompetitor utama yang paling diperhatikan.
9. Data pelanggan, repeat order, dan rencana loyalty.
10. Prioritas strategi 3 sampai 6 bulan ke depan.

Update yang harus dilakukan setelah data masuk:

- Tambahkan sumber ke `W-INT-20260705-source-manifest.csv` atau buat manifest dataset baru.
- Tambahkan kode temuan `TW-PM-##` di file koding.
- Update `TRI-20260705-source-map.md`.
- Revisi IFAS/EFAS jika ada validasi bobot/rating.
- Revisi Bab IV bagian strategi manajerial dan Bab V rekomendasi.

## 2. Jika Data Kinerja Penjualan Didapat

Kode yang disarankan: `D-KIN-YYYYMMDD`

Lokasi:

`resource/05-fieldwork/03-dokumentasi-usaha/YYYYMMDD-kinerja-grabfood/`

Struktur:

- `raw/` untuk file asli seperti Excel, PDF, screenshot dashboard, atau export platform.
- `processed/` untuk tabel bersih.
- `manifest/` untuk daftar file, periode data, sumber, dan hash.
- `compiled/` untuk ringkasan tabel/grafik.

Kolom minimum yang berguna:

- periode tanggal;
- jumlah order GrabFood;
- omzet GrabFood;
- average order value;
- jumlah pelanggan baru;
- repeat order jika ada;
- promo/voucher yang berjalan;
- biaya promo/komisi jika ada;
- rating/komplain jika ada;
- catatan event tertentu seperti high season atau promo.

Aturan analisis:

- Jika data hanya satu periode, gunakan sebagai profil kinerja, bukan tren.
- Jika ada minimal dua periode, boleh membahas perubahan.
- Jika ada periode sebelum dan sesudah strategi, baru boleh hati-hati membahas indikasi dampak.
- Jangan menulis kausalitas jika tidak ada pembanding yang jelas.

Update yang harus dilakukan:

- Buat manifest `D-KIN-YYYYMMDD-manifest.csv`.
- Buat ringkasan `D-KIN-YYYYMMDD-summary.md`.
- Tambahkan faktor `TD-KIN-##` di koding.
- Revisi klaim "berpotensi meningkatkan penjualan" jika data memang mendukung.

## 3. Jika Tambahan Data Pelanggan Didapat

Kode yang disarankan:

- `S-PL-YYYYMMDD` untuk angket/survei pelanggan.
- `W-PL-YYYYMMDD` untuk wawancara pelanggan.

Lokasi:

`resource/05-fieldwork/04-survei-pelanggan/YYYYMMDD-.../`

Target minimum:

- 5 sampai 10 responden tambahan untuk memperkaya pola kualitatif.
- Minimal mencakup pelanggan yang pernah membeli Nasi Gerilya melalui GrabFood.
- Jika memungkinkan, pisahkan pekerja, mahasiswa, pelanggan sekitar, dan pelanggan repeat order.

Tema minimum:

1. Alasan memilih Nasi Gerilya.
2. Peran rating, foto, harga, promo, dan jarak.
3. Menu yang paling diingat.
4. Pengalaman rasa, porsi, dan kemasan.
5. Pengalaman catatan khusus atau item kurang.
6. Perbandingan dengan kompetitor.
7. Alasan repeat order.
8. Hal yang membuat batal membeli.

Update yang harus dilakukan:

- Update manifest survei.
- Tambahkan kode `TS-PL-##` atau `TW-PL-##`.
- Revisi bagian pelanggan dan triangulasi.
- Jika jumlah cukup, boleh membuat tabel frekuensi sederhana, tetapi tetap hindari generalisasi statistik besar jika sampelnya non-probability.

## 4. Jika Tambahan Wawancara Kompetitor Didapat

Kode yang disarankan: `W-KP-YYYYMMDD`

Lokasi:

`resource/05-fieldwork/01-wawancara/YYYYMMDD-wawancara-kompetitor-<nama>/`

Target minimum:

- Minimal 1 sampai 3 kompetitor tambahan, terutama yang sudah ada dalam observasi `O-KP-20260619`.
- Prioritas: Pondok Gurih, Garuda, Paripurna, Dendeng Batokok, atau kompetitor lain yang sering disebut pelanggan.

Tema minimum:

1. Kontribusi GrabFood terhadap order.
2. Menu online paling sering dipesan.
3. Jam ramai.
4. Strategi promo dan harga.
5. Cara update stok di platform.
6. Packing dan pengecekan item.
7. Masalah driver atau antrean.
8. Keluhan pelanggan.
9. Keunggulan utama menurut pihak kompetitor.

Update yang harus dilakukan:

- Tambahkan sumber ke manifest wawancara.
- Tambahkan kode `TW-KP-##`.
- Revisi faktor threat/opportunity.
- Pisahkan jelas antara bukti visual kompetitor dan bukti operasional kompetitor.

## Verifikasi Setelah Data Baru Masuk

Setelah data baru ditambahkan:

1. Pastikan semua file punya manifest.
2. Pastikan path manifest valid.
3. Tambahkan kode temuan sebelum mengubah Bab IV.
4. Update `TRI-20260705-source-map.md`.
5. Revisi `GAP-20260705-gap-register.csv`: ubah status dari gap aktif menjadi gap tertutup sebagian atau tertutup.
6. Revisi IFAS/EFAS dan SWOT hanya pada faktor yang terdampak.
7. Di Bab V, ubah keterbatasan sesuai data yang sudah benar-benar masuk.
