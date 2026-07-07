# Analisis Awal Interview Audio

Sumber: 19 file audio `.m4a` dari folder Google Drive interview.  
Transkripsi: otomatis menggunakan `faster-whisper` model `base` CPU/int8.  
Catatan kualitas: beberapa bagian transkrip masih kasar karena audio ramai, logat lokal, jarak mikrofon, dan percakapan tumpang tindih. Temuan di bawah memakai bagian yang masih dapat dibaca jelas, sehingga perlu validasi manual sebelum dikutip final di skripsi.

## Ringkasan Dataset

| Kelompok | File audio | Durasi kira-kira | Catatan |
|---|---:|---:|---|
| Kompetitor - Istana Krakatau | 1 | 2,43 menit | Transkrip otomatis lebih berupa rekaman order singkat; catatan manual kasir sudah ditambahkan sebagai rekap pendukung. |
| Kompetitor - Pondok Krakatau | 3 | 13,21 menit | Ada wawancara kompetitor dan potongan tambahan. |
| Karyawan NG - Bella/Dapur | 1 | 29,43 menit | Sumber utama untuk operasional dapur, stok, SOP, waktu proses, kualitas rasa. |
| Karyawan NG - Ririn/Kasir | 14 | 30,31 menit | Sumber utama untuk GrabFood, checker, driver, catatan pelanggan, promo, komplain. |

## Temuan Utama

### 1. Alur pesanan online sudah memiliki pembagian kerja, tetapi rawan human error saat ramai

Pada sisi kasir/display, pesanan GrabFood/Ojol masuk melalui aplikasi lalu tercetak sebagai bill/kertas pesanan. Ada peran `stock/checker` yang menerima, menempelkan salinan pesanan, memindahkan box ke area display, memberi nomor antrean kepada driver, dan mencocokkan nomor pesanan sebelum diserahkan. Ini menunjukkan adanya proses kontrol internal.

Risiko muncul ketika kondisi hectic: lauk terpisah seperti menu basah/berkuah dapat tertinggal, catatan khusus bisa terlewat, nomor GrabFood yang mirip dapat tertukar, dan driver kadang salah menyebut nomor. Temuan ini mendukung isu operasional bahwa ketelitian packing dan validasi akhir masih menjadi titik lemah.

Kode bukti: `06_Karyawan_Ririn_Kasir...` sekitar 00:00:50-00:08:45.

### 2. Dapur mengandalkan persiapan awal, stok, takaran, dan double-check rasa

Dari wawancara dapur, aktivitas awal mencakup pengecekan stok, menentukan bahan yang akan dimasak, dan menyiapkan bahan sebelum pesanan datang. Menu punya standar resep/takaran, dan konsistensi rasa dijaga lewat pengecekan hasil akhir. Porsi masak juga disesuaikan dengan laporan penjualan hari sebelumnya agar stok tidak terlalu kurang atau berlebih.

Temuan ini bisa dipakai sebagai kekuatan internal: sudah ada SOP bahan, standar takaran, pembagian kerja dapur, serta kontrol rasa. Namun kualitas bergantung pada kedisiplinan pelaksanaan dan kecukupan SDM.

Kode bukti: `05_Karyawan_Bella_Dapur...` sekitar 00:01:40-00:03:34, 00:07:47-00:14:44.

### 3. Kendala utama dapur: waktu, pesanan mendadak, kekurangan SDM, dan proses packing

Saat pesanan ramai atau mendadak, pesanan dapat menumpuk dan terlambat keluar. Narasumber dapur menyebut keterlambatan, tekanan waktu, kesalahan prepare/timbangan, kebutuhan membuat ulang makanan, dan kekurangan SDM sebagai hambatan. Perbaikan yang muncul dari data adalah menyiapkan bahan lebih awal, memperkuat SOP, menambah/menata SDM, dan mempercepat proses bungkus/packing.

Untuk GrabFood jarak jauh, makanan dingin tidak dianggap isu utama karena makanan disiapkan panas, tetapi waktu bungkus/packing dan menunggu driver tetap berpengaruh pada kelancaran layanan.

Kode bukti: `05_Karyawan_Bella_Dapur...` sekitar 00:04:21-00:06:46, 00:10:44-00:12:11, 00:27:21-00:28:54.

### 4. Catatan khusus pelanggan tidak semuanya bisa dipenuhi

