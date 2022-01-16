## SSH 

### LOGIN SERVER
- karena memakai multipass maka ssh keynya berda didalam file `C:\Windows\System32\config\systemprofile\AppData\Roaming\multipassd\ssh-keys` 
- copy ssh-keys dan buat file `ssh.pem`
- kemudian tambahkan file ssh key kedalam `ansible.cfg`
<p align="center">
    <img src="assets\ansiblessh.jpg" />
</p>
<p align="center">
    <img src="assets\loginserver1.jpg" />
</p>

### Generate SSH untuk masuk kedalam GIT
- `git config --global user.email "rifaichamzah@gmail.com"`
- `git config --global user.name "rifaicham"`
- Buat SSH key baru dengan generate melaluui perintah `ssh-keygen` kemudian copy isi isi file `id_rsa.pub` kedalam ssh github 
<p align="center">
    <img src="assets\sshgit.jpg" />
</p>

- kemudian buat `ssh and gpg keys` baru di github setting
<p align="center">
    <img src="assets\sshkeys.jpg" />
</p>

- `ssh -T git@github.com` untuk test koneksi dengan git
<p align="center">
    <img src="assets\sshtest.jpg" />
</p>
