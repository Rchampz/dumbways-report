# Deployment Backend App

## Requirments
1. clone repository `https://github.com/sgnd/dumbflix-backend.git`
2. change directory backend and deploy the application
3. Import Database with sequelize

### 1. Clone repository
1. Akses server backend
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/clonerepo1.jpg" />
</p>

2. Clone repository
    ```
    git clone https://github.com/sgnd/dumbflix-backend.git
    ```
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/clonerepo2.jpg" />
</p>

### 2. Change directory backend and deploy the application
1. Install Aplikasi nodeJS
    ```
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

    exec bash

    nvm install 10
    ```
2. Menuju direktori dumbflix-backend dan jalankan perintah `npm install`
3. jalankan perintah untuk copy .example ke .env dengan `cp .env.example .env` *baca README*
4. Konfigurasi file `config.json` pada directory config dengan mengubah username, password dan nama database sesuai pada server database
    ```
    cd config
    sudo nano config.json
    ```
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/dirback4.jpg" />
</p>

5. - Install pm2 untuk deploy backend
    ```
    npm install pm2 -g

    pm2 init simple

    nano ecosystem.config.js
    ```
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/deploy2.jpg" />
</p>
    - Deploy aplikasi backend dengan perintah
        ```
        pm2 start
        ```

### 3. Sequelize

1. Instalasi sequelize-cli dengan perintah
```
npm install --save-dev -g sequelize-cli
```
2. Jalankan perintah `sequelize db:migrate` guna melakukan migrate ke database yang telah dibuat
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/seq1.jpg" />
</p>

3. Kembali ke database
    - Masuk ke server database dan akses mysql dengan perintah `mysql -u <username> -p`. 
    - Jalankan perintah `show databases;` untuk menampilkan database yang telah dibuat
    - kemudian perintah `use dumbflix` untuk menampilkan data yg telah di migrate dari server backend dan `show tables;`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/seq3.jpg" />
</p>
