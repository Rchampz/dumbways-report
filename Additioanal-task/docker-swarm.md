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
3. `sudo docker swarm join --token <tokenygdigenerate> <alamatIPservermanager>:2377`. perintah yg dijalankan dari server lain untuk menjadi worker 
4. Jika sudah dijalankan di server worker dapat dicek melalui server manager dengan perintah `sudo docker node ls`

## Deploy aplikasi menggunakan docker-swarm
1. `sudo docker service create --replicas1 --name helloworld alpine ping google.com` Disini menggunakan aplikasi helloworld yang dipull untuk ping ggogle dan membuat 1 container 
2. Kemudian cek hasil deploy dengan perintah `sudo docker service ps <namacontainer>`

## Menduplikasi aplikasi docker-swarm
1. `sudo docker service scale helloworld=3` dengan perintah tersebut akan menduplikasi aplikasi helloworld yang sebelumnya menjadi 3 
2. Untuk mengeceknya apakah terdeploy sebanyak yang di inginkan dapat dicek dengan `sudo docker service ps helloworld`

## Menghapus aplikasi yang dideploy untuk docker-swarm
1. `sudo docker service rm helloworld` untuk menghapus aplikasi helloworld sebelumnya 
2. cek dengan perintah `sudo docker service ps helloworld` 