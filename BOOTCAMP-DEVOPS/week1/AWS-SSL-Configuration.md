# AWS SSL Configuration

Untuk mengamankan website kita, perlu menggunakan HTTPS agar dapat diakses oleh web browser modern dengan aman. 

1. Buka dashboard Cloudflare dan buka menu  `my profile`
2. Pilih view pada kolom Global Api Key dan Masukan password. maka akan muncul API Keys
3. Masuk kedalam server gateaway dan buat folder `.cloudflare`
```
mkdir .clodflare
```
4. masuk kedalam folder tersebut dan buat file api.key

5. Jalankan perintah `sudo chmod 400 api.key` agar api key dapat diakses

6. Lakukan instalasi certbot
    - Jalankan perintah 
    ```
    sudo snap install core; sudo snap refresh core
    ```
    - Lakukan instalasi certbot dengan `sudo snap install --classic certbot`
    - kemudian perintah `sudo ln -s /snap/bin/certbot /usr/bin/certbot`
7. Kemudian jalankan perintah `sudo certbot` dan masukkan email yang telah diset dalam API key dan file api.key yang telah dibuat sebelumnya

8. Jika sudah selesai, bisa dilakukan pengecekan sertifikasi HTTPS dengan masuk kedalam `cd /etc/nginx/frontend` dan buka file konfigurasi dumbflix-conf `cat dumbflix-conf`

9. Buka web browser dan akses website yang sebelumnya maka akan ditampilkan dalam HTTPS