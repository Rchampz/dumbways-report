## Create jenkins job
1. Hubungkan jenkins dengan github
- Buka dan login jenkins kemudian generate ssh-key `ssh-keygen -t rsa -b 4096 -C "<alamatip/domain jenkins>"`
- kemudian akses sshkey dengan perintah `cat .ssh/id_rsa.pub`
- masukkan akun public key ke akun github. dengan login github, buka setting dan pilih `SSH and GPG keys`
- masukkan kedalam jenkins
  - pilih Manage Jenkins > Manage Plugins kemudian serach `publish over ssh` dan ppilih option install witout restart
  - kembali ke dashborad dan pilih Manage Jenkins > Manage Creditential
  - pilih jenkins, selanjutnya pilih global creditential
  - dan tambahkan creditential dengan  `add creditential` 
  - 