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
### 1. Membuat file docker-compose untuk instalasi postgress
```
nano docker-compose-database.yml
---
version: '3'
services:
  mysql:
    image: mysql:5.7
    container_name: mysql-database
    environment:
      - MYSQL_ROOT_PASSWORD=root
      - MYSQL_DATABASE=housy
      - MYSQL_ROOT_HOST=%
    ports:
      - 3306:3306
    volumes:
      - /home/ubuntu/mysql/data:/var/lib/mysql

  postgresql:
    image: postgres:latest
    container_name: pgsql-database
    environment:
      POSTGRES_USER: root
      POSTGRES_PASSWORD: root
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

- Cek didalam server host
    - `sudo docker ps` untuk melihat apakah container database berjalan
    - `sudo docker exec -t mysql-database bash` kemudian akses mysql dengan `mysql -u root -p`. jika sudah masuk jalankan perintah `show databases` maka akan muncul database housy yg sudah dicreate dalam docker-compose.
    - kemudian cek apakah sudah ada volume yg dibuat


