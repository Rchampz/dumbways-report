# VMWARE - INSTALL UBUNTU SERVER
## Step by step Instalasi Ubuntu server pada VMWare

1. Instal aplikasi VMWare, kemudian buka VMWare dan `Create a New Virtual Machine`
2. Maka akan muncul tab baru dan arahkan ke file linux server 20.04 yang berekstensi .iso yang telah didownload
3. Kemudian akan diarahkan untuk mengisi nama, username dan password
4. Selanjutnya beri nama Virtual machine
5. Alokasikan berapa memori yang akan digunakan untuk virtual machine
6. Dan perhatikan informasi yang tertampil. Jika kebutuhan virtual machine berjalan dengan RAM dan konfigurasi networking sesuai dengan keiginan, dapat diubah dalam menu `customize`
7. Disini akan di-set dengan kriteria
    - RAM 2Gb
    - Networking Bridge 
8. Proses Instalasi akan berjalan, dan akan diarahkan ke menu pilihan bahasa
9. kemudian akan ada notifikasi update, untuk sekarang pilih update nanti. 
dan akan menuju ke pilihan layout keyboard yang akan digunakan.
10. - Tahap network connection akan menunjukkan IP yang akan kita gunakan. 
    - Jika ingin mengeset agar IP static bisa dalam menu IPv4 Method.
    - proxy addrees bisa dilewati.
    - mirror addrees juga dibiarkan default.
    - Storage configuration, pilih use an entire disk yang akan menggunakan seluruh alokasi Swap memori yang telah diset sebelumnya.
    - AKan ada summary dari storage yang digunakan, pilih done
    - dan akan memunculkan notifikasi untuk melanjutkan proses instalasi. pilih continue
    - dilanjutkan dengan mengisi nama, username dan password.
    - SSH setup bisa dilewati.
    - Pilih aplikasi yang akan diinstal bersamaan dengan server dibuat. jika tidak ada pilih done
    - Proses instalasi akan berjalan
    - Ketika sudah selesai akan munjul perintah reboot now
11. Ketika selesai proses reboot masukkan username dan password. Dan sekarang server sudah selesai dibuat
12. Untuk mengecek server konek dengan internet bisa menggunakan perintah `ping`


