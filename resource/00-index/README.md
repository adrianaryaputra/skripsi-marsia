# Resource Index

Folder `resource/` hanya digunakan untuk bahan yang mungkin dipakai sebagai sumber isi skripsi/proposal, bukti data, gambar yang dirujuk LaTeX, literatur, pra-survei, data penelitian lapangan, dan hasil analisis.

## Struktur

- `00-index/`: panduan struktur folder dan penamaan file.
- `01-brand/`: logo dan aset visual yang dipakai dokumen.
- `02-literature/`: referensi akademik.
  - `books/`
  - `journals/`
  - `proceedings/`
  - `theses/`
  - `datasets/`
- `03-prasurvey/`: bahan pra-survei sebelum penelitian utama.
  - `00-rekap-koding/`
  - `grabfood-observation/`
  - `interview-owner/`
  - `performance-data/`
  - `product-photos/`
- `05-fieldwork/`: data penelitian utama Juni-Juli 2026.
  - `00-instrumen-penelitian/`
  - `01-wawancara/`
  - `02-observasi-grabfood/`
    - `20260613-nasi-gerilya/`
    - `20260619-kompetitor/`
  - `04-survei-pelanggan/`
  - `07-rekap-koding/`
- `06-analysis/`: hasil olahan dari data lapangan.
  - `appendix-reproducibility/`
  - `triangulation/`
  - `ifas-efas/`
  - `swot/`
  - `gap-closure/`

Dataset tertentu dapat menyimpan `raw/source-archives/` untuk arsip sumber asli seperti ZIP screenshot, selama isi ZIP telah diekstrak atau diturunkan ke `raw/`, `cropped/`, `coded-data/`, atau `compiled/`.

## Naming Scheme

- `W-PM-YYYYMMDD-...`: wawancara pemilik/pengelola.
- `W-AD-YYYYMMDD-...`: wawancara admin.
- `W-KR-YYYYMMDD-...`: wawancara karyawan/cook.
- `W-PL-YYYYMMDD-...`: wawancara pelanggan.
- `W-KP-YYYYMMDD-...`: wawancara kompetitor.
- `W-BC-YYYYMMDD-...`: wawancara business consultant/intern pendamping.
- `O-GF-YYYYMMDD-...`: observasi GrabFood Nasi Gerilya.
- `O-KP-YYYYMMDD-...`: observasi kompetitor.
- `D-KIN-YYYYMMDD-...`: dokumentasi kinerja atau data internal.
- `INST-YYYYMMDD-...`: instrumen pengumpulan data, angket, atau pedoman wawancara.
- `PS-YYYYMMDD-...`: rekap koding dan triangulasi pra-survei.
- `S-PL-YYYYMMDD-...`: survei pelanggan.
- `U-PL-YYYYMMDD-...`: rekap ulasan pelanggan.

Peta pemindahan file kerja disimpan di `scratch/05-laporan-kerja/folder-reorganization-20260613.csv`.
