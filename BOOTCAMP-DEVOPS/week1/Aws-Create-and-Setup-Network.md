# Aws Create and Setup Network

## Step by step Membuat AWS Visrtual machine dan konfigurasinya

### Reverse proxy server

1. Membuka website `console.aws.amazon.com/console`. Dan kemudian pilih `lunch a virtual machine`
2. Akan diarahkan menuju `Step 1: Choose an Amazon Machine Image (AMI)` dan search for ubuntu dikolom search, select Ubuntu server 20.04 LTS
3. `Step 2: Choose an Instance Type` Pilih instance sesuai kebutuhan, disini menggunakan t2.micro kemudian Next
4. Kemudian akan diarahkan menuju `Step 3: Configure Instance Details` Disini adalah konfigurasi berapa server yang akan di-create dan untuk aws education batasannya adalah 6. Setelah itu pada kolom `Auto-assign Public IP` pilih disable. Jika di-set ke enable maka IP akan terkonfigurasi DHCP dan akan berubah setiap dimatikan, maka dari itu pilih option disable untuk membuatnya statik agar lebih mudah diakses. Jika sudah Klik Next
5. Menuju step `Step 4: Add Storage` yang mana konfigurasi memori yang akan digunakan dalam virtual machine, set sesuai kebutuhan
6. pada tahap `Step 5: Add Tags` bisa dikosongkan. dan klik Next
7. `Step 6: Configure Security Group` ada pilihan `Add rules` tambahkan rules HTTP dan HTTPS. kemudian klik `Review and Launch`
8. Akan muncul balon notifikasi key pair yang fungsinya untuk menyimpan key berguna untuk akses server kedepannya. Pilih RSA dan download key pair kemudian pilih `launch instance`
9. Pada sidebar pilih Elastic IPs dalam kolom `Network & Security` kemudian pada pojok kanan atas pilih `alocate elastic IP addres`
10. Jika sudah ke menu action kanan atas dan pilih `Associate Elastic IP Addrees`
11. akan diarah ke page baru `Associate Elastic IP address` pilih instance yang sudah dibuat sebelumnya dan pilih `Associate`
12. Kembali ke instance dan coba refresh, jika berhasil maka instance yang dibuat akan running. Buka direktori dimana key pair yang sebelumnya didownload melalui terminal dan jalankan perintah 
```
chmod 400 bootcamp.pem 
##Untuk mengubah permission dari keypair

ssh -i <namakeypair>.pem ubuntu@<ip-public> 
##untuk akses server melalui SSH dan keypair beserta IP yang sudah diset sebelumnya
```
dan akan muncul perintah seperti dibawah, dan ketik `yes`

13. Dan dalam terminal akan masuk kedalam server, kemudian jalankan perintah untuk update dan upgrade
```
sudo apt upgrade
sudo apt update
```
14. Untuk menggunakan reverse proxy disini menggunakan Nginx. Instal terlebih dahulu Nginx
```
sudo apt install nginx
```
Kemudian cek apakah sudah berhasil dengan mengakses ke `IPaddreesserver:80` yang mana akan mengakses port 80 pada server yang telah dibuat

### Application server
Langkah langkahnya sama dengan membuat server untuk reverse proxy. Disini akan menggunakan aplikasi dumbflix (https://github.com/sgnd/dumbflix-frontend)

1. Pada `Step 6: Configure Security Group` pilih rules `all trafic` yang digunakan untuk membuka semua port

2. Jika sudah selesai, setting elastic IPs untuk sementara guna mendownload aplikasi dumbflix dan menginstall kebutuhan untuk menjalankan aplikasi dumbflix tersebut yaitu nodejs
```
git clone https://github.com/sgnd/dumbflix-frontend
```
3. Kemudian install nodeJs dapat dilihat [disini](https://github.com/rifaicham/dumbways-report/blob/main/week-4/README.md#node-js). DIsini mengggunakan Nodejs versi 10 sesuai petunjuk dari aplikasi dumbflix, dan jika sudah terinstall jalankan perintah
```
nvm -v
npm -v
```

