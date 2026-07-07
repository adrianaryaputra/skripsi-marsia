# Coded Data Observasi GrabFood Nasi Gerilya - 13 Juni 2026

File ini adalah indeks data observasi yang sudah dipotong per bukti kecil agar mudah dipakai untuk Bab IV, triangulasi, IFAS/EFAS, dan analisis SWOT.

Catatan perapian 2026-06-14: seluruh crop granular pada `coded-data/` sudah dirapikan ulang dengan pengecekan visual manual. Kolom koordinat `crop_x`, `crop_y`, `crop_w`, dan `crop_h` pada manifest adalah koordinat final untuk versi evidence ini.

## File Utama

- `O-GF-20260613-coded-manifest.csv`: manifest utama berisi kode data, tipe, nilai terbaca, status, rating, harga, sumber screenshot, koordinat crop, catatan, dan kegunaan analisis.
- `coded-data/`: folder crop granular per item data.
- `compiled/O-GF-20260613-coded-contact-sheet.jpg`: ringkasan visual semua crop coded.

## Ringkasan Data Terkode

| Kelompok | Jumlah crop | Isi |
|---|---:|---|
| menu-harga-foto | 24 | Menu, harga, foto produk, menu terlaris, menu promo, minuman, sambal, dan tambahan. |
| profile-rating | 4 | Nama toko, status toko/jarak, rating, jumlah penilaian, dan ringkasan ulasan AI. |
| promo-voucher | 19 | Promo/voucher aktif yang terlihat pada halaman Promo GrabFood. |
| ringkasan-harga | 3 | Bukti rentang harga bawah/atas dan pembedaan harga tersedia vs tidak tersedia. |
| sold-out | 6 | Menu/produk yang terlihat berstatus `Nggak tersedia`. |
| ulasan-negatif-netral | 10 | 10 ulasan negatif/netral yang bisa dipakai untuk tema kelemahan/risiko. |
| ulasan-positif | 10 | 10 ulasan positif yang bisa dipakai untuk tema kekuatan. |

## Nilai Penting Yang Sudah Terbaca

- Nama toko: **Nasi Gerilya - Glugur Kota**.
- Rating toko: **4,7** dari **4.584 penilaian**.
- Status saat screenshot profil: **Tutup, buka besok**; jarak terlihat **6,6 km**.
- Promo/voucher aktif yang terlihat dan dikodekan: **19 crop**.
- Menu terlaris yang terlihat: **Nasi Padang Rendang Sapi**, **Nasi Padang Ayam Goreng Bumbu**, dan **Nasi Padang Ayam Rendang**.
- Rentang harga terlihat seluruh observasi: **Rp1.100-Rp275.000**; harga tertinggi Rp275.000 berstatus tidak tersedia.
- Rentang harga item tersedia yang dikodekan: **Rp1.100-Rp72.000**.
- Rentang harga paket/menu utama tersedia yang dikodekan: **Rp27.500-Rp72.000**.
- Menu/produk `Nggak tersedia` yang dikodekan: **6 crop**.
- Ulasan positif yang dikodekan: **10 crop**; tema utama rasa enak, porsi besar, fresh, bersih, request dipenuhi, dan pelanggan rutin.
- Ulasan negatif/netral yang dikodekan: **10 crop**; tema utama salah item, item kurang lengkap, kuah/add-on tidak diberikan, persepsi harga/porsi, kualitas/kesegaran, koordinasi staf, dan risiko pengalaman pascakonsumsi.

## Skema Kode

- `GF-PROFILE-*`: identitas merchant, status, jarak, dan ringkasan profil.
- `GF-RATING-*`: rating dan jumlah penilaian.
- `GF-PROMO-*`: promo/voucher yang terlihat.
- `GF-MENU-*`: menu, harga, foto produk, menu promo, terlaris, minuman, sambal, dan tambahan.
- `GF-SOLDOUT-*`: menu atau produk yang terlihat tidak tersedia.
- `GF-PRICE-RANGE-*`: bukti ringkas untuk menyusun rentang harga.
- `GF-REV-POS-*`: ulasan positif.
- `GF-REV-NEG-*`: ulasan negatif atau netral.

