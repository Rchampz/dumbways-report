# Week 4
Jelaskan maksud dari week 4 ini

# Kebutuhan
1. Buat dokumentasi
   - aplikasi node js
   - aplikasi python
   - aplikasi golang
2. Buat monitoring bagaimana cara mengecek aplikasi hidup/mati beserta langkah-langkahnya
3. tiap aplikasi buat reverse proxy (dengan format (namaaplikasi.rifai.xyz))
4. load balance nginx dokumentasi dan implementasi


# Penyelesaian
1. [Dokumentasi pembuatan aplikasi dan konfigurasi dalam](https://github.com/rifaicham/dumbways-report/blob/main/week-4/README.md#dokumentasi-pembuatan-aplikasi-dan-konfigurasi)
   - Node.js
   - python
   - golang
2. Monitoring
3. Reverse proxy
4. Load Balance Nginx

# Jawaban

## 1. Dokumentasi pembuatan aplikasi dan konfigurasi
### Node Js
- Instalasi node.js
  1. Dapat melihat di website nodejs.org atau langsung melalui terminal dengan perintah `wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash` 
  2. Setelah itu jalankan perintah `nvm install 16.13.0` untuk menginstall node js versi 16.13.0 lts.
     namun jika muncul notifikasi `command 'nvm' not found` jalankan perintah `source ~/.profile`
  3. dilanjutkan dengan perintah `nvm use 16` untuk menggunakan yang versi 16
  4. untuk mengecek apakah sudah terinstal dan melihat versi berapakah yang digunakan dengan cara `node -v` dan `npm -v`. Jika belum terdeteksi jalankan perintah `exec bash` 
- Jika sudah terinstal sekarang kita mencoba membuat aplikasi sederhana menggunakan node.js
  1. Membuat direktori untuk menyimpan aplikasi nodejs, kemudian msuk kedalam direktori tersebut dan jalankan perintah `npm init -y` yang berguna untuk inisiasi bahwa dalam program tersebut ada aplikasi nodejs
  2. Kemudian install express untuk bisa menjalankan nodejs dengan perintah `npm install express --save` Dokumentasi untuk expressjs lebiih lengkap [disini](https://expressjs.com/)
  3. Lalu buat file index.js dan edit menggunakan `nano index.js` dan tuliskan code program yang ingin dijalankan. Disini saya akan menjalankan code dibawah
      ```
      const express = require('express')
      const app = express()
      const port = 3000
      const path = require('path');
      const router = express.Router();

      router.get('/',function(req,res){
        res.sendFile(path.join(__dirname+'/index.html'));
        //__dirname : It will resolve to your project folder.
      });

      app.use('/',router);
      app.listen(port, () => {
        console.log(`Example app listening at http://localhost:${port}`)
      })
      ```
      Code diatas digunakan untuk menjalankan index.html yang akan ditampilkan ketika              localhost:3000 diakses via web browser. Kemudian save file index.js

  4. Setelah disave, jalankan perintah `node index.js` untuk menjalankan aplikasi yang sudah dibuat dan akan muncul string seperti berikut.
  5. Kemudian buka web browser dan akses `localhost:3000` untuk menampilkan aplikasi yang sudah dibuat dan diset ke port 3000 untuk bisa diakses

### Python
- Instalasi dan konfigurasi
   1. Lakukan update dan upgrade sistem dengan perintah `sudo apt update ; sudo apt upgrade` Jika sudah jalankan perintah `python3 -V` untuk mengecek versi yang sudah terinstall
   2. Lakukan instalasi package manager dengan perintah `sudo apt install python3-pip`
   3. Kemudian jalankan perintah `pip install flask` yang digunakan untuk menginstall flask. Flask sendiri adalah module pythone yang digunakan untuk web framework. Untuk dokumentasi lebih lengkap mengenai flask sendiri dapat dilihat [disini](https://pythonbasics.org/what-is-flask-python/)
- Jika sudah terinstall maka kita buat aplikasi sederhana menggunakan python dan module flask
   1. Buat direktori dengan `mkdir myapp-python` maka akan menbuat folder dengan nama myapp-python
   2. kemudian buat file index.py dengan perintah `nano index.py` kemudian ketik code yang ingin dibuat. Dalam kasus ini saya menggunakan aplikasi untuk memuat isi dari index.html
      ```
      from flask import Flask, render_template
      app = Flask(__name__)

      @app.route("/")
      def index():
          return render_template('index.html')

      if __name__ == '__main__':
          app.run(host="localhost", port=8000, debug=True)
      ```
      Dengan catatan didalam folder yang kita buat tadi myapp-python terdapat folder templates ynag berisi index.html, jika tidak terdapat folder templates maka akan terjadi error ketika diakses.
   3. Jika sudah maka jalankan perintah `python3 index.py` untuk menjalankan aplikasi yang telah dibuat.
   4. Kemudian akses dengan web browser `localhost:8000` karena kita tadi menjalankan aplikasi di port 8000. Maka akan menghasilkan tampilan seperti
## Golang
- Instalasi
   1. Install golang dengan perintah `sudo apt install go --clasic` setelah itu proses akan dilanjutkan mendownload dan extract resource. dan jika sudah akan muncul
   2. Untuk mengecek apakah sudah terinstall dapat dicek dengan perintah `go version`
   3. Kemudian install webframework untuk golang, disini saya menggunakan gin. Untuk lebih jelasnya mengenai gin dapat dilihat [disini](https://github.com/gin-gonic/gin). Untuk install gin dapat menggunakan perintah `$ go get -u github.com/gin-gonic/gin` 

- Jika sudah sekarang membuat aplikasi sederhana
   1. buat direktori dengan `mkdir myapp-go` dan buat file example.go dengan perintah `nano example.go`. Kemudian install gin dengan perintah `go mod init github.com/monkrus/gin-4` kemudian `go get github.com/gin-gonic/gin` setelah itu akan terbentuk 2 files yaitu go.mod dan go.sum yan merupakan hasil instalasi modules yang baru saj dipasang.
   2. Disini masih membuat aplikasi yang sama yaitu rendering html dalam file example.go code nya seperti
      ```
      package main

      import "github.com/gin-gonic/gin"
      import "net/http"

      func main() {
         router := gin.Default()
	      router.LoadHTMLFiles("templates/cdindex.html")
	      router.GET("/", func(c *gin.Context) {
		      c.HTML(http.StatusOK, "index.html", gin.H{
			      "title": "Main website",
		      })
	   })
	   router.Run(":8080")
      }
      ```
   Untuk dapat menjalankannya dibuat file index.html dan dalam direktori template.
   3. Kemudian jalankan perintah `go run example.go` yang akan menjalan aplikasi go kedalam port 8080
   4. dan untuk mengecek apakah berhasil buka web browser dan akses `localhost:8080`

## Monitoring aplikasi dan mitigasi aplikasi
   ### Case 
   Sebuah aplikasi Nginx yang awalnya berjalan dengan normal tibatiba mati, Tuliskan langkah-langkah untuk mengecek apakah aplikasi tersebut mati dan cara untuk memulai kembali aplikasi tersebut
   ### Langkah-langkah
   1. Jalankan perintah `htop` dan cari apakah aplikasi berada dalam list atau tidak dengan perintah filter dengan menekan f11 dan cari nama aplikasinya yaitu Nginx. 
   2. Jika terdapat aplikasi nginx berarti aplikasi sudah jalan namun belum bisa diakses
   3. Sekarang coba cek aplikasi firewal dengan perintah `ufw app list` apakah terdapat aplikasi Nginx. Jika ada coba lagi untuk membuka port 80 apakah sudah bisa.
   4. Jika Belum bisa diakses sekarang jalankan perintah `ufw status` untuk mengetahui apakah firewall aktif dan adakah aplikasi yang terblok
   5. Dari perintah ufw status tadi menyatakan firewall aktif dan memblok aplikasi nginx. Untuk mengaktifkaan lagi aplikasi nginx berjalan digunakan perintah `ufw allow in "Nginx Full"`
   6. Cek lagi status firewal dengan `ufw status`, jika aplikasi nginx yang awalnya deny sekarang sudah menjadi allow maka aplikasi sudah dapat dijalankan di port 80
   7. Kemudian reload firewall dengan perintah `ufw reload` untuk mengaktifkan perubahan
   8. Cek dengan web browser apakah sudah aktif, jika sudah langkah-langkah untuk mengecek dan mengaktifkan kembali aplikasi sudah berjalan.

## Reverse Proxy
### List aplikasi yang berjalan
   1. NodeJS Port 3000
   2. Python Port 8000
   3. Golang Port 8080

Langkah-Langkah
1. Buka folder dimana nginx yang telah di install `cd /etc/nginx` dan buat direktori yang digunakan untuk menyimpan konfigurasi `sudo mkdir examples`
2. Buka file nginx.conf dengan perintah `nano nginx.conf` dan tambahkan direktori yang kita buat tadi agar dideteksi oleh nginx
3. Kemudian ubah permision dari folder yang telah dibuat menjadi user yang dipakai dengan perintah `sudo chown username:username examples` agar perintah yang akan dijalankan menjadi lebih ringkas tanpa menggunakan sudo
4. Terus masuk kedalam folder example dan buat file yang akan dibuatkan reverse proxy. Disini ada 3 aplikasi maka akan dibuat 3 reverse proxy seperti
   - NodeJS port 3000 | nodejs.rifai.xyz
   - Python port 8000 | python.rifai.xyz
   - Golang port 8080 | golang.rifai.xyz
   Tiap file berisi code seperti
   ```
   server {
         server_name nodejs.rifai.xyz;

         location / {
            proxy_pass http://127.0.0.1:3000;
         }
   }
   ```
   tiap blok dari blok `server_name` diisi dengan alamat yang diinginkan dan blok location `proxy_pass` diisi dengan port yang berjalan dari aplikasi. dan jalankan perintah `sudo nginx -t` untuk mengecek apakah konfigurasinya sudah benar  
5. Setting virtual host dengan `sudo nano /etc/hosts`
6. Jika sudah dimasukkan seperti Gambar diatas maka jalankan masing-masing aplikasi yang telah dibuat dan akses via host yang juga selesai dikonfigurasi
   - Node.js
   - Python
   - Golang
   
