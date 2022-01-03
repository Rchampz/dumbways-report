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