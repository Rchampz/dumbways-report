# Step by step build images and push to hub.docker.com

1. clone aplikasi yang akan dibuatkan images-nya. 
- `git clone https://github.com/sgnd/dumbflix-frontend`
- `git clone https://github.com/sgnd/dumbflix-backend`

2. Masuk kedalam direktori aplikasi dumbflix yang sudah didownload. Kemudian buat file Dockerfile
```
cd dumbflix-frontend
nano Dockerfile
```
Jika sudah maka isikan sesuai format dari docker dan bagaimana program berjalan.
```
# menggunakan node v10
FROM node:10 
# tempat dimana aplikasi akan disimpan
WORKDIR /app 
COPY . .
# Perintah untuk menjalankan program
RUN npm install
# menjalankan aplikasi diport 3000
EXPOSE 3000
CMD ["npm", "start"]
```
3. Jika sudah jalan perintah `docker build -t rifaicham/dumbflix-frontend .` Maka proses akan berjalan
4. Proses sudah selesai, kemudian jalankan perintah `docker images ` untuk melihat apakah images berhasil dibuat. Jika terdapat dalam list, maka images berhasil dibuat. 
5. Untuk mengunggahnya ke docker hub, dapat dengan perintah
```
docker push <namaimages>:version
```
6. Jika proses upload sudah berhasil, cek di docker hub apakah sudah teruupload.

7. Proses docker push untuk aplikasi dumbflix-backend sama dengan aplikasi frontend
- menuju direktori backend `cd dumbflix-backend`
- buat file Dockerfile `nano Dockerfile`
- kemudian isi dockerfile sesuai dengan format
```
# menggunakan node v10
FROM node:10 
# tempat dimana aplikasi akan disimpan
WORKDIR /app 
# copy semua file
COPY . .
# Perintah untuk menjalankan program
RUN npm install
# menjalankan aplikasi diport 5000
EXPOSE 5000
CMD ["npm", "start"]
```
- Kemudian `docker build -t rifaicham/dumbflix-backend .`
- jika proses sudah selesai jalankan perintah `docker images`
- Kemudian push aplikasi dengan perintah `docker push rifaicham/dumbflix-backend .`
