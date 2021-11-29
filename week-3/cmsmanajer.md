# CMSmanajer
(Cadabra Multiple Server Manajer) merupakan platform yang dibuat untuk memudahkan pengguna yang tidak memiliki pengetahuan server. CMS Manajer berguna untuk memanajemen server-server dalam suatu tampilan atau dashboard dan memudahkan untuk menginstal aplikasi yang dibutuhkansert dapat menginstal CMS (Content Management System) seperti WordPress. Selain itu CMS Manajer juga mengoptimalkan konfigurasi kernel, security dan performance pada server.

## Registrasi
Registrasi secara langsung di website cmsmanajer.com 
Disini saya mencoba registrasi tetapi gagal dikarenakan alamt registrasi tidak dapat diketahui.
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/gagalregist.jpg" />
</p>
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/registgagal.jpg" />
</p>

Langkah selanjutnya dikarenakan gagal maka akan dilanjut dengan pengetahuan dari webiste berikut https://suganda.medium.com/jagoan-cms-manajer-7ce185d08b55

## Connect to server
Agar dapat menginstall aplikasi yang dibutuhkan, perlu mengkoneksikan server dengan CMS manajer untuk melakukannya dengan cara
1. Pada halaman dashboard, untuk pertama kali klik Connect Server
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/cms1.png" />
</p>

2. Kemudian akan dialihkan ke halaman detail informasi yang harus Kita masukkan ke dalam form. Seperti IP, Username dan Password.
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/cms2.png" />
</p>

3. Pada bagian I’d prefer to use adalah default web server yang akan Kita gunakan untuk aplikasinya (Apache / Nginx), tetapi Kita dapat memilihnya nanti dengan menekan Choose Later.
Klik Connect untuk melanjutkan proses koneksi dengan CMS Manajer. Tunggu beberapa saat hingga semua proses tersebut selesai.
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/cms3.png" />
</p>

4. Jika sudah berhasil, maka akan terlihat seperti di bawah ini.
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/cms4.png" />
</p>

## Install aplikasi
CMS Manajer menyediakan fitur marketplace dan app management, yang dapat kita manfaatkan untuk install aplikasi yang Kita perlukan.
1. Klik salah satu server pada menu dashboard di cmsmanajer
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/apps1.png" />
</p>

2. Kemudian buka menu -*create app*- untuk memilih aplikasi pada markerplace untuk di install
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/apps2.png" />
</p>

3. Terdapat beberapa pilihan aplikasi yang dapat di install. Pilih salah satu sesuai kebutuhan. 
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/apps3.png" />
</p>

4. dan jika berhasil maka aplikasi akan muncul pada menu -*Apps*-
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/apps4.png" />
</p>


## Konfigurasi SSL
SSL (Secure Socket Layer) merupakan salah satu komponen penting yang harus dimiliki website. Dengan SSL, transfer data di dalam website menjadi lebih aman dan terenkripsi. Dalam kasus ini adalah bagaimana mengamankan aplikasi yang sudah diinstall pada CMS
1. Buat akun di cloudflare.com dan arahkan pada menu *dashboard*, kemdian pilih *add a site* dan ikuti langkah-langkahnya
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/ssl1.png" />
</p>

2. Kemudian kita klik domain yang kita miliki, masuk ke menu DNS. Pada dns management, tambahkan A record sesuai domain yang di buat pada CMS Manajer.
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/ssl2.png" />
</p>
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/ssl2.1.png" />
</p>

3. Pastikan domain sesuai dengan yang telah disetting pada CMSmanajer
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/ssl3.png" />
</p>

4. dan hasilnya jika berhasil akan seperti berikut
<p align="center">
  <img src="https://github.com/rifaicham/dumbways-report/blob/main/week-3/assets/ssl4.png" />
</p>
