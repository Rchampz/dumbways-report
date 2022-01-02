# Install Jenkins

# 1. Create new server for jenkins
1. menggunakan docker run 
 - Jalankan perintah `sudo docker pull jenkins`
 - kemudian perintah `sudo docker run -d -p 8080:8080 -p 50000:50000 jenkins`
 - proses akan berjalan dibackground. dan jalankan perintah `sudo docker logs <nama/ID container jenkins>`

2. menggunakan docker-compose.yml
 - buat file docker-compose.yml dengan perintah `nano docker-compose.yml`
 - isikan perintah berikut
    ```
    version: '3.8'
    services:
      jenkins:
        image: jenkins/jenkins:lts
        container _name: myjenkins
        privileged: true
        user: root
        ports:
          - 8080:8080
          - 50000:50000
        container_name: jenkins
        volumes:
          - /home/${myname}/jenkins_compose/jenkins_configuration:/var/jenkins_home
          - /var/run/docker.sock:/var/run/docker.sock
    ```
 - kemudian jalankan perintah `docker-compose up -d` untuk menjalankan dockercompose
 - jika sudah jalankan perintah `sudo logs myjenkins` dan cari password authentication

# Reverse proxy