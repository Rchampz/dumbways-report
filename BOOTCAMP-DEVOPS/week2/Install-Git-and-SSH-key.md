# Install Git and SSH Key
## Requirments
1. Fork `https://github.com/sgnd/dumbplay-backend` to your repo
2. Create SSH key for the git
3. Git on the server can git pull, git commit, git push without username & pass

## 1. Melakukan fork aplikasi backend
Buka Github dan akses `https://github.com/sgnd/dumbplay-backend` dan lakukan fork untuk menyalinnya ke repository kita
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.1.1.jpg" />
</p>

## 2. Membuat SSH Key untuk GIT
1. Membuat server backend
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.1.2.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.1.3.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.1.4.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.1.5.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.1.6.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.1.7.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.1.8.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.1.9.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.1.10.jpg" />
</p>

2. Cek apakah sudah terinstall git dan ssh. 
    ```
    git --version
    sudo systemctl status ssh
    ```
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.2.1.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.2.2.jpg" />
</p>

3. Konfigurasi git terlebihi dahulu
    ```
     git config --global user.name "<username>"
     git config --global user.email "<email>"
    ```
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.3.jpg" />
</p>

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
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.4.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.4.1.jpg" />
</p>

5. Masuk ke Github 
    - akses Setting dan pilih `SSH and GPG keys`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.5.jpg" />
</p>
    - kemudian tambahkan ssh dengan pilih `New SSH key`
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.5.1.jpg" />
</p>
    - copy isi dari file id_rsa.pub yang sebelumnya dan tekan Add jika sudah. Maka akan muncul SSH baru yang digenerate
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.5.2.jpg" />
</p>
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/2.5.3.jpg" />
</p>


### 3. Git server can pull, commit, and push
1. Jalankan perintah 
    ```
    git clone https://github.com/rifaicham/dumbflix-backend
    ```
    untuk mengunduh aplikasi backend. 
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/3.1.jpg" />
</p>

2. Kemudian masuk kedalam direktori dumbflix-backend yang telah didownload dan jalankan perintah `git remote -v` untuk melihat remote yang telah dibuat
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/3.2.jpg" />
</p>

3. Jalankan perintah `git pull origin master` untuk memperbarui jika terdapat perubahan dalam git. Dan buat file yg semisal akan ditambahkan kedalam git `nano file1` dan jalan perintah `git add .` untuk menambahkan file1 ke git
<p align="center">
    <img src="https://github.com/rifaicham/dumbways-report/blob/main/BOOTCAMP-DEVOPS/week2/assets/3.3.jpg" />
</p>

4. Jalankan perintah `git commit -m "update"` untuk melakukan update dalam git server lokal. dan perintah  `git push origin master` untuk mengupdate perubahan ke Github




    

