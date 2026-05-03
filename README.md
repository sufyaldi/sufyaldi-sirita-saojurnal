<img width="665" height="744" alt="Screenshot 2026-05-03 at 11 45 35" src="https://github.com/user-attachments/assets/42941c5c-8738-40a4-bb94-e162f8ab21d7" /># Sao Jurnal OJS Theme

**Sao Jurnal** adalah tema OJS 3 modern dengan desain premium, responsif, dan performa tinggi yang dirancang khusus untuk meningkatkan estetika dan pengalaman pengguna (UI/UX) pada portal jurnal ilmiah.
<img width="638" height="828" alt="Sirita-Saojurnal-Jurnal" src="https://github.com/user-attachments/assets/ee9240bd-f7ab-4957-b2eb-83bd60a6ac5b" />

##  Fitur Unggulan

-  **Modern Design**: Desain berbasis glassmorphism dengan palet warna "Oceanic Professional".
-  **Performance**: Dibangun menggunakan Tailwind CSS yang ringan dan dioptimalkan.
-  **Dynamic Dashboard**: Menampilkan "Artikel Terbaru" dan "Ranking Penulis Ter produktif" (Top 5) secara otomatis.
-  **A-Z Journal Filter**: Memudahkan pengunjung mencari jurnal berdasarkan abjad secara instan.
-  **Mobile Responsive**: Tampilan sempurna di semua perangkat (Desktop, Tablet, HP).
-  **Smart Navigation**: Header transparan yang modern dan footer institusi 4-kolom yang lengkap.

##  Persyaratan Sistem

- OJS 3.2.x atau 3.3.x (Direkomendasikan 3.3.0-22 atau terbaru).
- PHP 7.4 atau PHP 8.x.
- Koneksi internet (untuk memuat Tailwind & Lucide Icons via CDN).

##  Instalasi

1. **Download** repositori ini sebagai ZIP.
2. **Ekstrak** folder tersebut ke direktori OJS Anda di: `plugins/themes/`.
3. Pastikan nama foldernya adalah `sao-iain-pare`.
4. Login ke Dashboard OJS sebagai **Administrator**.
5. Pergi ke **Settings** > **Website** > **Appearance**.
6. Pada bagian **Theme**, pilih **Sao Jurnal OJS Theme**.
7. Klik **Save**.

##  Struktur Folder

```text
sao-iain-pare/
├── styles/
│   └── full-page.css      # Core styles & Design system
├── templates/
│   ├── frontend/
│   │   ├── components/    # Header, Footer, Navigation
│   │   └── pages/         # Index Site, Index Journal, etc.
├── ThemePlugin.inc.php    # Logic & Database queries
├── theme.xml              # Metadata tema
├── version.xml            # Versi & Identitas plugin
└── index.php              # Entry point
```

##  Lisensi

Tema ini dirilis di bawah lisensi **GPL-v3**. Anda bebas menggunakan, memodifikasi, dan membagikan tema ini selama tetap mempertahankan atribusi asli.

---
**Developed by SufyAldi | IAIN Parepare**  
*Meningkatkan kualitas publikasi ilmiah melalui inovasi digital.*
