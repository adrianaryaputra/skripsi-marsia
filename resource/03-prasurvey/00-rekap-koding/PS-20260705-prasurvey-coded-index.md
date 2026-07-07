# Koding Detail Pra-Survei

Tanggal penyusunan: 2026-07-05  
Fokus: Strategi pemasaran Rumah Makan Nasi Gerilya pada platform GrabFood untuk meningkatkan penjualan berdasarkan analisis SWOT.  
Status: koding detail atas data pra-survei yang tersedia di `resource/03-prasurvey/`.

## Jawaban Singkat Kelengkapan

Resource sudah jauh lebih rapi dan sudah cukup untuk menyusun analisis Bab IV/V secara provisional, tetapi belum dapat disebut benar-benar lengkap secara final. Empat gap yang sudah dicatat sebelumnya tetap membatasi klaim akhir: wawancara pemilik terbaru belum ada, data kinerja terbaru belum ada, jumlah responden pelanggan masih terbatas, dan wawancara kompetitor belum merata.

Dengan artefak ini, prasurvey sudah dikoding lebih detail agar bisa dipakai sebagai dasar latar belakang, validasi awal, penyusunan instrumen, dan jembatan menuju triangulasi data lapangan. Klaim final tetap harus mengikuti level bukti: data pra-survei dipakai sebagai konteks awal, sedangkan kesimpulan utama harus ditopang data lapangan Juni-Juli 2026 atau diberi catatan keterbatasan.

## Output Koding

| File | Fungsi |
|---|---|
| `PS-20260705-prasurvey-coded-manifest.csv` | Manifest koding detail seluruh sumber pra-survei. |
| `PS-20260705-prasurvey-triangulation-map.md` | Peta hubungan prasurvey dengan data lapangan, Bab IV/V, IFAS/EFAS, dan SWOT. |
| `README.md` | Panduan ringkas folder rekap koding prasurvey. |

## Ringkasan Jumlah Kode

| Kelompok kode | Jumlah | Isi utama |
|---|---:|---|
| `PS-WPM` | 24 | Wawancara awal pemilik: profil, kanal, pelanggan, promo, kendala, peluang, ancaman. |
| `PS-GF` | 39 | Observasi GrabFood 04 April 2026: rating, harga, promo, menu, bukti crop. |
| `PS-KIN` | 41 | Dokumentasi kinerja: penjualan bulanan, AOV, kunjungan, indeks kompetitor, jarak kompetitor. |
| `PS-PROD` | 24 | Foto produk dan storefront sebagai bukti visual product/physical evidence. |
| Total | 128 | Seluruh kode temuan pra-survei yang siap dirujuk. |

## Temuan Inti Pra-Survei

| Kode temuan | Ringkasan | Implikasi analisis |
|---|---|---|
| `PS-WPM-003` | GrabFood disebut sebagai kanal utama dan menyumbang lebih dari 50 persen penjualan menurut pemilik. | Menguatkan fokus penelitian pada GrabFood, tetapi perlu data terbaru untuk klaim kuantitatif final. |
| `PS-WPM-007` dan `PS-WPM-008` | Pelanggan baru naik, repeat order dan reactivated user turun. | Mendukung isu loyalitas dan kebutuhan strategi repeat order. |
| `PS-WPM-011`, `PS-GF-022`, `PS-PROD-003`, `PS-PROD-014` | Dendeng dan ayam pop/ayam pop putih kuat sebagai kandidat hero menu. | Mendukung positioning produk unggulan dan strategi product lineup. |
| `PS-WPM-014` dan `PS-WPM-015` | Promo berpengaruh, tetapi margin, pajak, HPP, dan net profit perlu dijaga. | Mendukung rekomendasi promo selektif dan berbasis margin. |
| `PS-WPM-017` sampai `PS-WPM-020` | Masalah stok, antrean driver, kapasitas penggorengan, konsistensi rasa, dan pesanan tidak sesuai request sudah muncul sejak pra-survei. | Menguatkan kelemahan internal yang kemudian muncul lagi pada data lapangan. |
| `PS-GF-001` | Reputasi awal kuat: rating 4.7 dan 4,361 penilaian. | Menjadi kekuatan reputasi digital, perlu diperbarui dengan observasi Juni 2026. |
| `PS-GF-031` sampai `PS-GF-037` | Ada banyak peluang add-on: lauk tambahan, sambal, kuah, minuman, produk kemasan, dan menu premium. | Mendukung strategi upselling, bundling, dan peningkatan AOV. |
| `PS-KIN-013` dan `PS-KIN-041` | Penjualan bulanan melemah setelah puncak Maret 2025, sementara AOV/kunjungan naik pada sebagian periode. | Mengarah pada isu konversi, harga, promosi, dan pengalaman layanan. |
| `PS-KIN-029` | Indeks Nasi Gerilya turun -29.6 persen pada Juli-Oktober 2025, lebih tajam dari kompetitor dalam tabel. | Mendukung urgensi strategi peningkatan penjualan, tetapi perlu data terbaru. |
| `PS-KIN-035` dan `PS-KIN-036` | Dendeng Batokok paling dekat, sedangkan Istana Krakatau tumbuh paling tinggi dalam indeks pembanding. | Mendukung pemilihan kompetitor yang perlu dibaca lebih serius pada triangulasi. |

