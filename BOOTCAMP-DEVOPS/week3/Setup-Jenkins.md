## Create jenkins job
1. Hubungkan jenkins dengan github
- Buka dan login jenkins kemudian generate ssh-key `ssh-keygen -t rsa -b 4096 -C "<alamatip/domain jenkins>"`
<p align="center">
    <img src="assets\createjob1.1.jpg" />
</p>

- kemudian akses sshkey dengan perintah `cat .ssh/id_rsa.pub`
<p align="center">
    <img src="assets\createjob1.2.jpg" />
</p>

- masukkan akun public key ke akun github. dengan login github, buka setting dan pilih `SSH and GPG keys`
<p align="center">
    <img src="assets\createjob1.3.jpg" />
</p>

- masukkan kedalam jenkins
  - pilih Manage Jenkins > Manage Plugins kemudian serach `publish over ssh` dan ppilih option install witout restart
<p align="center">
    <img src="assets\publishoverssh.jpg" />
</p>

  - kembali ke dashborad dan pilih Manage Jenkins > Configure System
  - cari public over SSH, biasanya terletak paling bawah karena baru saja kita install
  - masukkan kembali key yang sebelumnya diGit kedalam
  - pilih ssh server dan masuukan nama, host(IP/alamat dari aplikasi kita yg akan dicreate jobnya, terus username)
  - pilih save

- Kembali ke dashboard Jenkins dan pilih new item di kiri atas atau ppilih create a job
- kemudian masukkan nama job secara spesifik dan pilih freestyle-project 
- akan muncul banyak pilihan setting, cari source code management, pilih git dan masukkan url/ssh dari repository aplikasi yang akan dibuat jobnya 
- Kemudian pada kolom build trigger pilih `GitHub hook trigger for GITScm polling` dan sekarang buka repository melalui webbrowser, pilih setting dan webhook. Masukkan alamat dari jenkins kita dan centang active dan klik add webhook
- Pilih option build   `execute over SSH` kemudian isikan souce dan perintah untuk menjalankan aplikasi via server dan kemudian save.
- lakukan perubahan pada repository melalui server, dan lakukan push kedalam github. setelah itu cek kembali kedalam jenkins dan tunggu sampai proses build diJenkins selesai.

2. Menghubungkan dengan docker 
