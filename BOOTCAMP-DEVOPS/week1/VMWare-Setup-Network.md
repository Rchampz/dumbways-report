# Setup Network

## Konfigurasi koneksi pada server virtual machine VMWare

1. Pada Menu Virtual machine setting, di set network ke bridge untuk mendapatkan koneksi yang sama yang digunakan oleh operating sistem
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/setupnetwork.jpg" />
</p>

2. Pindah ke directory `/etc/netplan/` dan edit file .yaml di dalamnya, kemudian simpan.
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/setupnetwork1.jpg" />
</p>

3. Setelah disave jalankan perintah `sudo apply netplan` untuk mengeksekusi perubahan yang telah dibuat. dan jalankan perintah `ifconfig` untuk mengetahui apakah sudah berhasil konfigurasi IP yang telah dibuat
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/setupnetwork2.jpg" />
</p>

4. Jalankan `ping google.com` untuk mengecek apakah terhubung ke internet. jika sudah terhubung maka proses ping google akan berjalan 
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/setupnetwork3.jpg" />
</p>