## Koding SWOT Awal

| Kategori | Kode pendukung prasurvey | Faktor awal |
|---|---|---|
| Strength | `PS-WPM-003`, `PS-WPM-009`, `PS-WPM-010`, `PS-WPM-011`, `PS-GF-001`, `PS-GF-003`, `PS-PROD-003`, `PS-PROD-014` | GrabFood menjadi kanal utama, reputasi digital kuat, rasa otentik, brand recognition, dan menu unggulan. |
| Weakness | `PS-WPM-008`, `PS-WPM-015`, `PS-WPM-017`, `PS-WPM-018`, `PS-WPM-019`, `PS-WPM-020`, `PS-KIN-013`, `PS-KIN-029` | Repeat order turun, harga perlu dihitung ulang, stok/antrean/konsistensi rasa bermasalah, dan kinerja relatif melemah. |
| Opportunity | `PS-WPM-013`, `PS-WPM-022`, `PS-GF-004`, `PS-GF-031`, `PS-GF-032`, `PS-GF-034`, `PS-KIN-018`, `PS-KIN-021` | Promo, product lineup, add-on, sambal kemasan, menu digital/visual produk, AOV, dan kunjungan dapat dioptimalkan. |
| Threat | `PS-WPM-016`, `PS-WPM-024`, `PS-KIN-023`, `PS-KIN-026`, `PS-KIN-035`, `PS-KIN-036`, `PS-KIN-039`, `PS-KIN-040` | Ongkir, sensitivitas harga, beban promo, dan kompetitor dengan jarak/reputasi/performa kuat. |

## Aturan Pakai di Bab IV dan V

1. Gunakan kode `PS-*` sebagai konteks awal atau bukti pendukung, bukan satu-satunya dasar kesimpulan final.
2. Untuk klaim utama Bab IV, sandingkan `PS-*` dengan kode lapangan seperti `TW-*`, `TO-GF-*`, `TO-KP-*`, `TS-PL-*`, dan `TD-KIN-*`.
3. Jika data terbaru belum tersedia, gunakan kalimat aman seperti "berdasarkan data pra-survei" atau "menunjukkan indikasi awal".
4. Hindari menyatakan penyebab penurunan penjualan hanya dari tabel kinerja; gunakan sebagai pola deskriptif sampai ada triangulasi pemilik/data transaksi terbaru.
5. Foto produk `PS-PROD-*` membuktikan aset visual dan variasi produk, bukan membuktikan menu paling laku.

## Bagian yang Masih Belum Penuh

| Area | Status | Dampak ke analisis |
|---|---|---|
| Wawancara pemilik terbaru | Belum ada | Faktor strategis dari pemilik hanya kuat sebagai konteks awal; perlu catatan keterbatasan. |
| Data kinerja terbaru 2026 | Belum ada | Analisis tren penjualan terbaru harus memakai bahasa provisional. |
| Responden pelanggan | Masih terbatas | Perspektif pelanggan dapat dipakai sebagai indikasi, bukan generalisasi kuat. |
| Kompetitor | Belum semua diwawancarai | Triangulasi ancaman kompetitor cukup untuk arah strategi, tetapi belum merata. |

Kesimpulan kerja: resource sudah siap untuk menyusun analisis lengkap dengan batas klaim yang jelas. Koding prasurvey sekarang cukup detail untuk menutup ingatan kerja dan memudahkan revisi jika empat gap tersebut nanti berhasil dilengkapi.
