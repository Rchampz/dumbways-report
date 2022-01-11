# Webserver
## Requirements
- Web server nginx / apache2
- For reserve proxy and SSL configuration

## Instructions
- Setup web server nginx / apache2
- SSL support - Integrate Cloudflare with Let's Encrypt

## Answer
- Membuat file konfigurasi nginx
    - frontend.conf
    ```
    server {
      server_name housy.rifai.xyz;

      location / {
         proxy_pass http://172.19.156.209:1001;
      }
    }
    ```
    - backend.conf
    ```
    server {
      server_name api.housy.rifai.xyz;

      location / {
         proxy_pass http://172.19.156.209:1003;
      }
    }
    ```
- Jalankan dengan perintah `sudo ansible-playbook setup-gateaway.yml`
- Jika sudah, dapat diubah /etc/hosts terlebih dahulu agar bisa diakses lokal. Kemudian buka web browser dan akses alamat web server yang sudah diset melalui nginx