## Daftar Data Terkode

| Kode | Kelompok | Nilai/Keterangan | Status | Rating | Harga | File crop |
|---|---|---|---|---:|---:|---|
| GF-PROFILE-001 | profile-rating | Nasi Gerilya - Glugur Kota | terlihat |  |  | `coded-data/profile-rating/gf-profile-001-nasi-gerilya-glugur-kota.jpeg` |
| GF-PROFILE-002 | profile-rating | Tutup; buka besok; jarak 6.6 km; badge Grab bintang 5 dan centang | terlihat |  |  | `coded-data/profile-rating/gf-profile-002-tutup-buka-besok-jarak-6-6-km-badge-grab-bintang-5-dan-centang.jpeg` |
| GF-RATING-001 | profile-rating | Rating 4.7 dari 4.584 penilaian | terlihat | 4.7 |  | `coded-data/profile-rating/gf-rating-001-rating-4-7-dari-4-584-penilaian.jpeg` |
| GF-REVIEW-SUMMARY-001 | profile-rating | AI summary: rasa enak, porsi besar, bahan segar, kemasan rapi, menu beragam, harga terjangkau | terlihat |  |  | `coded-data/profile-rating/gf-review-summary-001-ai-summary-rasa-enak-porsi-besar-bahan-segar-kemasan-rapi-menu-berag.jpeg` |
| GF-PROMO-001 | promo-voucher | Diskon 17% hingga Rp50.000; tanpa belanja minimum | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-001-diskon-17-hingga-rp50-000-tanpa-belanja-minimum.jpeg` |
| GF-PROMO-002 | promo-voucher | Diskon Rp15.000 BSI; minimum belanja terlihat terpotong | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-002-diskon-rp15-000-bsi-minimum-belanja-terlihat-terpotong.jpeg` |
| GF-PROMO-003 | promo-voucher | Diskon Rp10.000 BTN; minimum belanja terlihat terpotong | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-003-diskon-rp10-000-btn-minimum-belanja-terlihat-terpotong.jpeg` |
| GF-PROMO-004 | promo-voucher | Diskon Rp25.000 Bank Mega Syariah; minimum belanja terlihat terpotong | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-004-diskon-rp25-000-bank-mega-syariah-minimum-belanja-terlihat-terpotong.jpeg` |
| GF-PROMO-005 | promo-voucher | Diskon Rp4.500 untuk Gulai Cincang Gerilya | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-005-diskon-rp4-500-untuk-gulai-cincang-gerilya.jpeg` |
| GF-PROMO-006 | promo-voucher | Diskon Rp15.000 Bank Mega; minimum belanja terlihat terpotong | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-006-diskon-rp15-000-bank-mega-minimum-belanja-terlihat-terpotong.jpeg` |
| GF-PROMO-007 | promo-voucher | Diskon Rp25.000 Bank Mega; minimum belanja terlihat terpotong | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-007-diskon-rp25-000-bank-mega-minimum-belanja-terlihat-terpotong.jpeg` |
| GF-PROMO-008 | promo-voucher | Diskon 5% untuk Group Order; minimum orang bergabung 3 ke 6 | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-008-diskon-5-untuk-group-order-minimum-orang-bergabung-3-ke-6.jpeg` |
| GF-PROMO-009 | promo-voucher | Diskon Rp4.000 Bank Mega; minimum belanja terlihat terpotong | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-009-diskon-rp4-000-bank-mega-minimum-belanja-terlihat-terpotong.jpeg` |
| GF-PROMO-010 | promo-voucher | Diskon Rp10.000 Bank Mega; minimum belanja terlihat terpotong | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-010-diskon-rp10-000-bank-mega-minimum-belanja-terlihat-terpotong.jpeg` |
| GF-PROMO-011 | promo-voucher | Diskon ongkir Rp3.000; tanpa belanja minimum | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-011-diskon-ongkir-rp3-000-tanpa-belanja-minimum.jpeg` |
| GF-PROMO-012 | promo-voucher | Diskon Rp25.000 BSI; minimum belanja terlihat terpotong | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-012-diskon-rp25-000-bsi-minimum-belanja-terlihat-terpotong.jpeg` |
| GF-PROMO-013 | promo-voucher | Diskon Rp25.000 Raya Bank; minimum belanja terlihat terpotong | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-013-diskon-rp25-000-raya-bank-minimum-belanja-terlihat-terpotong.jpeg` |
| GF-PROMO-014 | promo-voucher | Diskon 25% s.d. Rp100.000; minimum belanja Rp30.000 | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-014-diskon-25-s-d-rp100-000-minimum-belanja-rp30-000.jpeg` |
| GF-PROMO-015 | promo-voucher | Diskon Rp15.000 BTN; minimum belanja terlihat terpotong | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-015-diskon-rp15-000-btn-minimum-belanja-terlihat-terpotong.jpeg` |
| GF-PROMO-016 | promo-voucher | Diskon ongkir Rp8.000; minimum belanja terlihat terpotong | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-016-diskon-ongkir-rp8-000-minimum-belanja-terlihat-terpotong.jpeg` |
| GF-PROMO-017 | promo-voucher | Diskon ongkir Rp8.000; minimum belanja terlihat terpotong | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-017-diskon-ongkir-rp8-000-minimum-belanja-terlihat-terpotong.jpeg` |
| GF-PROMO-018 | promo-voucher | Diskon Rp20.000 SBI card; minimum belanja terlihat terpotong | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-018-diskon-rp20-000-sbi-card-minimum-belanja-terlihat-terpotong.jpeg` |
| GF-PROMO-019 | promo-voucher | Diskon Rp20.000 Bank Jakarta; minimum belanja terlihat terpotong | aktif_terlihat |  |  | `coded-data/promo-voucher/gf-promo-019-diskon-rp20-000-bank-jakarta-minimum-belanja-terlihat-terpotong.jpeg` |
| GF-MENU-TERATAS-001 | menu-harga-foto | Nasi Padang Bungkus Gulai Cincang; Rp50.500 dari Rp55.000 | tersedia_promo |  | 50500 | `coded-data/menu-harga-foto/gf-menu-teratas-001-nasi-padang-bungkus-gulai-cincang-rp50-500-dari-rp55-000.jpeg` |
| GF-MENU-TERATAS-002 | menu-harga-foto | Nasi Padang Kari Kambing GERILYA; Rp72.000 | tersedia |  | 72000 | `coded-data/menu-harga-foto/gf-menu-teratas-002-nasi-padang-kari-kambing-gerilya-rp72-000.jpeg` |
| GF-MENU-TERATAS-003 | menu-harga-foto | Nasi Padang Dendeng Sapi Bakar GERILYA; Rp56.000 | tersedia |  | 56000 | `coded-data/menu-harga-foto/gf-menu-teratas-003-nasi-padang-dendeng-sapi-bakar-gerilya-rp56-000.jpeg` |
| GF-MENU-TERLARIS-001 | menu-harga-foto | Nasi Padang Rendang Sapi GERILYA; Rp56.000; label Terlaris | tersedia |  | 56000 | `coded-data/menu-harga-foto/gf-menu-terlaris-001-nasi-padang-rendang-sapi-gerilya-rp56-000-label-terlaris.jpeg` |
| GF-MENU-TERLARIS-002 | menu-harga-foto | Nasi Padang Ayam Goreng Bumbu GERILYA; Rp45.000; label Terlaris | tersedia |  | 45000 | `coded-data/menu-harga-foto/gf-menu-terlaris-002-nasi-padang-ayam-goreng-bumbu-gerilya-rp45-000-label-terlaris.jpeg` |
| GF-MENU-TERLARIS-003 | menu-harga-foto | Nasi Padang Ayam Rendang GERILYA; Rp46.000; label Terlaris | tersedia |  | 46000 | `coded-data/menu-harga-foto/gf-menu-terlaris-003-nasi-padang-ayam-rendang-gerilya-rp46-000-label-terlaris.jpeg` |
| GF-MENU-PROMO-002 | menu-harga-foto | Nasi Padang Gulai Ayam Kalasan GERILYA; Rp41.500 dari Rp46.000 | tersedia_promo |  | 41500 | `coded-data/menu-harga-foto/gf-menu-promo-002-nasi-padang-gulai-ayam-kalasan-gerilya-rp41-500-dari-rp46-000.jpeg` |
| GF-MENU-UTAMA-001 | menu-harga-foto | Nasi Padang Ayam Bakar GERILYA; Rp45.000 | tersedia |  | 45000 | `coded-data/menu-harga-foto/gf-menu-utama-001-nasi-padang-ayam-bakar-gerilya-rp45-000.jpeg` |
| GF-MENU-UTAMA-002 | menu-harga-foto | Nasi Padang Cumi Nagih GERILYA; Rp70.000 | tersedia |  | 70000 | `coded-data/menu-harga-foto/gf-menu-utama-002-nasi-padang-cumi-nagih-gerilya-rp70-000.jpeg` |
| GF-MENU-UTAMA-003 | menu-harga-foto | Nasi Padang Ikan Lele Goreng Panas GERILYA; Rp39.000 | tersedia |  | 39000 | `coded-data/menu-harga-foto/gf-menu-utama-003-nasi-padang-ikan-lele-goreng-panas-gerilya-rp39-000.jpeg` |
| GF-MENU-UTAMA-004 | menu-harga-foto | Nasi Padang Ikan Tongkol Tuna Goreng Panas GERILYA; Rp48.000 | tersedia |  | 48000 | `coded-data/menu-harga-foto/gf-menu-utama-004-nasi-padang-ikan-tongkol-tuna-goreng-panas-gerilya-rp48-000.jpeg` |
| GF-MENU-UTAMA-005 | menu-harga-foto | Nasi Padang Ikan Gembung Goreng GERILYA; Rp50.000 | tersedia |  | 50000 | `coded-data/menu-harga-foto/gf-menu-utama-005-nasi-padang-ikan-gembung-goreng-gerilya-rp50-000.jpeg` |
| GF-MENU-UTAMA-006 | menu-harga-foto | Nasi Padang Ikan Nila Goreng GERILYA; Rp43.000 | tersedia |  | 43000 | `coded-data/menu-harga-foto/gf-menu-utama-006-nasi-padang-ikan-nila-goreng-gerilya-rp43-000.jpeg` |
| GF-MENU-UTAMA-007 | menu-harga-foto | Nasi Padang Telur Dadar GERILYA; Rp32.000 | tersedia |  | 32000 | `coded-data/menu-harga-foto/gf-menu-utama-007-nasi-padang-telur-dadar-gerilya-rp32-000.jpeg` |
| GF-MENU-UTAMA-008 | menu-harga-foto | Nasi Padang Berkedel Kentang GERILYA; Rp37.400 | tersedia |  | 37400 | `coded-data/menu-harga-foto/gf-menu-utama-008-nasi-padang-berkedel-kentang-gerilya-rp37-400.jpeg` |
| GF-MENU-UTAMA-009 | menu-harga-foto | Nasi Padang Sayur Polos GERILYA; Rp27.500 | tersedia |  | 27500 | `coded-data/menu-harga-foto/gf-menu-utama-009-nasi-padang-sayur-polos-gerilya-rp27-500.jpeg` |
| GF-MENU-MINUMAN-001 | menu-harga-foto | Air Mineral 400ml; Rp13.200 | tersedia |  | 13200 | `coded-data/menu-harga-foto/gf-menu-minuman-001-air-mineral-400ml-rp13-200.jpeg` |
| GF-MENU-MINUMAN-002 | menu-harga-foto | Es Teh Tawar; Rp13.200 | tersedia |  | 13200 | `coded-data/menu-harga-foto/gf-menu-minuman-002-es-teh-tawar-rp13-200.jpeg` |
| GF-MENU-MINUMAN-003 | menu-harga-foto | Es Teh Manis; Rp15.950 | tersedia |  | 15950 | `coded-data/menu-harga-foto/gf-menu-minuman-003-es-teh-manis-rp15-950.jpeg` |
| GF-MENU-MINUMAN-004 | menu-harga-foto | Es Jeruk Limau; Rp22.000 | tersedia |  | 22000 | `coded-data/menu-harga-foto/gf-menu-minuman-004-es-jeruk-limau-rp22-000.jpeg` |
| GF-MENU-TAMBAHAN-001 | menu-harga-foto | Nambah KUAH CAMPUR; Rp2.500 | tersedia |  | 2500 | `coded-data/menu-harga-foto/gf-menu-tambahan-001-nambah-kuah-campur-rp2-500.jpeg` |
| GF-MENU-TAMBAHAN-002 | menu-harga-foto | Nambah Kuah Gulai Kuning; Rp1.100 | tersedia |  | 1100 | `coded-data/menu-harga-foto/gf-menu-tambahan-002-nambah-kuah-gulai-kuning-rp1-100.jpeg` |
| GF-MENU-SAMBAL-001 | menu-harga-foto | GERILYA Sambal Hijau; Rp17.500 | tersedia |  | 17500 | `coded-data/menu-harga-foto/gf-menu-sambal-001-gerilya-sambal-hijau-rp17-500.jpeg` |
| GF-MENU-SAMBAL-002 | menu-harga-foto | GERILYA Sambal Andaliman Getir Kemasan; Rp38.500 | tersedia |  | 38500 | `coded-data/menu-harga-foto/gf-menu-sambal-002-gerilya-sambal-andaliman-getir-kemasan-rp38-500.jpeg` |
| GF-SOLDOUT-001 | sold-out | Gulai Merah Kepala Ikan GERILYA L; Rp275.000; Nggak tersedia | nggak_tersedia |  | 275000 | `coded-data/sold-out/gf-soldout-001-gulai-merah-kepala-ikan-gerilya-l-rp275-000-nggak-tersedia.jpeg` |
| GF-SOLDOUT-002 | sold-out | Gulai Merah Kepala Ikan GERILYA M; Rp248.050; Nggak tersedia | nggak_tersedia |  | 248050 | `coded-data/sold-out/gf-soldout-002-gulai-merah-kepala-ikan-gerilya-m-rp248-050-nggak-tersedia.jpeg` |
| GF-SOLDOUT-003 | sold-out | Nasi Padang Gembung Kuring Bakar GERILYA; Rp47.850; Nggak tersedia | nggak_tersedia |  | 47850 | `coded-data/sold-out/gf-soldout-003-nasi-padang-gembung-kuring-bakar-gerilya-rp47-850-nggak-tersedia.jpeg` |
| GF-SOLDOUT-004 | sold-out | Nasi Padang Ayam Pop Sauce Creamy GERILYA; Rp46.000; Nggak tersedia | nggak_tersedia |  | 46000 | `coded-data/sold-out/gf-soldout-004-nasi-padang-ayam-pop-sauce-creamy-gerilya-rp46-000-nggak-tersedia.jpeg` |
| GF-SOLDOUT-005 | sold-out | GERILYA Sambal Cumi Nagih Kemasan; Rp38.500; Nggak tersedia | nggak_tersedia |  | 38500 | `coded-data/sold-out/gf-soldout-005-gerilya-sambal-cumi-nagih-kemasan-rp38-500-nggak-tersedia.jpeg` |
| GF-SOLDOUT-006 | sold-out | GERILYA Sambal Tuna Asap Keumamah Aceh Kemasan; Rp38.500; Nggak tersedia | nggak_tersedia |  | 38500 | `coded-data/sold-out/gf-soldout-006-gerilya-sambal-tuna-asap-keumamah-aceh-kemasan-rp38-500-nggak-tersedia.jpeg` |
| GF-PRICE-RANGE-001 | ringkasan-harga | Rentang harga observasi: Rp1.100 sampai Rp275.000; tersedia: Rp1.100 sampai Rp72.000; paket nasi padang tersedia: Rp27.500 sampai Rp72.000 | ringkasan_observasi |  |  | `coded-data/ringkasan-harga/gf-price-range-001-rentang-harga-observasi-rp1-100-sampai-rp275-000-tersedia-rp1-100-sampa.jpeg` |
| GF-PRICE-RANGE-002 | ringkasan-harga | Harga tertinggi terlihat: Gulai Merah Kepala Ikan L Rp275.000 dan M Rp248.050, tetapi tidak tersedia | ringkasan_observasi |  |  | `coded-data/ringkasan-harga/gf-price-range-002-harga-tertinggi-terlihat-gulai-merah-kepala-ikan-l-rp275-000-dan-m-rp24.jpeg` |
| GF-PRICE-RANGE-003 | ringkasan-harga | Harga atas menu utama tersedia: Kari Kambing Rp72.000 dan Dendeng Sapi Bakar Rp56.000 | ringkasan_observasi |  |  | `coded-data/ringkasan-harga/gf-price-range-003-harga-atas-menu-utama-tersedia-kari-kambing-rp72-000-dan-dendeng-sapi-b.jpeg` |
| GF-REV-POS-001 | ulasan-positif | Muslim M.: keren ni, konsisten rasa | terlihat | 5 |  | `coded-data/ulasan-positif/gf-rev-pos-001-muslim-m-keren-ni-konsisten-rasa.jpeg` |
| GF-REV-POS-002 | ulasan-positif | Raymond: Ayam popnya wenak dan creamy | terlihat | 5 |  | `coded-data/ulasan-positif/gf-rev-pos-002-raymond-ayam-popnya-wenak-dan-creamy.jpeg` |
| GF-REV-POS-003 | ulasan-positif | tasyaa: rasanya enak, sayur fresh, porsi agak kebanyakan | terlihat | 5 |  | `coded-data/ulasan-positif/gf-rev-pos-003-tasyaa-rasanya-enak-sayur-fresh-porsi-agak-kebanyakan.jpeg` |
| GF-REV-POS-004 | ulasan-positif | Wie W.: langganan keluarga; rasa enak, porsi besar, bersih, request dipenuhi | terlihat | 5 |  | `coded-data/ulasan-positif/gf-rev-pos-004-wie-w-langganan-keluarga-rasa-enak-porsi-besar-bersih-request-dipenuhi.jpeg` |
| GF-REV-POS-005 | ulasan-positif | Wie W.: langgananku setiap Minggu, Best | terlihat | 5 |  | `coded-data/ulasan-positif/gf-rev-pos-005-wie-w-langgananku-setiap-minggu-best.jpeg` |
| GF-REV-POS-006 | ulasan-positif | ita: ikan gembung dan lele fresh; rasanya enak | terlihat | 5 |  | `coded-data/ulasan-positif/gf-rev-pos-006-ita-ikan-gembung-dan-lele-fresh-rasanya-enak.jpeg` |
| GF-REV-POS-007 | ulasan-positif | Lina: semua menu enak, semua recommended | terlihat | 5 |  | `coded-data/ulasan-positif/gf-rev-pos-007-lina-semua-menu-enak-semua-recommended.jpeg` |
| GF-REV-POS-008 | ulasan-positif | Gusti: best karena sayur dan lauk dipisah | terlihat | 5 |  | `coded-data/ulasan-positif/gf-rev-pos-008-gusti-best-karena-sayur-dan-lauk-dipisah.jpeg` |
| GF-REV-POS-009 | ulasan-positif | Derrick: rasanya enak, porsinya besar | terlihat | 5 |  | `coded-data/ulasan-positif/gf-rev-pos-009-derrick-rasanya-enak-porsinya-besar.jpeg` |
| GF-REV-POS-010 | ulasan-positif | Suba: enak banget menurut keluarga | terlihat | 5 |  | `coded-data/ulasan-positif/gf-rev-pos-010-suba-enak-banget-menurut-keluarga.jpeg` |
| GF-REV-NEG-001 | ulasan-negatif-netral | albert p.: Jangek siram tidak dikasih; restoran meminta maaf dan berjanji memperhatikan kelengkapan | terlihat | 1 |  | `coded-data/ulasan-negatif-netral/gf-rev-neg-001-albert-p-jangek-siram-tidak-dikasih-restoran-meminta-maaf-dan-berjanji-memp.jpeg` |
| GF-REV-NEG-002 | ulasan-negatif-netral | Talia: pesan ayam rendang, dikirim ayam goreng | terlihat | 1 |  | `coded-data/ulasan-negatif-netral/gf-rev-neg-002-talia-pesan-ayam-rendang-dikirim-ayam-goreng.jpeg` |
| GF-REV-NEG-003 | ulasan-negatif-netral | irawaty: udang goreng hanya 3 biji, terlalu mahal, tidak worth it | terlihat | 3 |  | `coded-data/ulasan-negatif-netral/gf-rev-neg-003-irawaty-udang-goreng-hanya-3-biji-terlalu-mahal-tidak-worth-it.jpeg` |
| GF-REV-NEG-004 | ulasan-negatif-netral | Hendra: pesan ikan kakap tetapi diberikan ikan nila; restoran meminta maaf | terlihat | 3 |  | `coded-data/ulasan-negatif-netral/gf-rev-neg-004-hendra-pesan-ikan-kakap-tetapi-diberikan-ikan-nila-restoran-meminta-maaf.jpeg` |
| GF-REV-NEG-005 | ulasan-negatif-netral | siyaga.: makanan enak tetapi kuah yang diminta/dibayar tidak diberikan; restoran merespons | terlihat | 3 |  | `coded-data/ulasan-negatif-netral/gf-rev-neg-005-siyaga-makanan-enak-tetapi-kuah-yang-diminta-dibayar-tidak-diberikan-restor.jpeg` |
| GF-REV-NEG-006 | ulasan-negatif-netral | lily: nasi agak keras, keripik kentang melempem, packaging bagus | terlihat | 2 |  | `coded-data/ulasan-negatif-netral/gf-rev-neg-006-lily-nasi-agak-keras-keripik-kentang-melempem-packaging-bagus.jpeg` |
| GF-REV-NEG-007 | ulasan-negatif-netral | Khash: not quite fresh; tough meat; okay but does not meet expectation | terlihat | 3 |  | `coded-data/ulasan-negatif-netral/gf-rev-neg-007-khash-not-quite-fresh-tough-meat-okay-but-does-not-meet-expectation.jpeg` |
| GF-REV-NEG-008 | ulasan-negatif-netral | Hartini: sayur nangka ada rada basi | terlihat | 1 |  | `coded-data/ulasan-negatif-netral/gf-rev-neg-008-hartini-sayur-nangka-ada-rada-basi.jpeg` |
| GF-REV-NEG-009 | ulasan-negatif-netral | Vivi: staf kurang koordinasi; salah order ke driver; pelanggan keluar ongkos lagi; rasa biasa saja | terlihat | 4 |  | `coded-data/ulasan-negatif-netral/gf-rev-neg-009-vivi-staf-kurang-koordinasi-salah-order-ke-driver-pelanggan-keluar-ongkos-l.jpeg` |
| GF-REV-NEG-010 | ulasan-negatif-netral | Fajar: setelah makan langsung diare; restoran memberi respons | terlihat | 4 |  | `coded-data/ulasan-negatif-netral/gf-rev-neg-010-fajar-setelah-makan-langsung-diare-restoran-memberi-respons.jpeg` |

## Catatan Analisis

- Data ini kuat sebagai bukti observasi platform, tetapi temuan akhir tetap perlu ditriangulasi dengan wawancara pemilik/admin GrabFood dan data internal penjualan.
- Beberapa teks promo terpotong oleh tampilan aplikasi; manifest hanya menulis bagian yang terlihat di screenshot.
- Rating bintang dan isi ulasan tidak selalu searah. Contoh: ada rating tinggi dengan isi keluhan; karena itu kolom `sentiment` didasarkan pada isi komentar, bukan hanya bintang.
- Untuk SWOT: ulasan positif dapat masuk ke kekuatan, ulasan negatif/netral ke kelemahan/risiko, promo ke peluang/platform marketing, dan sold-out ke kelemahan operasional atau isu stok.
