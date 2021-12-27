# Setup Network

## Konfigurasi koneksi pada server virtual machine VMWare

1. Pada Menu Virtual machine setting, di set network ke bridge untuk mendapatkan koneksi yang sama yang digunakan oleh operating sistem
2. Pindah ke directory `/etc/netplan/` dan edit file .yaml di dalamnya, kemudian simpan.
3. Setelah disave jalankan perintah `sudo apply netplan` untuk mengeksekusi perubahan yang telah dibuat. dan jalankan perintah `ifconfig` untuk mengetahui apakah sudah berhasil konfigurasi IP yang telah dibuat
4. Jalankan `ping google.com` untuk mengecek apakah terhubung ke internet. jika sudah terhubung maka proses ping google akan berjalan 