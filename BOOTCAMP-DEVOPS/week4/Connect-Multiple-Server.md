### Menghubungkan server lain ke server monitoring
1. Install node_exporter di server yang akan dimonitoring
2. Jika sudah terinstall tambahkan alamat server kedalam file prometheus.yml
```
sudo nano /etc/prometheus/prometheus.yml
```
```
global:
  scrape_interval: 10s

scrape_configs:
  - job_name: 'prometheus'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9090', <alamat IP server yang dipantau>:9100]
```

3. kemudian restart aplikasi prometheus
dan buka web browser, pilih targets dan dapat dilihat apakah sudah terkoneksi atau belum

### Menampilkan data yang dimonitoring dari server
1. Konfigurasi data source
- buka configuration kemudian pilih data source
- kemudian pilih prometheus
- isikan dimana ip dan port prometheus 
- jika sudah pilih `save & test` dan ketika berhasil terkonfigurasi akan muncul notifikasi bahwa `data source is working` 
2. Menampilkan informasi server
- pilih import pada menu create 
- cari dashboard yang sesuai kebutuhan pada `https://grafana.com/grafana/dashboards/`
- disini menggunakan node exporter quickstart kemudian copy ID kedalam kolom `import via grafana.com`
- kemudian klik `load` dan `import`
- Jika sudah dapat dilihat tampilan dashboard akan menampilkan informasi dari server yang dimonitor, dari CPU, memory, RAM, dan Network

