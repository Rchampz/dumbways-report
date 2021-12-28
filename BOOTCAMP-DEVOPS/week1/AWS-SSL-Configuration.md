# AWS SSL Configuration

Untuk mengamankan website kita, perlu menggunakan HTTPS agar dapat diakses oleh web browser modern dengan aman. 

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
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/ssl5.jpg" />
</p>

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

7. Kemudian jalankan perintah `sudo certbot` dan masukkan email yang telah diset dalam API key dan file api.key yang telah dibuat sebelumnya
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/ssl7.jpg" />
</p>

8. Jika sudah selesai, bisa dilakukan pengecekan sertifikasi HTTPS dengan masuk kedalam `cd /etc/nginx/frontend` dan buka file konfigurasi dumbflix-conf `cat dumbflix-conf`
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/ssl8.jpg" />
</p>

9. Buka web browser dan akses website yang sebelumnya maka akan ditampilkan dalam HTTPS
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/ssl.jpg" />
</p>
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/ssl9.jpg" />
</p>
