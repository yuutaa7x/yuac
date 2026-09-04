# Yuu's Universal Avatar Customizer (YUAC)

[English](#english) | [Indonesia](#indonesia)

---

## English

A powerful and lightweight Roblox script to freely customize your avatar with Headless, Korblox, and custom catalog assets, complete with live synchronization to other players.

### How to Use
Copy the code block below and run it in your Roblox executor:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/yuutaa7x/yuac/main/yuac.lua"))()
```

### Key Features
- **Custom Assets ID:** Equip accessories (Shirts, Pants, Hair, Hats, etc.) directly using Roblox Catalog IDs.
- **R15 & R6 Support:** Fully compatible with both classic R6 and modern R15 character rigs.
- **Fake Headless & Korblox:** Includes precision position and rotation configuration tweaks for R15 Korblox legs.
- **Live Sync:** Your customized avatar will automatically sync and be visible to other players running YUAC in the same server.
- **Non-Destructive:** Fully restores your original avatar meshes, textures, and body colors upon destroying the UI.
- **Evade / FPP Compatibility:** Fully supports Evade and other First-Person camera games. Custom accessories will automatically hide when zooming into first-person view.

### Changelogs (v2.0)
- **Added:** English/Indonesian language translation selector.
- **Added:** First-Person Camera (FPP) compatibility. Custom hats and accessories now correctly hide when zooming in, mirroring default Roblox behavior.
- **Fixed:** Restructured accessory hierarchy to prevent physics bugs, collision issues, and bouncing.
- **Fixed:** Particles, beams, and trails now properly disappear when entering FPP mode.
- **Fixed:** Corrected camera bug in Evade and removed manual toggle (Force Hide is now 100% automatic).
- **Fixed:** Memory leak in the cleanup function; destroying the UI now gracefully restores the character's original items and body colors.
- **Changed:** Improved UI layout and introduced a setup wizard on first execution.

### Community
Have questions or want to discuss the script? 
Join our Discord server: [Discord Server](https://discord.gg/dzGKnf5pSK)

---

## Indonesia

Script Roblox ringan namun tangguh untuk mengustomisasi avatar secara bebas dengan fitur Headless, Korblox, dan aset katalog custom, lengkap dengan sinkronisasi langsung ke pemain lain.

### Cara Pakai
Salin kode di bawah ini lalu jalankan di dalam *executor* Roblox milikmu:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/yuutaa7x/yuac/main/yuac.lua"))()
```

### Fitur Utama
- **Custom Assets ID:** Pakai aksesoris (Baju, Celana, Rambut, Topi, dll) langsung menggunakan ID dari Roblox Catalog.
- **R15 & R6 Support:** Sepenuhnya kompatibel dengan sistem pergerakan R6 klasik maupun R15 modern.
- **Fake Headless & Korblox:** Dilengkapi dengan fitur konfigurasi presisi untuk mengatur tinggi dan rotasi kaki Korblox di R15.
- **Live Sync:** Avatar kustommu akan otomatis terlihat oleh pemain lain di server yang juga menjalankan script YUAC.
- **Non-Destructive:** Mengembalikan mesh avatar, tekstur, dan warna kulit ke kondisi semula secara utuh ketika UI dihapus.
- **Evade / FPP Compatibility:** Mendukung penuh Evade dan game First-Person lainnya. Aksesoris custom akan otomatis menghilang saat kamera di-zoom ke mode *first-person*.

### Changelogs (v2.0)
- **Ditambahkan:** Fitur pemilih bahasa (Inggris/Indonesia).
- **Ditambahkan:** Kompatibilitas Kamera First-Person (FPP). Topi dan aksesoris custom kini otomatis menghilang saat *zoom in*, persis seperti sistem bawaan Roblox.
- **Diperbaiki:** Restrukturisasi hierarki aksesoris untuk mencegah *bug* fisika, masalah tabrakan (collision), dan mental-mental.
- **Diperbaiki:** Efek partikel, *beam*, dan *trail* sekarang ikut menghilang saat masuk ke mode FPP.
- **Diperbaiki:** Perbaikan *bug* kamera di game Evade dan menghapus *toggle* manual (penyembunyian aksesoris sekarang 100% otomatis).
- **Diperbaiki:** *Memory leak* pada fungsi *cleanup*; menghancurkan UI sekarang akan memulihkan barang dan warna kulit asli karakter dengan sempurna.
- **Diubah:** Tata letak UI yang lebih rapi dan penambahan *setup wizard* saat pertama kali dijalankan.

### Komunitas
Punya pertanyaan atau ingin mencari teman bermain? 
Bergabunglah dengan Discord kami: [Discord Server](https://discord.gg/dzGKnf5pSK)

---
*Created by [Yuutaa7x](https://github.com/yuutaa7x)*
