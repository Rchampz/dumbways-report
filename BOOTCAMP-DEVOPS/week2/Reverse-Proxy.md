# Reverse Proxy Backend

1. Buka server gateaway yang telah dibuat dan akses kedalam `cd /etc/nginx` 
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/reverse1.jpg" />
</p>

2. Membuat direktori backend `mkdir backend` dan buat file backend-conf `nano backend-conf` 
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/reverse2.jpg" />
</p>

3. Kembali ke direktori nginx dan tambahkan direktori yang telah dibuat agar dideteksi oleh nginx pada file `nginx.conf`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/reverse3.jpg" />
</p>

4. Lakukan perintah `sudo nginx -t` untuk melakukan pengecekan konfigurasi dan jika tidak ada error bisa direload nginx dengan perintah `sudo systemctl reload nginx`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/reverse4.jpg" />
</p>

Dilanjukan pada proses [custom domain](https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/Custom-Domain.md)
