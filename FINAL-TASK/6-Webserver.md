# Webserver
## Requirements
- Web server nginx / apache2
- For reserve proxy and SSL configuration

## Instructions
- Setup web server nginx / apache2
- SSL support - Integrate Cloudflare with Let's Encrypt

## Answer
- Membuat file konfigurasi nginx yang ditaruh dalam direktory files
```
frontend.conf
---
upstream lb-frontend{
       least_conn;
       server 172.19.156.209:1001;
       server 172.19.156.209:1002;
}

server {
      server_name housy.rifai.xyz;

      location / {
         proxy_pass http://lb-frontend;
      }
}
```
```
backend.conf
---
upstream lb-backend{
       least_conn;
       server 172.19.156.209:1003;
       server 172.19.156.209:1004;
}

server {
      server_name api.housy.rifai.xyz;

      location / {
         proxy_pass http://lb-backend;
      }
}
```
```
database.conf
---
```
```
monitoring.conf
---
server {
      server_name monitoring.rifai.onlinecamp.id;

      location / {
         proxy_pass http://172.19.148.146:3000;
      }
}
```
```
jenkins.conf
---
server {
      server_name cicd.rifai.onlinecamp.id;

      location / {
         proxy_pass http://172.19.156.209:8080;
      }
}
```
- Jalankan dengan perintah `sudo ansible-playbook setup-gateaway.yml`
- Jika sudah, dapat diubah /etc/hosts terlebih dahulu agar bisa diakses lokal(atau menggunakan cloudflare jika dapat diakses global). Kemudian buka web browser dan akses alamat web server yang sudah diset melalui nginx

<p align="center">
    <img src="assets\reversefrontend.jpg" />
</p>
<p align="center">
    <img src="assets\reversebackend.jpg" />
</p>
<p align="center">
    <img src="assets\aksesgrafanareverse.jpg" />
</p>

