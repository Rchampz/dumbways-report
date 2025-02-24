# Aws Create and Setup Network

### Step by step Membuat AWS Visrtual machine dan konfigurasinya


1. Membuka website `console.aws.amazon.com/console`. Dan kemudian pilih `lunch a virtual machine`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreate1.jpg" />
</p>

2. Akan diarahkan menuju `Step 1: Choose an Amazon Machine Image (AMI)` dan search for ubuntu dikolom search, select Ubuntu server 20.04 LTS
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreate2.jpg" />
</p>

3. `Step 2: Choose an Instance Type` Pilih instance sesuai kebutuhan, disini menggunakan t2.micro kemudian Next
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreate3.jpg" />
</p>

4. Kemudian akan diarahkan menuju `Step 3: Configure Instance Details` Disini adalah konfigurasi berapa server yang akan di-create dan untuk aws education batasannya adalah 6. Setelah itu pada kolom `Auto-assign Public IP` pilih disable. Jika di-set ke enable maka IP akan terkonfigurasi DHCP dan akan berubah setiap dimatikan, maka dari itu pilih option disable untuk membuatnya statik agar lebih mudah diakses. Jika sudah Klik Next
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreate4.jpg" />
</p>

5. Menuju step `Step 4: Add Storage` yang mana konfigurasi memori yang akan digunakan dalam virtual machine, set sesuai kebutuhan
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreate5.jpg" />
</p>

6. pada tahap `Step 5: Add Tags` bisa dikosongkan. dan klik Next
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreate6.jpg" />
</p>

7. `Step 6: Configure Security Group` ada pilihan `Add rules` tambahkan rules HTTP dan HTTPS. kemudian klik `Review and Launch`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreate7.jpg" />
</p>

8. Akan muncul balon notifikasi key pair yang fungsinya untuk menyimpan key berguna untuk akses server kedepannya. Pilih RSA dan download key pair kemudian pilih `launch instance`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreate8.jpg" />
</p>

9. Pada sidebar pilih Elastic IPs dalam kolom `Network & Security` kemudian pada pojok kanan atas pilih `alocate elastic IP addres`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreate9.jpg" />
</p>

10. Jika sudah ke menu action kanan atas dan pilih `Associate Elastic IP Addrees`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreate10.jpg" />
</p>

11. akan diarah ke page baru `Associate Elastic IP address` pilih instance yang sudah dibuat sebelumnya dan pilih `Associate`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreate11.jpg" />
</p>

12. Kembali ke instance dan coba refresh, jika berhasil maka instance yang dibuat akan running. Buka direktori dimana key pair yang sebelumnya didownload melalui terminal dan jalankan perintah 
```
chmod 400 bootcamp.pem 
##Untuk mengubah permission dari keypair

ssh -i <namakeypair>.pem ubuntu@<ip-public> 
##untuk akses server melalui SSH dan keypair beserta IP yang sudah diset sebelumnya
```
dan akan muncul perintah seperti dibawah, dan ketik `yes`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreate12.1.jpg" />
</p>

13. Dan dalam terminal akan masuk kedalam server, kemudian jalankan perintah untuk update dan upgrade
```
sudo apt upgrade
sudo apt update
```
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/awscreate13.jpg" />
</p>

### Login server with password
1. `sudo adduser <namauser>`
2. `sudo usermod -aG sudo <namauser>`
3. `sudo nano /etc/ssh/sshd_config` dan uncomment `PubkeyAuthentication` kemudian ubah `PasswordAuthentication` dari `no` menjadi `yes`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/sshd1.jpg" />
</p>

<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/sshd2.jpg" />
</p>

<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week1/assets/sshd3.jpg" />
</p>
