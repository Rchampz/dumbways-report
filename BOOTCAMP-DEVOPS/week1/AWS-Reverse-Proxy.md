### Application server
Langkah langkahnya sama dengan membuat server untuk reverse proxy. Disini akan menggunakan aplikasi dumbflix (https://github.com/sgnd/dumbflix-frontend)

1. Pada `Step 6: Configure Security Group` pilih rules `all trafic` yang digunakan untuk membuka semua port
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreateapp1.jpg" />
</p>

2. Jika sudah selesai, setting elastic IPs untuk sementara guna mendownload aplikasi dumbflix dan menginstall kebutuhan untuk menjalankan aplikasi dumbflix tersebut yaitu nodejs
```
git clone https://github.com/sgnd/dumbflix-frontend
```
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreateapp2.jpg" />
</p>

3. Kemudian install nodeJs dapat dilihat [disini](https://github.com/rifaicham/dumbways-report/blob/main/week-4/README.md#node-js). Disini mengggunakan Nodejs versi 10 sesuai petunjuk dari aplikasi dumbflix, dan jika sudah terinstall jalankan perintah
```
nvm -v
npm -v
npm install
```
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreateapp3.jpg" />
</p>

4. Kemudian jalankan aplikasi dengan perintah 
```
npm start
```
Jika sudah berjalan coba akses via web browser dengan `alamatIPserver:3000` jika berhasil maka akan muncul aplikasi dumbflix
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreateapp4.jpg" />
</p>

5. Sekarang, untuk menjalankannya di backgorund dibutuhkan pm2, install dengan perintah
```
npm install pm2 -g
```
kemudian inisiasi pm2 dengan `pm2 init simple` dan akan terbentuk file ecosystem.config.js. Edit dengan perintah `nano cosystem.config.js` dan tambahkan aplikasi Dumbflix
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreateapp5.jpg" />
</p>

6. jalankan aplikasi melalui pm2 dengan 
```
pm2 start
```
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreateapp6.jpg" />
</p>

7. jika sudah coba akses aplikasi, dan jika berhasil maka akan muncul aplikasi di web browser
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreateapp7.jpg" />
</p>

### Reverse proxy

1. Akses server gateaway dan untuk menggunakan reverse proxy disini menggunakan Nginx. Instal terlebih dahulu Nginx
```
sudo apt install nginx
```
Kemudian cek apakah sudah berhasil dengan mengakses ke `IPaddreesserver:80` yang mana akan mengakses port 80 pada server yang telah dibuat

2. Masuk kedalam direktori nginx    
```
cd /etc/nginx/
```

3. jika sudah buat directory baru `sudo mkdir frontend`

4. Jalankan perintah `sudo nano nginx.conf` untuk melakukan penambahan folder yang telah dibuat kedalam nginx.conf dengan memasukan `include /etc/nginx/frontend/*;` ke dalam file tersebut
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/reverse4.jpg" />
</p>

5. Masuk kedalam direktori yang telah dibuat
```
cd frontend
```
6. Membuat file konfigurasi reverse proxy dengan menjalankan perintah `sudo nano dumbflix-conf`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/reverse6.jpg" />
</p>

7. Jalankan perintah `sudo nginx -t` yang akan mengecek apakah konfigurasi yang telah dibuat benar

8. jalankan perintah `sudo systemctl reload nginx` untuk memuat ulang nginx

9. Selanjutnya buat website agar dikenali public dengan cloudflare pada menu DNS dan tambahkan `Add record` dan masukkan nama serta IP dari server kita
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/reverse8.jpg" />
</p>

10. Sekarang coba akses dari webbrowser dengan `nama.onlinecamp.id `
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/reverse10.jpg" />
</p>
