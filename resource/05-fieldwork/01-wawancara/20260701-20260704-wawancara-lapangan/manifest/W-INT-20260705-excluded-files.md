# File yang Tidak Masuk Paket Wawancara

Tanggal beres-beres: 2026-07-05

File/folder berikut tidak dimasukkan ke paket bukti wawancara final karena bersifat duplikat, dependency, log proses, atau artefak sementara. File tidak dihapus permanen; item dari temp dipindahkan ke `scratch/99-temp/_discarded/interview-cleanup-20260705/` setelah validasi.

| Sumber temp | Alasan |
|---|---|
| `interview-audio/raw/20_Karyawan_Bella_Dapur.m4a` | Duplikat byte-identik dari `05_Karyawan_Bella_Dapur_Interview Karyawan NG Dapur.m4a` (SHA256 sama). |
| `interview-audio/pydeps/` | Dependency Python/transkripsi, bukan bukti skripsi. |
| `interview-audio/transcribe_interviews.py`, `transcribe_stdout.log`, `transcribe_stderr.log`, `transcription_status.json` | Skrip dan log proses transkripsi, bukan data empiris. |
| `interview-audio/audio_manifest.csv`, `audio_manifest.json` | Manifest lama berisi path temp; diganti oleh manifest bersih di folder `manifest/`. |
| `interview-audio/compiled/*.wav` dan versi gabungan lama `Ririn_Kasir_combined*.m4a` | Artefak intermediate berukuran besar; yang disimpan hanya `Ririn_Kasir_combined_ORDERED_LOGICAL_48k.m4a` dan daftar sumbernya. |
| `interview-audio/compiled/ririn-split-30min/` | File split sementara; isi bagian akhir sudah dimasukkan ke transkrip final Ririn. |
| `interview-audio/transcripts/` | Potongan transkrip sementara; isi yang relevan sudah digabungkan ke `transcripts/W-AD-RK-20260701-transcript.txt`. |
| `interview-transcript/Ririn Kasir ORDERED LOGICAL part2 29m50s-end.txt` | Tidak disimpan sebagai file terpisah karena sudah digabungkan ke transkrip final Ririn. |
| `interview-transcript/Angket Terbuka Pelanggan GrabFood Nasi Gerilya (Jawaban) - Form Responses 1.csv` | Bukan wawancara; dipindahkan ke dataset survei pelanggan. |
