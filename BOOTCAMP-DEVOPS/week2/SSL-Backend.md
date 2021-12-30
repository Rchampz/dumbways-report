# SSL Backend
1. Buka dashboard Cloudflare dan buka menu  `my profile`
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/ssl1.jpg" />
</p>

2. Pilih view pada kolom Global Api Key dan Masukan password. maka akan muncul API Keys
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/ssl2.jpg" />
</p>

3. Masuk kedalam server gateaway dan buat folder `.cloudflare`
```
mkdir .clodflare
```
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/ssl3.jpg" />
</p>

4. masuk kedalam folder tersebut dan buat file api.key
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/ssl4.jpg" />
</p>

5. Jalankan perintah `sudo chmod 400 api.key` agar api key dapat diakses

6. Lakukan instalasi certbot
    - Jalankan perintah 
    ```
    sudo snap install core; sudo snap refresh core
    ```
    - Lakukan instalasi certbot dengan `sudo snap install --classic certbot`
    - kemudian perintah `sudo ln -s /snap/bin/certbot /usr/bin/certbot`
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/ssl6.jpg" />
</p>

7. Jalankan perintah `sudo certbot` untuk mendapatkan autentifikasi. namun jika muncul error seperti ini tandanya kita sudah terlalu banyak menggunakan certbot. solusinya tunggu sampai bisa melakukan autentifikasi kembali atau dengan membuat ssl dengan yg lain. 
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/sslerror.jpg" />
</p>

