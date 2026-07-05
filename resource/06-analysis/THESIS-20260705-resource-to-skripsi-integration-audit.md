# Audit Integrasi Resource ke Skripsi

Tanggal audit: 2026-07-05  
Fokus: memastikan komponen analisis penting di `resource/` sudah masuk ke naskah skripsi, terutama Bab IV dan Bab V.

## Ringkasan Status

| Komponen resource | Sumber utama | Status di skripsi | Lokasi naskah |
|---|---|---|---|
| Indeks resource | `resource/00-index/README.md` | Dipakai sebagai panduan struktur kerja, bukan konten naskah akademik. | Tidak dimasukkan ke Bab karena berfungsi sebagai dokumentasi internal resource. |
| Aset brand | `resource/01-brand/logo-usu.png`; `resource/01-brand/illustration-gerilya.jpg` | Logo USU sudah dipakai untuk cover melalui metadata. Ilustrasi Gerilya tidak dimasukkan karena bukan bukti penelitian atau komponen analisis. | `metadata/skripsi.tex`; cover dari `\makecover`. |
| Literatur akademik | `resource/02-literature/` dan `referensi.bib` | Sudah dipakai sebagai dasar Bab I, Bab II, Bab III, dan landasan SWOT/IFAS/EFAS. File PDF literatur disimpan sebagai bahan bacaan, sedangkan sitasi aktif ditarik dari `referensi.bib`. | Bab I: latar belakang; Bab II: tinjauan pustaka dan penelitian terdahulu; Bab III: metodologi. |
| Instrumen penelitian | `resource/05-fieldwork/00-instrumen-penelitian/` | Instrumen disimpan sebagai bukti metode dan dasar pengumpulan data. Setelah appendix difilter, instrumen tidak dimasukkan penuh ke lampiran utama agar skripsi tidak terlalu penuh, tetapi substansinya sudah dijelaskan dalam Bab III. | Bab III: metode pengumpulan data, instrumen, keabsahan data, dan teknik analisis. |
| Koding wawancara dan temuan lapangan utama | `resource/05-fieldwork/07-rekap-koding/W-INT-20260704-koding-temuan-lapangan-lengkap.md` | Sudah masuk sebagai ringkasan koding pegawai, business consultant, kompetitor, pelanggan, faktor SWOT, IFAS/EFAS, SWOT, dan prioritas strategi. | Bab IV: `Hasil Wawancara, Observasi, dan Angket`; `Identifikasi Faktor Internal dan Eksternal`; `Triangulasi Data`; `Matriks IFAS dan EFAS`; `Matriks SWOT`; `Prioritas Strategi`. |
| Observasi GrabFood Nasi Gerilya | `resource/05-fieldwork/02-observasi-grabfood/20260613-nasi-gerilya/` | Sudah masuk sebagai profil toko, rating, jumlah penilaian, promo, menu, harga, sold out, dan ulasan positif/negatif. | Bab IV: `Kondisi GrabFood sebagai Kanal Penjualan`; `Hasil Observasi GrabFood dan Kompetitor`; appendix aktif evidence 11. |
| Observasi kompetitor GrabFood | `resource/05-fieldwork/02-observasi-grabfood/20260619-kompetitor/` | Sudah masuk sebagai pembanding rating, penilaian, jarak, harga, reputasi, dan ancaman kompetitor. | Bab IV: `Kondisi Kompetisi pada Platform GrabFood`; `Hasil Observasi GrabFood dan Kompetitor`; appendix aktif evidence 12. |
| Angket pelanggan | `resource/05-fieldwork/04-survei-pelanggan/20260630-angket-terbuka-grabfood/` | Sudah masuk sebagai temuan pelanggan tentang alasan beli, menu favorit, harga/promo, porsi, kemasan, item kurang, repeat order, dan kompetitor pembanding. | Bab IV: `Hasil Angket Pelanggan`; `Analisis Pelanggan, Ulasan, dan Indikator Penjualan`; Bab V: kesimpulan, saran, keterbatasan. |
| Koding pra-survei detail | `resource/03-prasurvey/00-rekap-koding/PS-20260705-prasurvey-coded-index.md` dan manifest CSV | Sudah masuk sebagai konteks pra-survei 128 kode, dengan pemisahan fungsi dan batas klaim. | Bab IV: `Konteks Pra-Survei dan Batas Klaim Analisis`; `Analisis Pelanggan, Ulasan, dan Indikator Penjualan`; faktor SWOT; prioritas strategi. |
| Peta triangulasi pra-survei | `resource/03-prasurvey/00-rekap-koding/PS-20260705-prasurvey-triangulation-map.md` | Sudah masuk sebagai aturan bahwa `PS-*` dipakai sebagai konteks/penguat, bukan pengganti data lapangan. | Bab IV: `Konteks Pra-Survei dan Batas Klaim Analisis`; `Triangulasi Data`. |
| Peta triangulasi sumber utama | `resource/06-analysis/triangulation/TRI-20260705-source-map.md` | Sudah masuk sebagai triangulasi pegawai, business consultant, pelanggan, kompetitor, observasi, dokumentasi, dan pra-survei. | Bab IV: `Triangulasi Data`; Bab V: kesimpulan dan keterbatasan. |
| Gap closure dan protokol klaim sementara | `resource/06-analysis/gap-closure/` | Sudah masuk sebagai batas klaim peningkatan penjualan, validasi pemilik, data kinerja terbaru, responden pelanggan terbatas, dan wawancara kompetitor belum merata. | Bab IV: `Konteks Pra-Survei dan Batas Klaim Analisis`; `Matriks IFAS dan EFAS`; Bab V: kesimpulan dan keterbatasan. |
| IFAS/EFAS | `resource/06-analysis/ifas-efas/README.md` dan koding utama | Sudah masuk sebagai matriks IFAS 2,50 dan EFAS 2,51 dengan catatan bobot/rating adalah penilaian peneliti berdasarkan triangulasi. | Bab IV: `Matriks IFAS dan EFAS`; Bab V: kesimpulan. |
| SWOT | `resource/06-analysis/swot/README.md` dan koding utama | Sudah masuk sebagai matriks SWOT dan lima prioritas strategi pemasaran. | Bab IV: `Matriks SWOT dan Alternatif Strategi`; `Prioritas Strategi Pemasaran`; Bab V: saran. |
| Audit appendix dan resource reproducibility | `resource/06-analysis/appendix-reproducibility/` | Sudah dipakai untuk memfilter appendix utama menjadi 5 lampiran aktif dan mengarsipkan 8 lampiran kerja. | `main.tex`; appendix aktif 01, 02, 03, 11, 12. |

## Batas yang Sengaja Tidak Dipaksakan

1. Raw audio, transkrip penuh, crop visual, contact sheet, dan manifest detail tidak dimasukkan seluruhnya ke Bab IV/V agar naskah tidak berubah menjadi audit file mentah.
2. Kode detail tetap disimpan di resource dan appendix evidence; Bab IV memakai ringkasan kode temuan dan sintesis.
3. Data kinerja pra-survei dipakai untuk urgensi dan indikator evaluasi, bukan klaim perubahan penjualan terbaru.
4. Empat gap tetap dicatat sebagai keterbatasan, bukan ditutup dengan klaim yang tidak didukung data.

## Verifikasi 2026-07-05

- PDF berhasil dikompilasi melalui `latexmk -pdf`.
- `main.pdf` terakhir berhasil dibuat dengan 219 halaman.
- Pemeriksaan sumber aktif menunjukkan 0 referensi LaTeX putus.
- Pemeriksaan path `resource/...` pada sumber aktif menunjukkan 0 path hilang.
