# Membuat Dokumentasi Manage Server

## Requirements

- Buatlah dokumentasi proses tiap perintah yang dipelajari di materi manage server with terminal.
- Tambahkan perintah perintah yang dapat membantumu untuk me-manage/me-monitoring sebuah server yang tidak dipelajari di materi manage server with terminal.
- Buatlah dokumentasi terpisah mengenai cmsmanajer.com dari awal hingga selesai.

## Penyelesaian
- Dokumentasi manage server with terminal
- Perintah tambahan
- cmsmanajer.com

### Dokumentasi manage server with terminal
1. Perintah `nano`
  - `sudo apt install nano` digunakan untuk instalasi teks editor nano jika belum terinstal.
  - `nano --version` digunakan untuk memeriksa versi nano yang terinstall
  - `nano <namafile>` digunakan untuk membuka file dengan teks editor nano
  - `nano <direktori>/<namafile>` digunakan untuk membuka file dengan teks editor nano yang berada di direktori lain
  - perintah perintah untuk menyimpan file, keluar dari teks editor dan lain sebagainya dapat dilihat dibawah teks editor nano. 
      - seperti `^X` yang merupakan `ctrl`+`X` untuk keluar dari teks editor, 
      - `^O` untuk menyimpan hasil edit tanpa keluar dari nano, 
      - `^W` yang diguanakan untuk mencari teks, 
      - tombol `alt`+`A` yang digunakan untuk memilih teks, dan untuk mencopynya dengan `ctrl`+`6` dan untuk paste `ctrl`+`U`, untuk cut `ctrl`+`K`
      - `ctrl`+`A` digunakan untuk mengarahkan cursor keawal baris dan `ctrl`+`E` untuk mengarahkan ke akhir baris
2. Text manipulation
  - Perintah `cat` digunakan untuk membuat daftar content atau isi file
    - `cat file.txt` digunakan untuk melihat isi file
    - `cat > file` digunakan untuk membuiat file yg bernama file
    - `cat file.txt file > filegabungan` untuk menjadikan content file.txt dan file menjadi satu dalam file gabungan
  - Perintah `sed` yang merupakn singkatan dari stream editor yang digunakan untuk subtitusi satu kata tertentu dalam content suatu file menjadi kata yang diinginkan misalnya `sed -i 's/ini/itu/g' filegabungan` yang digunakan untuk mengubah kata ini menjadi kata itu dalam filegabungan 
  - Perintah `grep` yang digunakan untuk melakukan pencarian kata dalam content suatu file
    - `grep itu filegabungan` digunakan untuk mencari kata itu dalam file gabungan
    - `grep -c itu filegabungan` digunakan untuk menghitung kata itu dalam filegabungan
    - `grep ini *` digunakan untuk mencari kata ini dalam semua file di direktori
  - Perintah `sort` digunakan untuk sortir data berdasarkan ascending atau descending dalam urutan abjad maupun huruf
    - `sort fielgabungan` digunakan untuk sortir ascending
    - `sort -r filegabungan` digunakan untuk sortir descending
  - Perintah `echo` yang digunakan untuk mencetak string
    - `echo "HELLO GUYS!"` yang digunakan untuk mencetak string HELLO GUYS!
    - `echo "ini isi dari fileecho" >> fileecho` yang digunakan untuk menulis string dan disimpan dalam file fileecho
    - `echo "fileecho tealh direplace" > fileecho` digunakan untuk me-replace content dari fileecho
3. Monitoring
  - 
