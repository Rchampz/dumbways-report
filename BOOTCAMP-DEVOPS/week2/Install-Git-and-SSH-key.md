# Install Git and SSH Key
## Requirments
1. Fork `https://github.com/sgnd/dumbplay-backend` to your repo
2. Create SSH key for the git
3. Git on the server can git pull, git commit, git push without username & pass

## 1. Melakukan fork aplikasi backend
Buka Github dan akses `https://github.com/sgnd/dumbplay-backend` dan lakukan fork untuk menyalinnya ke repository kita

## 2. Membuat SSH Key untuk GIT
1. Membuat server backend
2. Cek apakah sudah terinstall git dan ssh. 
    ```
    git --version
    sudo systemctl status ssh
    ```
3. Konfigurasi git terlebihi dahulu
    ```
     git config --global user.name "<username>"
     git config --global user.email "<email>"
    ```
4. generate ssh key
    ```
    ssh-keygen
    ```
    setelah digenerate masuk kedalam folder .ssh
    ```
    cd .ssh
    ```
    kemudian akses file id_rsa.pub
    ```
    cat id_rsa.pub
    ```
5. Masuk ke Github 
    - akses Setting dan pilih `SSH and GPG keys`
    - kemudian tambahkan ssh dengan pilih `New SSH key`
    - copy isi dari file id_rsa.pub yang sebelumnya dan tekan Add jika sudah. Maka akan muncul SSH baru yang digenerate

### 3. Git server can pull, commit, and push
1. Jalankan perintah 
    ```
    git clone https://github.com/rifaicham/dumbflix-backend
    ```
    untuk mengunduh aplikasi backend. 
2. Kemudian masuk kedalam direktori dumbflix-backend yang telah didownload dan jalankan perintah `git remote -v` untuk melihat remote yang telah dibuat
3. Jalankan perintah `git pull origin master` untuk memperbarui jika terdapat perubahan dalam git. Dan buat file yg semisal akan ditambahkan kedalam git `nano file1` dan jalan perintah `git add .` untuk menambahkan file1 ke git
4. Jalankan perintah `git commit -m "update"` untuk melakukan update dalam git server lokal. dan perintah  `git push origin master` untuk mengupdate perubahan ke Github



    

