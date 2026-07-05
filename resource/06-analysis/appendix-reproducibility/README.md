# Appendix Reproducibility

Folder ini menyimpan audit keterlacakan appendix ke `resource` dan keputusan filter appendix.

## Isi

| Lokasi/file | Keterangan |
|---|---|
| `APP-20260705-filtered-appendix-map.csv` | Peta keputusan 5 appendix aktif dan 8 appendix yang diarsipkan. |
| `APP-20260705-appendix-resource-map.csv` | Peta awal 13 appendix ke sumber resource pendukung sebelum filter. |
| `APP-20260705-reproducibility-audit.md` | Ringkasan status setelah filter. |
| `source-tex/` | Snapshot 13 file `.tex` appendix sebelum filter. |
| `generated-source-tex/` | Snapshot file `.tex` generated yang dipakai Appendix 11. |
| `filtered-out-source-tex/` | Appendix yang dikeluarkan dari `main.tex` dan diarsipkan di resource. |

## Status

`main.tex` sekarang hanya memanggil 5 appendix aktif. Appendix yang diarsipkan tetap tersimpan di resource dan tidak dihapus permanen.
