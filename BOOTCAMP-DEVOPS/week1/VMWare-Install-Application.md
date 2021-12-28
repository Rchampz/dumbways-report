# VMWare Install Application

1. Aplikasi yang akan dijalankan adalah dumbflix (https://github.com/sgnd/dumbflix-frontend). Gunakan perintah 
```
git clone https://github.com/sgnd/dumbflix-frontend
```
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/app1.jpg" />
</p>

2. Lakukan instalasi NodeJS (https://github.com/nodesource/distributions/blob/master/README.md#debinstall)
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
exec bash
nvm -v
nvm install 14
node -v
npm -v
```
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/app3.jpg" />
</p>

3. Masuk ke direktori dumbfilx-frontend dan jalankan perintah npm install
```
cd dumbflix-frontend
```
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/app2.jpg" />
</p>

4. Jika sudah jalankan aplikasi dengan npm start dan buka `alamatIPserver:3000` kedalam web browser
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/app4.jpg" />
</p>

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
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/appreverse4.jpg" />
</p>

5. kembali ke direktori nginx dan ubah file nginx.conf `sudo nano nginx.conf` dan test konfigurasi yang telah dibuat dengan `sudo nginx -t` dan reload nginx `sudo systemctl reload nginx`
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/appreverse5.jpg" />
</p>

6. buka komputer ynag digunakan untuk web browser dan akses `sudo nano /etc/hosts` dan kemudian simpan perubahan.
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/appreverse6.jpg" />
</p>

7. akses dari web browser alamat yang sudah diset `rifai.xyz`
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/appreverse7.jpg" />
</p>