Catatan sederhana masih bisa ditangani, misalnya permintaan cabai/sambal/kuah dipisah, pilihan bagian ayam, atau lauk tertentu. Namun permintaan yang mengubah cara masak satu porsi sulit dipenuhi karena sistem produksi memasak dalam jumlah banyak. Jika semua permintaan individual diikuti, konsistensi rasa dan standar produk bisa terganggu.

Ini penting untuk analisis GrabFood: halaman menu perlu memberi batas ekspektasi pelanggan. Catatan yang bisa dipenuhi sebaiknya dijadikan opsi jelas, sedangkan request yang tidak bisa dipenuhi perlu diminimalkan melalui deskripsi menu.

Kode bukti: `05_Karyawan_Bella_Dapur...` sekitar 00:15:13-00:17:18 dan `06_Karyawan_Ririn_Kasir...` sekitar 00:03:07-00:05:01.

### 5. Komplain yang muncul berkaitan dengan item kurang, rasa/aroma, porsi, dan perbedaan harga

Data karyawan dan kompetitor sama-sama menunjukkan beberapa sumber keluhan: pesanan kurang/tertinggal, rasa yang dianggap berubah, porsi yang dianggap tidak sesuai oleh sebagian pelanggan, dan harga GrabFood yang berbeda dari harga takeaway/datang langsung. Pada NG, wawancara dapur juga menyebut kikil rawan mendapat komplain aroma sapi.

Temuan ini selaras dengan data pelanggan yang sebelumnya menyebut item pernah kurang tetapi dikirim ulang, serta harga terasa mahal namun tertolong promo dan ongkir.

Kode bukti: `02_Kompetitor_Pondok_Krakatau...` sekitar 00:06:41-00:08:30; `05_Karyawan_Bella_Dapur...` sekitar 00:18:56-00:19:06; `09_Karyawan_Ririn_Kasir...` sekitar 00:01:31-00:02:36.

### 6. Promo GrabFood memengaruhi volume pesanan dan pilihan pelanggan

Narasumber kasir menyebut jika ada promo, menu terkait cenderung lebih sering di-order. Promo perlu diinformasikan ke area dapur agar stok dan kesiapan menu menyesuaikan. Ada indikasi pelanggan membandingkan harga GrabFood dengan harga langsung, lalu memilih GrabFood ketika promo terasa lebih menguntungkan.

Ini mendukung peluang promosi digital: promo efektif menarik repeat order dan trial, tetapi perlu diimbangi kesiapan operasional agar tidak memicu keterlambatan atau item habis.

Kode bukti: `08_Karyawan_Ririn_Kasir...` sekitar 00:00:00-00:02:35.

### 7. Kompetitor juga menghadapi pola serupa: online cukup besar, jam ramai makan siang/akhir pekan, promo digunakan, dan komplain operasional muncul

Catatan manual narasumber Pondok Krakatau (Ken, kasir dan juru masak) menunjukkan pesanan online melalui GrabFood berkontribusi sekitar lebih kurang 50 persen dari total pesanan. Jam ramai terjadi pada waktu makan siang dan akhir pekan. Menu yang sering dipesan adalah ayam goreng, nasi ayam rendang, nasi ikan kakap, dan nasi ikan nila, dengan rentang harga sekitar Rp38 ribuan. Faktor pelanggan kembali meliputi rasa yang enak dan pelayanan cepat. Promo tersedia dari GrabFood dan kadang toko ikut membuat promo. Kendala yang muncul adalah driver menunggu, stok habis tetapi belum diperbarui di platform, porsi/rasa yang kadang tidak konsisten karena petugas berbeda, serta item pesanan yang kadang tertinggal lalu disusulkan kembali melalui Grab.

Artinya, masalah NG bukan unik, tetapi bagian dari standar persaingan rumah makan berbasis delivery. Keunggulan NG perlu diarahkan pada konsistensi rasa, porsi, ketelitian packing, dan komunikasi driver.

Kode bukti: catatan manual `INT-KP-PK-KEN-20260703`, didukung audio `02_Kompetitor_Pondok_Krakatau...` sekitar 00:03:31-00:09:01.

### 8. Istana Krakatau kuat pada kanal offline, tetapi tetap memakai GrabFood dan menghadapi isu kelengkapan pesanan

