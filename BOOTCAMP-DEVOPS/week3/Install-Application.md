# Install Application

## Membuat container aplikasi
1. Untuk aplikasi front end
- Jalankan perintah 
```
sudo docker run -itd --name frontend -p 1001:3000 frontend:1
```
- Jika sudah jalankan perintah `docker container ls -a` untuk melihat apakah container berhasil terbuat
<p align="center">
    <img src="assets\containerapp.jpg" />
</p>

2. Untuk aplikasi backend
- Jalankan perintah
```
sudo docker run -itd --name frontend -p 1002:5000 backend:1
```
<p align="center">
    <img src="assets\containerapp2.jpg" />
</p>

3. akses kedua aplikasi via web-browser
<p align="center">
    <img src="assets\containerapp3.jpg" />
</p>

## Menjalankan aplikasi dengan docker-compose

Disini akan menjalan aplikasi dengan docker-compose
### kondisi 1 jika sudah terbuat imagenya
1. buat file docker-compose.yml `nano docker-compose.yml`. dan isikan seperti berikut
```
version: '3'

services:

 frontend:
  container_name: frontend1
  image: rifaicham/dumbflix-frontend
  stdin_open: true
  ports:
   - 2001:3000

 backend:
  container_name: backend1
  image: rifaicham/dumbflix-backend
  stdin_open: false
  ports:
   - 2002:5000
```
2. Kemudian jalankan perintah
    ```
    sudo docker-compose up -d
    ```
maka akan muncul seperti dibawah. dan cek menggunakan `sudo docker ps` untuk melihat container berjalan. 
<p align="center">
    <img src="assets\dockercomposeapp.jpg" />
</p>

### kondisi 2 jika belum ada images aplikasi harus menggunakan build
```
version: '3'

services:

 frontend:
  container_name: frontend
  build: ./dumbflix-frontend # letak dimana berkas dockerfile
  stdin_open: true
  ports:
   - 1001:3000

 backend:
  container_name: backend
  build: ./dumbflix-backend
  stdin_open: false
  ports:
   - 1002:5000

```

