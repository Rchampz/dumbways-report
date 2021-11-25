# Membuat Dokumentasi Manage Server

## Requirements

- Buatlah dokumentasi proses tiap perintah yang dipelajari di materi manage server with terminal.
- Tambahkan perintah perintah yang dapat membantumu untuk me-manage/me-monitoring sebuah server yang tidak dipelajari di materi manage server with terminal.
- Buatlah dokumentasi terpisah mengenai cmsmanajer.com dari awal hingga selesai.

## Penyelesaian
- [Dokumentasi manage server with terminal](https://github.com/rifaicham/dumbways-report/tree/main/week-3#dokumentasi-manage-server-with-terminal) 
- [Perintah tambahan](https://github.com/rifaicham/dumbways-report/tree/main/week-3#perintah-tambahan) 
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
    Aktifitas untuk melihat kinerja sistem secara realtime
  - Perintah `htop` yang digunakan untuk memonitoring sistem dan dapat melihat penggunaan memory, cpu, dan ram
    ```
    sudo apt install htop 
    htop
    ```
    `sudo apt install htop` digunakan untuk menginstal htop jika belum terinstal dan perintah `htop` digunakan untuk menjalan htop
  - Perintah `nmon` yang digunakan untuk monitoring
    ```
    sudo apt install nmon
    nmon
    ```
    `sudo apt install nmon` digunaakan untuk install nmon dan perintah `nmon` digunakan untuk menjalannya. Ketika menjalankan nmon akan muncul tampilan untuk bisa memilih apa yang akan dimonitoring
  - Perintah `lsof` yang digunakan untuk melihat seluruh file yang terbuka berdasarkan proses aktif yang berjalan disistem
    - `lsof -u username` digunakan untuk melihat proses yang aktif yang dilakukan oleh username
    -  `lsof -i port` difunakan untuk melihat proses yang aktif pada port yang dituju
  - Perintah `ps` yang merupakan singkatan process status untuk mengetahui daftar proses yang berjalan pada sistem
    - `ps -f -u username` untuk menampilkan proses pada user
    - `ps -aux` digunakan untuk melihat semua proses secara lengkap
4. Network Firewall
    Merupakan perintah yang dapat digunakan untuk mengamankan server
   - Perintah `iptables`
      Merupakan sebuiah module di linux yang memebrikan dukungan langsung terhadap kernel untuk keamanan sistem serta beberapa keperluan jaringan
   - Perintah `ufw` (uncomplicated firewall) salahsatu fitur frontend iptables pada linux untuk konfigurasi jaringan
    - `sudo apt install ufw` digunakan untuk installasi ufw jika belum ada
    - `sudo ufw default deny incoming` digunakan untuk memblokir semua akses yang masuk
    - `sudo ufw default allow outgoing` digunakan untuk membuka akses keluar
    - `sudo ufw app list` untuk melihat daftar aplikasi yang didukukung oleh ufw
### Perintah Tambahan
1. Perintah `history` yang digunakan untuk mengecek riwayat daftar proses apa saja yang dilakukan.
2. Menggabungkan dua perintah dengan tanda `|` yang digunakan untuk men-spesifikkan perintah yang akan dijalankan
    Misalnya menggabungkan perintah `history`+`grep` maka akan menjadi `history | grep kata yang mau dicari`. contohnya 
    ```
    history | grep git
    ```
    maka akan memunculkan riwayat perintah yang menggunakan `git`
3. Perintah `ping` yang digunakan untuk ping atau mengecek apakah terhubung ke dalam suatu alamat atau mengecek apakah alamat tersebut online
4. Perintah untuk terminate proses yang sedang dilakukan dalam bash dengan `ctrl`+`C` maka dalam bash akan tercetak seperti `^C` 
5. Perintah `pwd` yang merupakan akronim dari print working directory, yang berguna untuk mencetak dalam string direktori  apa yang sedang kita gunakan
6. Perintah `rm` akronim dari remove yang digunakan untuk mengahpus file. Jika direktori yang mau dihapus maka perintahnya menjadi `rmdir`
