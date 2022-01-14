# Database

## Requirements
- Setup database SQL with PostgreSQL

## Instructions
- Setup PostgreSQL with Docker
- Set the volume location in /home/username/
- Allow database to remote from another server
- Create database housy and create table with sequelize
- Alternative to convert MySQL database to PostgreSQL : https://pgloader.io

## Answer
### Membuat file docker-compose untuk instalasi postgress
```
nano docker-compose-database.yml
---
version: '3'
services:
  postgresql:
    image: postgres:latest
    container_name: pgsql-database
    environment:
      POSTGRES_USER: root
      POSTGRES_PASSWORD: root
      POSTGRES_DB: housy
    ports:
      - 5432:5432
    volumes:
      - /home/ubuntu/pgsql/data:/var/lib/postgresql/data/
```
Kemudian dilanjut deploy ansible-playbook
```
nano setup-database.yml
---
- name: Setup Database with postgre
  hosts: database
  become: true
  tasks:
    - name: Copying docker compose file
      copy:
        src: docker-compose-database.yml
        dest: /home/ubuntu/

    - name: Run docker compose
      shell:
        cmd: "docker-compose -f docker-compose-database.yml up -d"
```
Jalankan dengan perintah `sudo ansible-playbook setup-database.yml`

## Akses database dari server lain 
mengakses database postgresql yang sudah di install dengan perintah `psql -U root -h <alamtIPdatabase> -p 5432`. Namun jika muncul error `psql not found` intall terlebih dahulu dengan perintah `sudo apt-get install postgresql-client` jika sudah akses kembali 

## Membuat Databases housy
- Akses menggunanakan perintah
  `psql -U root -h localhost --list | tail -n +4 | head -n -3 | awk '!/template[0-9]/' | awk '{print $1}' | head -n -1` untuk melihat database apasaja yang terdapat dalam psql
- Kemudian `psql -U root -d housy -h localhost -p 5432` untuk masuk kedatabase
- dan perintah `\l` digunakan untuk melihat list database

## Create table with sequelize
- Hubungkan ke server backend terlebih dahulu
- Kemudian buka shell dari container backend dengan perintah `sudo docker exec -it backend1 /bin/sh`
- Jalankan sequelize db:migrate, dan proses migrasi akan berjalan 
- Cek kembali kedalam server database menggunakan `psql -U root -d housy -h localhost -p 5432`
- dan perintah `\dt` untuk menampilkan table yg baru di migrasi

