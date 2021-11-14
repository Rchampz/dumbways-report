# Week 1
Membuat Kultur DevOps dalam Sebuah Perusahaan

##Requirements
- Buatlah flow DevOps dari awal hingga selesai berdasarkan materi yang telah di ajarkan
- Jelaskan secara rinci tools dan fungsi yang akan digunakan dalam perusahaan tersebut
- Tools yang dijelaskan boleh berbeda dari materi yang diajarkan

# Jawaban
PT.XYZ merupakan perusahaan yang bergerak dibidang jasa distribusi gas dari PGN untuk disalurkan kerumah-rumah didaerah jabodetabek. PT tersebut membutuhkan web yang digunakan untuk pendaftaran pelanggan baru dan mengecek apakah wilayah pelanggan baru tersebut masuk dalam area yang dicover oleh PT.XYZ

Kultur DevOps.
1. Planing
   Membuat rencana apa saja yang dibutuhkan dan fitur-fitur apa saja yang akan ada dalam      web tersebut
   Menentukan server apa yang akan digunakan dengan spesifikasi:
      1. diakses semua orang ( Menggunakan server yang bersifat public karena diakses semua orang, sistem operasi Linux 64Bit, Menggunakan containertools guna menginstall bahasa            yang digunakan dan aplikasi yang digunakan untuk membuat fitur berjalan
      2. database untuk menyimpan data wilayah yang ter-cover (public cloud tools berupa Amazon Web Service (AWS)) dan menyimpan data pengguna baru 
2. Coding
   Membuat fitur-fitur tersebut dengan bahasa pemrograman (Java,C,python : Tools yang digunakan Visualcode, dsb)
3. Build
   Menjadikan fitur-fitur tersebut dalam satu kesatuan aplikasi dalam web
4. Test
   Mengetest atau ujicoba keseluruhan fitur dalam aplikasi (Tools yang digunakan adalah Github untuk mendokumentasikan apa saja kejadian dalam pengetesan)
5. Release
   Setelah semua fitur telah ditest dan berjalan dengan sesuai keinginan, maka direalease ke publik
6. Deploy
   Mengunggah atau deploying aplikasi ke server AWS yang telah direncanakan diawal
7. Operate dan Monitoring
   Pengoperasian aplikasi dan monitoring guna menjaga aplikasi tetap berjalan dan uptodate dengan menggunakan tools Jenkins
