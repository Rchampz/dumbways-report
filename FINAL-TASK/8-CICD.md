# CI/CD

## Docker-Jenkins
- Buat file docker-compose untuk instalasi jenkins didalam direktory `files`, karena disini kita akan menginstall versi docker
```
docker-compose-jenkins.yml
---
version: '3.9'
services:
  jenkins:
    image: jenkins/jenkins:lts
    ports:
      - 8080:8080
      - 50000:50000
    privileged: true
    user: root
    container_name: jenkins
    volumes:
      - ~jenkins:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
      - /usr/local/bin/docker:/usr/local/bin/docker   
```
- Kemudian buat file ansible-playbook yang berisi perintah untuk instalasi jenkins pada server cicd
```
setup-jenkins.yml
---
- name: Setup Jenkins Docker
  hosts: app
  become: true
  tasks:
    - name: Copy docker compose ci/cd
      copy:
        src: docker-compose-cicd.yml
        dest: /home/ubuntu/

    - name: Run docker compose
      shell: "docker-compose -f docker-compose-cicd.yml up -d"
      args:
        executable: /bin/bash 
```
## Setup Jenkins
- Masuk kedalam server yang diinstall docker jenkins
    - amankan docker.sock dengan perintah `sudo chmod 666 /var/run/docker.sock` 
    - masuk docker jenkins bash `docker exec -it <id container jenkins> bash` dan jalankan perintah `cat var/jenkins_home/secrets/initialAdminPassword` dan copy isi file tersebut
<p align="center">
    <img src="assets\setupjenkins.jpg" />
</p>
<p align="center">
    <img src="assets\jenkinsadminuser.jpg" />
</p>

- buka jenkins dari web browser dan paste intialpassword yg sudah dicopy sebelumnya
<p align="center">
    <img src="assets\pasteinitialpassjenkins.jpg" />
</p>

- Kemudian install pluggin dan tunggu sampai selesai
<p align="center">
    <img src="assets\setupjenkins1.jpg" />
</p>

## Connect jenkins with server app

## Create a job (build by push github)
 ### Frontend
 1. Pilih option `manage jenkins` dan pilih `manage plugins`
<p align="center">
    <img src="assets\setupjob1.jpg" />
</p>

 2. setelah itu serch `github integration` di kolom `available` pilih `install witout restart`
<p align="center">
    <img src="assets\setupjob2.jpg" />
</p>

 3. Setelah proses selesai pilih `Go back to the top page`
<p align="center">
    <img src="assets\setupjob3.jpg" />
</p>

 4. Jika sudah kembali ke `dashboard` pilih `create a job`
<p align="center">
    <img src="assets\setupjob4.jpg" />
</p>

 5. Beri nama job dan pilih `freestyle project` dan `OK`
<p align="center">
    <img src="assets\setupjob5.jpg" />
</p>

 6. Centang `Github project` dan isikan `project URL` dengan url repository yang akan dibuat jobnya
<p align="center">
    <img src="assets\setupjob6.jpg" />
</p>

 7. Pada bagian `Source Code Management` pilih `Git` dan isikan `Repository URL` dengan alamat repository untuk jobnya
<p align="center">
    <img src="assets\setupjob7.jpg" />
</p>

 8. Kemudian pada `Branch Specifier` bisa di isikan spesifik untuk branch yang digunakan untuk job 
<p align="center">
    <img src="assets\setupjob8.jpg" />
</p>

 9.  pada `Build Triggers` pilih `GitHub hook trigger for GITScm polling` 
<p align="center">
    <img src="assets\setupjob9.jpg" />
</p>

 10. Masuk kedalam gihub repository dan pilih `setting`. Dalam setting pilih option `webhook`
<p align="center">
    <img src="assets\setupjob10.jpg" />
</p>

 11. Isikan `Payload URL` dengan URL yang kita gunakan untuk instalasi jenkins dg format `http://<alamatJenkins>/github-webhook/`. Pilih `Just the push event` untuk mengaktifkan webhook jika ada push dalam repository. Dan centang `Active`. Terakhir pilih `Add webhook`
<p align="center">
    <img src="assets\setupjob11.jpg" />
</p>
<p align="center">
    <img src="assets\setupjob11.1.jpg" />
</p>

 12. Untuk testing, coba lakukan perubahan direpository dan push kemudian cek apakah ada build terbaru dideteksi oleh jenkins (Disini menggunakan contoh mengubah isi dari red.md dan dilakukan push)
<p align="center">
    <img src="assets\setupjob12.jpg" />
</p>
<p align="center">
    <img src="assets\setupjob13.jpg" />
</p>

 ### Backend
 1. Langkah-langkahnya kurang lebih sama untuk frontend dan ketika sudah test dengan push
<p align="center">
    <img src="assets\setupjobbackend1.jpg" />
</p>
<p align="center">
    <img src="assets\setupjobbackend2.jpg" />
</p>
<p align="center">
    <img src="assets\setupjobbackend3.jpg" />
</p>

# KENDALA
1. Publish over SSH disuspend oleh jenkins, jadi untuk instalasi pluggin tidak akan berhasil
<p align="center">
    <img src="assets\publishoversshsuspend.jpg" />
</p>

2. Sejak di jenkins tidak mendukung perintah sudo, maka ketika digunakan bersamaan dengan multipass akan menimbulkan proses build gagal
<p align="center">
    <img src="assets\trouble3.jpg" />
</p>
<p align="center">
    <img src="assets\trouble4.jpg" />
</p>
<p align="center">
    <img src="assets\trouble5.jpg" />
</p>
