# Week 4
Jelaskan maksud dari week 4 ini

# Kebutuhan
1. Buat dokumentasi
   - aplikasi node js
   - aplikasi python
   - aplikasi golang
2. Buat monitoring bagaimana cara mengecek aplikasi hidup/mati beserta langkah-langkahnya
3. tiap aplikasi buat reverse proxy (dengan format (namaaplikasi.rifai.xyz))
4. load balance nginx dokumentasi dan implementasi


# Penyelesaian
1. [Dokumentasi pembuatan aplikasi dan konfigurasi dalam](https://github.com/rifaicham/dumbways-report/blob/main/week-4/README.md#dokumentasi-pembuatan-aplikasi-dan-konfigurasi)
   - Node.js
   - python
   - golang
2. Monitoring
3. Reverse proxy
4. Load Balance Nginx

# Jawaban

## 1. Dokumentasi pembuatan aplikasi dan konfigurasi
### Node Js
- Instalasi node.js
  1. Dapat melihat di website nodejs.org atau langsung melalui terminal dengan perintah `wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash` 
  2. Setelah itu jalankan perintah `nvm install 16.13.0` untuk menginstall node js versi 16.13.0 lts.
     namun jika muncul notifikasi `command 'nvm' not found` jalankan perintah `source ~/.profile`
  3. dilanjutkan dengan perintah `nvm use 16` untuk menggunakan yang versi 16
  4. untuk mengecek apakah sudah terinstal dan melihat versi berapakah yang digunakan dengan cara `node -v` dan `npm -v`. Jika belum terdeteksi jalankan perintah `exec bash` 
- Jika sudah terinstal sekarang kita mencoba membuat aplikasi sederhana menggunakan node.js
  1. Membuat direktori untuk menyimpan aplikasi nodejs, kemudian msuk kedalam direktori tersebut dan jalankan perintah `npm init -y` yang berguna untuk inisiasi bahwa dalam program tersebut ada aplikasi nodejs
  2. Kemudian install express untuk bisa menjalankan nodejs dengan perintah `npm install express --save` 
  3. Lalu buat file index.js dan edit menggunakan `nano index.js` dan tuliskan code program yang ingin dijalankan. 
