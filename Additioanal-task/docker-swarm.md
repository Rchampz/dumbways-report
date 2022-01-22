# Docker swarm
Docker swarm merupakan teknologi yang dibuat untuk mempermudah idstribusi aplikasi. Docker swarm mempermudah untuk menejemen docker container yang dideploy pada beberapa server.

## Beberapa keuntungan menggunakan docker swarm
1. Mengatasi down lebih cepat
2. mudah untuk scalling aplikasi

## Infrastruktur docker swarm 

<p align="center">
    <img src=assets\Docker-Swarm-Networking.png />
</p>

## Instalasi docker swarm
1. Instal terlebuh dahulu docker. Dapat dilihat [disini](dumbways-report\BOOTCAMP-DEVOPS\week3\Install-Docker.md)

2. `sudo docker swarm init --advertise-addr <alamatIPservermanagaer>` Perintah untuk inisiasi docker swarm dan dijalankan pada server yang akan menjadi manager docker-swarm.
<p align="center">
    <img src=assets\install-docker-swarm2.jpg />
</p>

3. `sudo docker swarm join --token <tokenygdigenerate> <alamatIPservermanager>:2377`. perintah yg dijalankan dari server lain untuk menjadi worker 
<p align="center">
    <img src=assets\install-docker-swarm3.jpg />
</p>

4. Jika sudah dijalankan di server worker dapat dicek melalui server manager dengan perintah `sudo docker node ls`
<p align="center">
    <img src=assets\install-docker-swarm4.jpg />
</p>


## Deploy aplikasi menggunakan docker-swarm
1. `sudo docker service create --replicas1 --name helloworld alpine ping google.com` Disini menggunakan aplikasi helloworld yang dipull untuk ping ggogle dan membuat 1 container 
<p align="center">
    <img src=assets\deploy-aplikasi-docker-swarm1.jpg />
</p>

2. Kemudian cek hasil deploy dengan perintah `sudo docker service ps <namacontainer>`
<p align="center">
    <img src=assets\deploy-aplikasi-docker-swarm2.jpg />
</p>


## Menduplikasi aplikasi docker-swarm
1. `sudo docker service scale helloworld=3` dengan perintah tersebut akan menduplikasi aplikasi helloworld yang sebelumnya menjadi 3 
<p align="center">
    <img src=assets\duplikasi-aplikasi-docker-swarm1.jpg />
</p>

2. Untuk mengeceknya apakah terdeploy sebanyak yang di inginkan dapat dicek dengan `sudo docker service ps helloworld`
<p align="center">
    <img src=assets\deploy-aplikasi-docker-swarm2.jpg />
</p>

## Menghapus aplikasi yang dideploy untuk docker-swarm
1. `sudo docker service rm helloworld` untuk menghapus aplikasi helloworld sebelumnya 
2. cek dengan perintah `sudo docker service ps helloworld` 
<p align="center">
    <img src=assets\hapus-aplikasi-docker-swarm.jpg />
</p>


# Microservices
<p align="center">
    <img src=assets\monolith-micorservices.jpg />
</p>

1. Monolith
   Aplikasi yang dideploy sebagai satu kesatuan. Semua fitur dibuat dalam satu aplikasi besar.
   Kekurangannya adalah jika ada satu fitur yang error atau gagal beroperasi maka akan berpengaruh terhadap seluruh aplikasi.
   kelebihannya adalah mudah dikembangkan, karena jika dalam satu aplikasi besar hanya menggunakan satu bahasa pemrograman.  
2. Microservices
   Merupakan kumpulan dari beberapa aplikasi-aplikasi kecil yang memiliki fiturnya masing-masing dan membentuk satu aplikasi besar. untuk menghubungkan antar fitur-fitur menggunakan network.

## Aplikasi todo
1. clone aplikasi `https://github.com/sgnd/todo-app-microservice`
<p align="center">
    <img src=assets\microservice1.jpg />
</p>

2. masuk kedalam folder `cd todo-app-microservice/`
3. jalankan perintah `docker stack deploy --compose-file docker-compose.yml stack-todo`
<p align="center">
    <img src=assets\microservice2.jpg />
</p>

4. Dapat dilihat melalui `docker ps` untuk mengetahui apakah aplikasi terdeploy
<p align="center">
    <img src=assets\microservice3.jpg />
</p>

5. Jika sudah akses web browser dengan alamat `<alamatIP>:4000` maka akan mencul aplikasi playground 
<p align="center">
    <img src=assets\microservice4.jpg />
</p>

6. untuk menghapus aplikasi yang sudah ter-deploy dapat menggunakan perintah `docker stack rm stack-todo`
<p align="center">
    <img src=assets\microservice5.jpg />
</p>
