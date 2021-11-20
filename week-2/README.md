# Week 2
Instalasi, Konfigurasi, Service management serta Membuat Dokumentasinya

# Kebutuhan
- Buatlah dokumentasi proses instalasi linux dan bash script
- Buatlah dokumentasi git yang berisikan perintah-perintah yang digunakan untuk versioning
- Buatlah studycase proses update dari branch development kemudian ke staging dan setelah itu ke production
- Buatlah proses/tahapan dalam pembuatan CI/CD menggunakan Github Actions

# Penyelesaian
- [Dokumentasi proses instalasi linux](https://github.com/rifaicham/dumbways-report/tree/main/week-2#proses-instalasi-linux) 
- [Dokumentasi Git](https://github.com/rifaicham/dumbways-report/tree/main/week-2#dokumentasi-git) 
- 


## Proses Instalasi Linux
1. Sebelumnya disini saya menggunakan VMWare guna menginstall linucx dengan kernel ubuntu server secara virtualmachine dan menggunakan ubuntu server 18.04.6 yang bisa didownload diwebsite resmi ubuntu dalam link berikut. https://releases.ubuntu.com/18.04/ Setalah berhasil download, kemudian di install dalam VMWare dan diarahkan ke file berekstensi .iso yang tealh didownload
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/1.jpg" />
</p>
2. Kemudian tekan Next dan selanjutnya akan setting username. Disini saya menggunakan username:dumbways
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/2.jpg" />
</p>
3. Langkah selanjutnya memberi nama virtualmachine. Disini saya memberi nama belajar install ubuntu
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/3.jpg" />
</p>
4. Kemudian atur preferensi jumlah storage atau penyimpanan yang akan digunakan.
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/4.jpg" />
</p>
5. Setelah selesai tekan next, dan pilih customize. Dalam menu costumize dapat diatur jumlah ram yang akan digunakan untuk sistem yang sedang di install.
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/5.jpg" />
</p>
6. Setalah itu beralih ke Network Adapter yang awalnya NAT diubah ke Bridge, Kenapa bridge? Dikarenakan kita menggunakan virtualbox agar koneksi yang kita gunakan sama dengan OS yang dasar kita pakai.
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/6.jpg" />
</p>
7. Setelah itu next, dan klik finish maka proses instalasi akan berjalan
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/7.jpg" />
</p>
8. Setelah proses instalasi selesai akan ada opsi bahasa yang digunakan.
Pilih bahasa yang dimengerti, disini saya memilih english
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/8.jpg" />
</p>
9. Kemudian pilih done sampai ke menu set up IP. Dalam setup IP karena kita menggunakan Netwok Bridge maka akan mengikuti komputer dasar yang dijalankan. Bisa secara manual setting IP dengan edit IP4 atau menggunakan DHCP agar Ipnya otomatis.
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/9.jpg" />
</p>
10. Setelah selesai, pilih done dan proses akan berlanjut menuju profile setting
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/10.jpg" />
</p>
11. Kemudian berlanjut ke program apa saja yang ingin di install, dapat dengan mecentang program yang ingin di install. Setelah selesai pilih done
 <p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/11.jpg" />
</p>
12. Setelah itu proses instalasi akan berlanjut. Tunggu sampai proses selesai
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/12.jpg" />
</p>
13. Setelah selesai kita kan diminta memasukkan username beserta password. Dan setelah berhasil memasukkannya kita akan diarahkan ke root sistem
  <p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/13.jpg" />
</p>
14. Kemudian jalankan `sudo apt update` untuk mengupdate sistem dan `sudo apt upgrade` untuk mengupgrade sistem. Dan berlanjut sistem akan cek apakah ada update dan jika ada update kita dapat memilih menginstall update tersebut atau tidak dengan perintah(y/n) y unyuk menerima update dan n untuk membatalkannya.
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/instalasi%20linux/14.jpg" />
</p>


## Dokumentasi Git

### Instal Git dan konfigurasi
1. Menginstall Git dengan perintah *sudo apt install git* dan jika sudah terinstal untuk mengecek versi dari git yang digunakan menggunakan perintah *git --version*
2. Mengkonfigurasi Git dengan menggunakan perintah *git -config* ada beberapa yang harus di konfigurasikan
   - `git config --global user.name 'rifaicham'` yang merupakan perintah memasukkan username Git kita 
   - `git config --global user.email 'rifaichamzah@gmail.com'` yang merupakan perintah memasukkan email Git kita 
   - dan `git config --list` yang merupakan perintah untuk mengecek apakah sudah berhasil terkonfigurasi
3. Membuat SSH key untuk menghubungkan ke Git kita dengan perintah *ssh-keygen* dan memilih dimana akan menyimpan ssh tersebut. disini nama ssh-dw dan passphrase bisa dikosongkan.
4. kemudian ketik perintah `cat ~/.ssh/id_rsa.pub` untuk mendapatkan ssh
5. Copy isi tersebut dan buka github.com/setting/keys, klik New SSH Key dan paste kemudian save
6. kemudian cek apakah sudah terhubung dengan perintah `ssh -T git@github.com` dan akan memunculkan respon jika berhasil
7. Kemudian membuat repository
   - membuat folder untuk penyimpanan repository dan kemudian perintah *git init* yang akan menginisialisasi git
   - dan akan muncul file baru ber ekstensi .git yang merupakan server lokal kita sebelum masuk ke Git
### Perintah perintah Git
1. `git status`. melihat status git yang berada dikomputer.

hasil `git status`
```
champz@ubuntu:~/Documents/Dumbways$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	rifaicham/

nothing added to commit but untracked files present (use "git add" to track)
```
2. `git clone`. megunduh repository ke dalam komputer
```
git clone <url repository> <folder tujuan>
```
hasil `git clone`
```
git clone https://github.com/rifaicham/rifaicham.git rifaicham
Cloning into 'rifaicham'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), 951 bytes | 475.00 KiB/s, done
```
3. `git pull`. memperbarui repository dalam komputer
```
git pull origin <nama branch>
```
contoh `git pull`
