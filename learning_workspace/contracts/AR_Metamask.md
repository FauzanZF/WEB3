# Pengenalan MetaMask 🦊

## Daftar Isi
- [Apa itu MetaMask?](#apa-itu-metamask)
- [Mengapa Menggunakan MetaMask?](#mengapa-menggunakan-metamask)
- [Cara Instalasi MetaMask](#cara-instalasi-metamask)
- [Membuat Dompet Baru](#membuat-dompet-baru)
- [Mengamankan Dompet](#mengamankan-dompet)
- [Menghubungkan dengan Jaringan](#menghubungkan-dengan-jaringan)
- [Menggunakan MetaMask dengan Remix IDE](#menggunakan-metamask-dengan-remix-ide)
- [Tips Keamanan](#tips-keamanan)

## Apa itu MetaMask?
MetaMask adalah dompet cryptocurrency berbasis browser yang memungkinkan pengguna untuk berinteraksi dengan blockchain Ethereum. Ini berfungsi sebagai jembatan antara browser web regular dan blockchain Ethereum, memungkinkan pengguna untuk menjalankan aplikasi terdesentralisasi (dApps).

## Mengapa Menggunakan MetaMask?
- **Akses ke Web3**: Memungkinkan interaksi dengan aplikasi terdesentralisasi (dApps)
- **Keamanan**: Menyimpan kunci pribadi secara aman di browser
- **Kemudahan Penggunaan**: Interface yang user-friendly
- **Fleksibilitas**: Mendukung multiple networks dan token
- **Integrasi**: Terintegrasi baik dengan berbagai tools development seperti Remix IDE

## Cara Instalasi MetaMask
1. Kunjungi [metamask.io](https://metamask.io/)
2. Klik tombol "Download"
3. Pilih browser yang sesuai (Chrome, Firefox, Brave, atau Edge)
4. Klik "Add to Browser"
5. Ikuti panduan instalasi yang muncul

## Membuat Dompet Baru
1. Klik icon MetaMask di browser
2. Pilih "Create a Wallet"
3. Buat password yang kuat
4. PENTING: Catat dan simpan 12 kata seed phrase dengan aman
5. Verifikasi seed phrase untuk menyelesaikan setup

## Mengamankan Dompet
1. **Seed Phrase**:
   - Jangan pernah membagikan seed phrase
   - Simpan offline di tempat yang aman
   - Pertimbangkan menggunakan metal backup

2. **Password**:
   - Gunakan password yang kuat
   - Jangan gunakan password yang sama dengan akun lain
   - Aktifkan autentikasi dua faktor jika tersedia

## Menghubungkan dengan Jaringan
### Jaringan Default:
- Ethereum Mainnet
- Goerli Test Network
- Sepolia Test Network

### Menambah Jaringan Custom:
1. Buka Settings
2. Pilih Networks
3. Klik "Add Network"
4. Isi detail jaringan:
   - Network Name
   - New RPC URL
   - Chain ID
   - Currency Symbol
   - Block Explorer URL

## Menggunakan MetaMask dengan Remix IDE
1. **Koneksi**:
   - Buka Remix IDE
   - Pilih "Deploy & Run Transactions"
   - Pada "Environment" pilih "Injected Provider - MetaMask"
   - Konfirmasi koneksi di popup MetaMask

2. **Deployment**:
   - Pastikan network yang dipilih sesuai
   - Compile smart contract
   - Klik "Deploy"
   - Konfirmasi transaksi di MetaMask

3. **Interaksi**:
   - Gunakan fungsi contract melalui Remix
   - Konfirmasi setiap transaksi di MetaMask
   - Monitor gas fee dan status transaksi

## Tips Keamanan
1. **Verifikasi Selalu**:
   - Periksa URL website
   - Periksa detail transaksi
   - Verifikasi alamat penerima

2. **Praktik Terbaik**:
   - Update MetaMask secara regular
   - Logout saat tidak digunakan
   - Gunakan hardware wallet untuk jumlah besar
   - Backup seed phrase secara berkala

3. **Hindari**:
   - Membagikan private key
   - Mengklik link mencurigakan
   - Memasukkan seed phrase online
   - Menyetujui transaksi tanpa verifikasi

## Troubleshooting Umum
1. **Transaksi Pending**:
   - Cek gas fee
   - Tunggu konfirmasi jaringan
   - Optionally speed up dengan higher gas

2. **Koneksi Gagal**:
   - Refresh browser
   - Pastikan network yang benar
   - Reset account (Settings > Advanced)

## Referensi dan Sumber Daya
- [Dokumentasi Resmi MetaMask](https://docs.metamask.io/)
- [MetaMask Support](https://support.metamask.io/)
- [Ethereum Gas Tracker](https://etherscan.io/gastracker)
- [MetaMask Forum](https://community.metamask.io/)

---
*Note: Dokumentasi ini dibuat untuk penggunaan dengan Remix IDE. Selalu rujuk ke dokumentasi resmi MetaMask untuk informasi terbaru.*