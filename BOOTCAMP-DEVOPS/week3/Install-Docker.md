# STEP BY STEP
1. Untuk dokumentasinya dapat dilihat di `hub.docker.com`.
- Jalankan perintah `sudo apt update` dan `sudo apt upgrade`
- Kemudian jalankan perintah `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg`

- Jika sudah jalankan perintah berikut untuk instalasi docker`sudo apt-get install docker-ce docker-ce-cli containerd.io`
```
sudo snap install docker     # version 20.10.8, or
sudo apt  install docker.io  # version 20.10.7-0ubuntu5~20.04.2
```
- Jika proses sudah selesai, bisa dijalankan perintah `docker version` untuk melihat versi dari docker yang diinstall
<p align="center">
    <img src="assets\dockerinstall.jpg" />
</p>

2. Jika sudah terinstal login kedalam docker dengan perintah `docker login` namun jika terdapat error seperti `Got permission denied` seprti pada gambar dibawah. ada beberapa solusi. pertama gunakan `sudo` yang kedua jalankan perintah 
```
sudo groupadd docker
sudo usermod -aG docker $USER
```


