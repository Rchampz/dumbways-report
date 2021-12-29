# Reverse Proxy Backend

1. Buka server gateaway yang telah dibuat dan akses kedalam `cd /etc/nginx` 
2. Membuat direktori backend `mkdir backend` dan buat file backend-conf `nano backend-conf` 
3. Kembali ke direktori nginx dan tambahkan direktori yang telah dibuat agar dideteksi oleh nginx pada file `nginx.conf`
4. Lakukan perintah `sudo nginx -t` untuk melakukan pengecekan konfigurasi dan jika tidak ada error bisa direload nginx dengan perintah `sudo systemctl reload nginx`

Dilanjukan pada proses custom domain disini