Catatan manual narasumber Istana Krakatau (kasir) menunjukkan penjualan masih didominasi kanal offline sekitar 80 persen. Jam ramai terjadi pada waktu makan siang pukul 11.30--14.00 dan malam sekitar pukul 18.00--19.00. Menu online yang disebut adalah ikan sambal, dengan rentang harga sekitar Rp37 ribuan. Faktor pelanggan memilih adalah rasa dan pelayanan cepat. Promo sering digunakan terutama di GrabFood, walaupun voucher disebut tidak besar. Kendala yang muncul adalah pesanan tertinggal, driver lama menunggu, dan keluhan pesanan kurang lengkap. Pengecekan dilakukan oleh petugas yang mem-packing. Keunggulan yang disebut adalah rasa, porsi online yang lebih besar, serta empat jenis sambal terutama sambal Padang.

Temuan ini menunjukkan bahwa ancaman kompetitor tidak hanya berasal dari performa GrabFood, tetapi juga dari kekuatan offline, rasa, kecepatan layanan, porsi, dan diferensiasi sambal. Pada saat yang sama, isu item kurang lengkap dan driver menunggu kembali muncul sebagai pola yang juga ditemukan pada kompetitor lain.

Kode bukti: catatan manual `INT-KP-IK-KASIR-20260703`, didukung audio `01_Kompetitor_Istana_Krakatau...` sebagai konteks rekaman awal.

## Implikasi Untuk SWOT / Bab IV

### Kekuatan

- Sudah ada pembagian kerja dapur, display, cashier/checker, cook, helper, dan leader.
- Terdapat standar resep/takaran, pengecekan stok, laporan harian, dan double-check rasa.
- Menu favorit seperti ayam pop, ayam goreng, dendeng/rendang terlihat menjadi daya tarik.
- Proses pemesanan online sudah punya alur nomor, bill, dan koordinasi driver.

### Kelemahan

- Ketelitian packing masih rawan saat ramai, terutama lauk terpisah/berkuah dan catatan khusus.
- Kekurangan SDM dan tekanan waktu dapat membuat proses masak/packing lambat.
- Permintaan khusus tidak semuanya bisa dipenuhi karena sistem masak massal.
- Beberapa kualitas menu perlu dijaga, misalnya aroma kikil dan konsistensi rasa.

### Peluang

- Promo GrabFood terbukti mendorong pembelian dan bisa diarahkan ke menu unggulan.
- Informasi menu bisa diperjelas: isi paket, opsi sambal/kuah, pilihan bagian ayam, dan batas catatan khusus.
- SOP checker dapat diperkuat menjadi nilai layanan, terutama untuk mencegah pesanan kurang.

### Ancaman

- Kompetitor juga kuat di rasa, kecepatan, dan promo; pelanggan mudah membandingkan.
- Perbedaan harga online vs offline bisa menimbulkan persepsi mahal.
- Keterlambatan driver, pembatalan, atau nomor pesanan mirip bisa menurunkan pengalaman pelanggan walau bukan sepenuhnya kesalahan restoran.

## Rekomendasi Operasional

1. Buat checklist packing khusus GrabFood: nomor pesanan, lauk utama, lauk terpisah, sambal/kuah, alat makan, dan catatan khusus.
2. Pisahkan area atau tray untuk lauk yang rawan tertinggal, khususnya menu berkuah/basah.
3. Perjelas opsi di GrabFood untuk request yang sering muncul: sambal/kuah dipisah, pilihan paha/dada jika memungkinkan, dan keterangan kalau request masak ulang/custom tidak bisa dipenuhi.
4. Sinkronkan promo dengan dapur sebelum promo aktif agar stok menu promo siap.
5. Perkuat komunikasi driver: nomor antrean, estimasi tunggu, dan konfirmasi nomor GF sebelum serah pesanan.
6. Gunakan laporan penjualan harian dan data promo untuk memprediksi stok, terutama pada jam makan siang/sore dan hari ramai.

## Caveat

Transkrip otomatis ini belum layak dikutip verbatim tanpa koreksi manual. Untuk Bab IV, gunakan sebagai bahan coding awal dan rujuk timestamp ketika memutar ulang audio asli. Bagian yang paling perlu validasi manual adalah nama menu, angka persentase/harga, dan kalimat yang berkaitan dengan keluhan spesifik.
