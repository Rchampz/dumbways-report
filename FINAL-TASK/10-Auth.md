# Auth
1. Instalasi apache2-utils
```
sudo apt install apache2-utils
```
<p align="center">
    <img src="assets\auth1.jpg" />
</p>

2. generate password dengan htpasswd
```
sudo htpasswd -c /etc/nginx/.htpasswd <username>
```
<p align="center">
    <img src="assets\auth2.jpg" />
</p>

masukkan password baru

3. didalam konfigurasi prometheus.conf dapat ditambah dengan
```
location / {
          auth_basic "prometheus";
          auth_basic_user_file /etc/nginx.htpasswd;

          proxy_pass

        }
```
<p align="center">
    <img src="assets\auth3.jpg" />
</p>

4. dan restart nginx
```
sudo nginx -t
sudo systemctl reload nginx
```
<p align="center">
    <img src="assets\reloadnginx.jpg" />
</p>

5. Akses dengan web browser, maka akan muncul tampilan seperti dibawah dan masukkan password yang sudah diset sebelumnya.
<p align="center">
    <img src="assets\auth4.jpg" />
</p>

<p align="center">
    <img src="assets\auth5.jpg" />
</p>
