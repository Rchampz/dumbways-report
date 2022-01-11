## SSH 

### LOGIN SERVER
- karena memakai multipass maka ssh keynya berda didalam file `C:\Windows\System32\config\systemprofile\AppData\Roaming\multipassd\ssh-keys` 
- copy ssh-keys dan buat file `ssh.pem `
- kemudian tambahkan file ssh key kedalam `ansible.cfg`

### Generate SSH untuk masuk kedalam GIT
- `git config --global user.email "rifaichamzah@gmail.com"`
- `config --global user.name "rifaicham"`
- Buat SSH key baru dengan generate melaluui perintah `ssh-keygen` kemudian copy isi isi file `id_rsa.pub` kedalam ssh github 
- `git remote add origin git@github.com:rifaicham/housy-frontend.git` jalankan perintah didalam folder aplikasi
- kemudian push dengan perintah `git push -u origin main`
- dapat dilihat dari web browser apakah sudah terupload