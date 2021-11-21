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
	- [Install git](https://github.com/rifaicham/dumbways-report/tree/main/week-2#instal-git-dan-konfigurasi)
	- [Tahap file git](https://github.com/rifaicham/dumbways-report/tree/main/week-2#step-atau-tahapan-dalam-git)
	- [Perintah git](https://github.com/rifaicham/dumbways-report/tree/main/week-2#perintah-perintah-git)
	- 
- [Study case](https://github.com/rifaicham/dumbways-report/tree/main/week-2#study-case) 


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

---

## Dokumentasi Git

### Instal Git dan konfigurasi
1. Menginstall Git dengan perintah `sudo apt install git` dan jika sudah terinstal untuk mengecek versi dari git yang digunakan menggunakan perintah `git --version`
<p align="center">
<im/g src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/1.jpg" />
</p>

2. Mengkonfigurasi Git dengan menggunakan perintah *git -config* ada beberapa yang harus di konfigurasikan
   - `git config --global user.name 'username'` yang merupakan perintah memasukkan username Git kita 
   - `git config --global user.email 'user@email.com'` yang merupakan perintah memasukkan email Git kita 
   - dan `git config --list` yang merupakan perintah untuk mengecek apakah sudah berhasil terkonfigurasi
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/2.jpg" />
</p>

3. Membuat SSH key untuk menghubungkan ke Git kita dengan perintah *ssh-keygen* dan memilih dimana akan menyimpan ssh tersebut. disini nama ssh-dw dan passphrase bisa dikosongkan.
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/3.jpg" />
</p>

4. kemudian ketik perintah `cat ~/.ssh/id_rsa.pub` untuk mendapatkan ssh
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/4.jpg" />
</p>

5. Copy isi tersebut dan buka github.com/setting/keys, klik New SSH Key dan paste kemudian save
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/5.1.jpg" />
</p>
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/5.2.jpg" />
</p>

6. kemudian cek apakah sudah terhubung dengan perintah `ssh -T git@github.com` dan akan memunculkan respon jika berhasil
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/6.jpg" />
</p>

7. Kemudian membuat repository
   - membuat folder untuk penyimpanan repository dan kemudian perintah `git init` yang akan menginisialisasi git
	<p align="center">
	<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/7.2.jpg" />
	</p>
   - dan akan muncul file baru ber ekstensi .git yang merupakan server lokal kita sebelum masuk ke Git
	<p align="center">
	<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/7.1.jpg" />
	</p>


### *Step* atau Tahapan dalam git
Ada 3 tahap dalam file git.

<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/tahap%20git.png" />
</p>
	
1. Tahap Modified
   Tahap dimana perubahan dilakukan dalam file namun belum ditandai dan disimpan dalam git.
2. Tahap Staged
   Tahap menandai revisi yang sudah dilakukan tetapi belum disimpan dalam git. (biasanya menggunakan perintah `git add`)
3. Tahap Commited
   Tahap rivisi sudah disimpan dalam git. (menggunakan perintah `git commit`)
   
   
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

2. `.gitignore`. Mengabaikan nama file yang berada dalam list gitignore untuk di update ke repository
```
touch .gitignore
nano .gitignore
```
- Membuat gitignore dengan perintah `touch .gitignore` fungsi `.` sebelum `gitignore` adalah hiden file gitignore
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/gitignore1.jpg" />
</p>

- menambahkan list file dalam gitignore dengan `nano .gitignore` 
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/gitignore2.jpg" />
</p>

3. `git clone`. megunduh repository ke dalam komputer
```
git clone <url repository> <folder tujuan>
```
- hasil sebelum `git clone`
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/gitclone1.jpg" />
</p>

- hasil sesudah `git clone`
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/gitclone2.jpg" />
</p>

4. `git add`. Untuk menandai file yang akan direvisi atau diunggah kedalam repository.
```
git add <namafile>
git add *
fit add .
```
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/gitadd1.jpg" />
</p>
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/gitadd2.jpg" />
</p>

5. `git commit` Untuk mengunggah file ke repository git dalam komputer lokal
```
git commit -m <pesan>
```
`-m` digunakan untuk menambahkan pesan kedalam file yang diunggah ke repositori tanpa mengganggu isi dari file sekaligus sebagai identifikasi apa saja revisi yang telah dilakukan
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/gitcommit.jpg" />
</p>

6. `git branch` digunakan untuk membuat versi dari sebuah repository
```
git branch -a
git branch -M main
git branch <namabranchbaru>
```
`git branch`+`-a` untuk melihat branch yang aktif
`git branch`+`-M`+`main` untuk mengubah nama branch utama menjadi main karena untuk github branch utama diset otomatis bernama main
`git branch`+`<namabranchbaru>` untuk membuat branch baru

<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/gitbranch.jpg" />
</p>

7. `git remote` 
```
git remote add <namagit><alamat repository>
git remote add origin git@github.com:rifaicham/dumbways-git.git
```
`git remote`+`add`+`<alamat repository>` Digunakan untuk menambah repository online yang akan dibuat untuk mengupload git dari komputer ke git online

8. `git push` Digunakan untuk mengunggah repository dari komputer ke repository online
 ```
 git push -u origin main
 ```
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/gitpush.jpg" />
</p>
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/Perintah%20git/gitpush1.jpg" />
</p>

9. `git pull` memperbarui repository yang telah diunduh ke dalam komputer menggunakan perintah git pull.
```
git pull origin <nama branch>
```

10. `git checkout` digunakan untuk pindah dari branch satu ke yang lain 


---
## Study Case
Dalam sebuah project untuk membangun website dibutuhkan sebuah tools yang digunakan untuk pembayaran dalam web tersebut. Langkah-langkah dari proses *development-staging-production* adalah sebagai berikut.
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/branch.png" />
</p>

1. Development
Tahap pembuatan tools oleh programmer menggunakan baha pemrograman yang sesuai dan dites oleh programmer apakah sesuai dengan krbutuhan dari tools
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/development.jpg" />
</p>

2. Staging
Tahap untuk testing fungsi tools oleh QA (Quality assurance), testing bisa otomatis dan manual tergantung kebutuhan dan kondisional tools. Setelah lulus uji oleh QA tools baru dapat dilanjutkan ke tahap production
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/staging.jpg" />
</p>

3. Production
Tahap tools yang siap digunakan dan sudah masuk ke website kemudian oleh konsumen digunakan untuk melakukan pembayaran. Dan jika semisal dalam penambahan tools pembayaran terjadi error maka bisa dikembalikan kedalam versi sebelumnya. 
<p align="center">
<img src="https://github.com/rifaicham/dumbways-report/blob/main/week-2/assets/production.jpg" />
</p>

---

## CI/CD Github Action

