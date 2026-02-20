<h1 align="center">🕵️ Steganography-Tool</h1>
<h3 align="center">// hide secret messages inside plain text files. no one will know.</h3>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Windows-blue?style=flat-square&logo=windows" />
  <img src="https://img.shields.io/badge/Language-Batch%20%2B%20PowerShell-green?style=flat-square" />
  <img src="https://img.shields.io/badge/Version-1.0-orange?style=flat-square" />
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=flat-square" />
  <img src="https://img.shields.io/badge/Made%20by-Skyvee Tech-red?style=flat-square" />
</p>

---

## 📌 About

**InvisibleInk** adalah tool steganografi berbasis terminal yang memungkinkan kamu menyembunyikan pesan rahasia di dalam file teks biasa.

File hasil encode terlihat **100% normal** di mata orang lain. Tidak ada yang tahu ada pesan tersembunyi di dalamnya — kecuali orang yang punya tool ini.

---

## ⚡ Features

| Fitur | Deskripsi |
|-------|-----------|
| `Encode` | Sembunyikan pesan rahasia di dalam file teks biasa |
| `Decode` | Baca pesan tersembunyi dari file yang sudah di-encode |
| `How it Works` | Penjelasan teknik yang digunakan |

---

## 🗂️ File yang Dibutuhkan

Pastikan kedua file ini berada di **folder yang sama**:

```
📁 Folder kamu
├── SKYVEE_TECH_STEGANOGRAPHY.exe   ← file utama
└── skyvee_stego_engine.ps1         ← engine PowerShell
```

> ⚠️ Jika `skyvee_stego_engine.ps1` tidak ada di folder yang sama, tool tidak akan berjalan.

---

## 🚀 How to Use

### 1. Encode — Sembunyikan Pesan

1. Jalankan `SKYVEE_TECH_STEGANOGRAPHY.exe` sebagai **Administrator**
2. Pilih `[1] Encode`
3. Isi form berikut:

```
[?] Isi pesan/text  : Hari ini cuaca cerah sekali.
[?] Secret Text     : PESAN RAHASIA KAMU
[?] File Output     : output.txt
```

4. File `output.txt` akan dibuat di folder yang sama
5. Buka file tersebut — terlihat normal, padahal ada pesan tersembunyi di dalamnya!

> ⚠️ Nama file output **jangan pakai spasi**. Gunakan underscore jika perlu, contoh: `pesan_rahasia.txt`

---

### 2. Decode — Baca Pesan Tersembunyi

1. Jalankan `SKYVEE_TECH_STEGANOGRAPHY.exe` sebagai **Administrator**
2. Pilih `[2] Decode`
3. Masukkan nama file yang ingin di-decode:

```
[?] Target : output.txt
```

4. Pesan tersembunyi akan langsung tampil di layar

---

## 🔬 How It Works

Tool ini menggunakan teknik **Zero-Width Character Steganography**.

```
Pesan rahasia  →  Dikonversi ke binary (0 dan 1)
                        ↓
Tiap bit diwakili karakter Unicode invisible:
  1  →  Zero-Width Space    (U+200B)
  0  →  Zero-Width Non-Joiner (U+200C)
                        ↓
Karakter invisible disisipkan di akhir teks sampul
                        ↓
File terlihat normal, pesan tersembunyi di dalamnya
```

### Contoh

**Sebelum encode:**
```
Hari ini cuaca cerah sekali.
```

**Setelah encode (terlihat sama di text editor biasa):**
```
Hari ini cuaca cerah sekali.
```

**Setelah decode:**
```
>> PESAN RAHASIA KAMU
```

---

## 📁 Output Example

```
================================================================
  [*] ENCODE - Sembunyiin Pesan
================================================================

  [?] Isi pesan/text  : Hari ini cuaca cerah sekali.
  [?] Secret Text     : Ayo main ke rumah saya
  [?] File Output     : pesan.txt

  [*] Memproses...

  [+] Berhasil! File tersimpan: pesan.txt
  [+] Pesan rahasia sudah tersembunyi.
```

```
================================================================
  [*] DECODE - Baca Pesan Tersembunyi
================================================================

  [?] Target : pesan.txt

  [*] Membaca pesan tersembunyi...

  [+] Pesan ditemukan!

  >> Ayo main ke rumah saya
```

---

## ⚠️ Disclaimer

Tool ini dibuat untuk keperluan **edukasi dan penggunaan pribadi**.  
Hanya gunakan pada file milik sendiri atau yang sudah ada izinnya.  
Developer tidak bertanggung jawab atas penyalahgunaan tool ini.

---

## 📜 License

MIT License — bebas dipakai, dimodifikasi, dan disebarkan.  
Tetap cantumkan credit ya. 😎

---

<p align="center">Made with 💻 by <a href="https://github.com/Skyvee-Tech">Skyvee Tech</a></p>
