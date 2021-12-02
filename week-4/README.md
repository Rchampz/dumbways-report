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
  2. Kemudian install express untuk bisa menjalankan nodejs dengan perintah `npm install express --save` Dokumentasi untuk expressjs lebiih lengkap [disini](https://expressjs.com/)
  3. Lalu buat file index.js dan edit menggunakan `nano index.js` dan tuliskan code program yang ingin dijalankan. Disini saya akan menjalankan code dibawah
```
const express = require('express')
const app = express()
const port = 3000
const path = require('path');
const router = express.Router();

router.get('/',function(req,res){
  res.sendFile(path.join(__dirname+'/index.html'));
  //__dirname : It will resolve to your project folder.
});

app.use('/',router);
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
```
Code diatas digunakan untuk menjalankan index.html yang akan ditampilkan ketika localhost:3000 diakses via web browser. Kemudian save file index.js
4. Setelah disave, jalankan perintah `node index.js` untuk menjalankan aplikasi yang sudah dibuat dan akan muncul string seperti berikut.
5. Kemudian buka web browser dan akses `localhost:3000` untuk menampilkan aplikasi yang sudah dibuat dan diset ke port 3000 untuk bisa diakses

### Python
