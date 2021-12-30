# Setup Database

## Requirments
1. Create new instance for database
2. install database on server
3. can remote database from the client
4. setup security group with private IP

### 1. Create new instance for database
Membuat server untuk backend dan database dengan spesifikasi
- Ubuntu Server 20.04 LTS
- t2.micro
- Auto-assign Public IP Disable
- Storage 8Gb
- Security group All trafic
- Private IP
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/serverbe1.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/serverbe1.2.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/serverbe1.3.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/serverbe1.4.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/serverbe1.5.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/serverbe1.6.jpg" />
</p>

### 2. Install database 
1. Masuk ke server database yang telah dibuat
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/installdatabase1.jpg" />
</p>

2. Jalankan perintah `sudo apt update` dan `sudo apt upgrade`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/installdatabase2.jpg" />
</p>

3. Melakukan instalasi mysql dengan perintah `sudo apt install mysql-server` atau `sudo apt install mysql*`4.
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/installdatabase3.jpg" />
</p>

4. Kemudian Jalankan perintah `sudo mysql_secure_installation` untuk melakukan konfigurasi keamanan database.
    - akan muncul `Press y|Y for Yes, any other key for No:` ketik `no` untuk menambahkan password
    - `Remove anonymous users?` pilih `yes`
    - `Disallow root login remotely?` yang digunakan untuk akses di server client pilih `yes`
    -`Remove test database and access to it? ` pilih `yes`
    - `Reload privilege tables now? pilih` pilih `yes`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/installdatabase4.1.jpg" />
</p>

5. akses mysql dengan masuk ke root menggunakan perintah `sudo mysql -u root -p` dan masukkan password yg telah dibuat untuk mysql
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/installdatabase5.jpg" />
</p>

### 3. Remote database from the client
Konfigurasi mysql
1. buat user dengan menggunakan perintah `CREATE USER '<namauser>'@'%' IDENTIFIED BY '<password>';`
2. membuat database dumbflix dengan perintah `create database dumbflix;`
3. Kemudian beri akses user yang telah dibuat untuk mengakses database dumbflix `GRANT ALL PRIVILEGES ON dumbflix.* TO '<username>'@'%';`
4. jalankan perintah `FLUSH PRIVILEGES;` untuk melakukan restart. kemduian perintah `exit;`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/installdatabase6.jpg" />
</p>

5. akses mysql dengan user yang telah dibuat menggunakan `sudo mysql -u <username> -p` dan masukan password
6. Untuk mengakses mysql tanpa sudo dengan
    - Jalankan perintah `DROP USER 'root'@'localhost';`
    - Kemudian `CREATE USER 'root'@'loaclhost' IDENTIFIED BY '<password>';`
    - `GRANT ALL PREVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;`
    - `FLUSH PRIVILEGES;`
    - Setelah semua dijalankan sekarang `exit;` dari cli mysql dan coba akses mysql tanpa sudo dengan perintah `mysql -u root -p` 
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/remotedata6.jpg" />
</p>

7. Jalankan perintah `show databases;` untuk melihat database yang telah dibuat
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/remotedata7.jpg" />
</p>

### 4. Setup security grup with private IP
1. Melakukan konfigurasi file `mysql.cnf` pada direktori `/etc/mysql/mysql.conf.d/mysqld.cnf`
    ```
    sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
    ```
2. Mengubah bind address dan mysql-bind-address dengan IP Private dari server kita (172.0.0.0)

