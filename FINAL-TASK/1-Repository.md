# Repository 

## Requirements
- Create your own repository for housy frontend & housy backend
- Create your repository for the answer final task

## Instructions
- Clone Housy frontend ("https://github.com/sgnd/housy-frontend")
- Clone Housy backend ("https://github.com/sgnd/housy-backend")
- Change git remote to your own repository
- Create branch development & production
- Push the code to your repository

## Answer
### 1. clone aplikasi housy-frontend dengan perintah `git clone https://github.com/sgnd/housy-frontend` untuk backend
`git clone https://github.com/sgnd/housy-backend`

### 2. Kemudian hubungkan server dengan git dan lakukan push
- `git config --global user.email "rifaichamzah@gmail.com"`
- `config --global user.name "rifaicham"`
- Buat SSH key baru dengan generate melaluui perintah `ssh-keygen` kemudian copy isi isi file `id_rsa.pub` kedalam ssh github 
- `git remote add origin git@github.com:rifaicham/housy-frontend.git` jalankan perintah didalam folder aplikasi
- kemudian push dengan perintah `git push -u origin main`
- dapat dilihat dari web browser apakah sudah terupload

### 3. Membuat branch
- dengan perintah `git branch development` dan `git branch production`
- ketika sudah, dapat dilihat dengan perintah `git branch -v`

### 4. Melakukan perubahan dari branch lain

- masuk kedalam branch yg dituju dengan perintah `git checkout production` dan untuk melihat apakah benar sudah berhasil pindah dapat dengan perintah `git branch -v`

- kemudian push dengan perintah `git push -u origin production`

- Buat file untuk simulasi ada penambahan fitur, kemudian tambahkan ke git dengan `git add *` dan kemudian commit dengan `git commit -m "update ke development"` dan jalankan perintah `git merge development production` yang menunjukkan proses migrasi dari production ke development

- lakukan git push dengan perintah `git push -u origin development` dan dapat dilihat dari web browser ada tejadi perubahan 