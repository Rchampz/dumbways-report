# Week 2
Instalasi, Konfigurasi, Service management serta Membuat Dokumentasinya

# Kebutuhan
- Buatlah dokumentasi proses instalasi linux dan bash script
- Buatlah dokumentasi git yang berisikan perintah-perintah yang digunakan untuk versioning
- Buatlah studycase proses update dari branch development kemudian ke staging dan setelah itu ke production
- Buatlah proses/tahapan dalam pembuatan CI/CD menggunakan Github Actions

# Penyelesaian
- [Dokumentasi proses instalasi linux](https://github.com/rifaicham/dumbways-report/tree/main/week-2#proses-instalasi-linux) 
- [Setup database & Deploy aplikasi backend](setup-database-dan-deploy-aplikasi-backend.md)
- 


## Proses Instalasi Linux
1. Sebelumnya disini saya menggunakan VMWare guna menginstall linucx dengan kernel ubuntu server secara virtualmachine dan menggunakan ubuntu server 18.04.6 yang bisa didownload diwebsite resmi ubuntu dalam link berikut. https://releases.ubuntu.com/18.04/ Setalah berhasil download, kemudian di install dalam VMWare dan diarahkan ke file berekstensi .iso yang tealh didownload
![step1](https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/1.jpg)

2. Kemudian tekan Next dan selanjutnya akan setting username. Disini saya menggunakan username:dumbways
![step2](https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/2.jpg)

3. Langkah selanjutnya memberi nama virtualmachine. Disini saya memberi nama belajar install ubuntu
![step3](https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/3.jpg)

4. Kemudian atur preferensi jumlah storage atau penyimpanan yang akan digunakan.
![step4](https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/4.jpg)

5. Setelah selesai tekan next, dan pilih customize. Dalam menu costumize dapat diatur jumlah ram yang akan digunakan untuk sistem yang sedang di install.
![step5](https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/5.jpg)

6. Setalah itu beralih ke Network Adapter yang awalnya NAT diubah ke Bridge, Kenapa bridge? Dikarenakan kita menggunakan virtualbox agar koneksi yang kita gunakan sama dengan OS yang dasar kita pakai.
![step6](https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/6.jpg)
7. Setelah itu next, dan klik finish maka proses instalasi akan berjalan
![step7](https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/7.jpg)
8. Setelah proses instalasi selesai akan ada opsi bahasa yang digunakan.
Pilih bahasa yang dimengerti, disini saya memilih english
![step8](https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/8.jpg)
9. Kemudian pilih done sampai kemenu set up IP. Dalam setup IP karena kita menggunakan Netwok Bridge maka akan mengikuti komputer dasar yang dijalankan. Bisa secara manual setting IP dengan edit IP4 atau menggunakan DHCP agar Ipnya otomatis.
![step9](https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/9.jpg)
10. Setelah selesai, pilih done dan proses akan berlanjut menuju profile setting
![step10](https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/10.jpg)
11. Kemudian berlanjut ke program apa saja yang ingin di install, dapat dengan mecentang program yang ingin di install. Setelah selesai pilih done
![step11](https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/11.jpg)
12. Setelah itu proses instalasi akan berlanjut. Tunggu sampai proses selesai
![step12](https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/12.jpg)
13. Setelah selesai kita kan diminta memasukkan username beserta password. Dan setelah berhasil memasukkannya kita akan diarahkan ke root sistem
![step13](https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/13.jpg)
14. Kemudian jalankan sudo apt update untuk mengupdate sistem dan sudo apt upgrade untuk mengupgrade sistem. Dan berlanjut sistem akan cek apakah ada update dan jika ada update kita dapat memilih menginstall update tersebut atau tidak dengan perintah(y/n) y unyuk menerima update dan n untuk membatalkannya.
![step14](https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/14.jpg)
