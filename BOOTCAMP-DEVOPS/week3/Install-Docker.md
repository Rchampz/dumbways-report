# STEP BY STEP
1. login kedalam docker dengan perintah `docker login` namun jika terdapat error seperti `Got permission denied` seprti pada gambar dibawah, jalankan perintah `sudo chmod 666 /var/run/docker.sock` dan lakukan kembali docker login, maka login akan berhasil.
<p align="center">
  <img src="assets\dockerlogin.jpg" />
</p>


2. Buat container untuk nginx dengan perintah
```
docker container create --name nginxserver -p 9090:80 nginx
```
