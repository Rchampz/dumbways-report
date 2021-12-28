# VMWare Install Application

1. Aplikasi yang akan dijalankan adalah dumbflix (https://github.com/sgnd/dumbflix-frontend). Gunakan perintah 
```
git clone https://github.com/sgnd/dumbflix-frontend
```

2. Lakukan instalasi NodeJS (https://github.com/nodesource/distributions/blob/master/README.md#debinstall)
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
exec bash
nvm -v
nvm install 14
node -v
npm -v
```

3. Masuk ke direktori dumbfilx-frontend dan jalankan perintah npm install
```
cd dumbflix-frontend
```
4. Jika sudah jalankan aplikasi dengan npm start dan buka `alamatIPserver:3000` kedalam web browser

## Reverseproxy
1. Menggunakan aplikasi Nginx
  - install nginx `sudo apt install nginx`
  - `sudo systemctl status nginx` untuk melihat apakah nginx sudah aktif
2. Pindah kedirektori nginx `cd etc/nginx`
3. Membuat direktori baru, merubah permission direktori agar mudah diakses dan masuk kedalam direktori tersebut
  ```
  sudo mkdir dumbflix
  sudo chown fai:fai dumbflix
  cd dumbflix
  ```
4. kemudian buat file konfigurasi untuk reverse proxy `nano dumbflix.xyz`
5. kembali ke direktori nginx dan ubah file nginx.conf `sudo nano nginx.conf` dan test konfigurasi yang telah dibuat dengan `sudo nginx -t` dan reload nginx `sudo systemctl reload nginx`
6. buka komputer ynag digunakan untuk web browser dan akses `sudo nano /etc/hosts` dan kemudian simpan perubahan.
7. akses dari web browser alamat yang sudah diset `rifai.xyz`
  
