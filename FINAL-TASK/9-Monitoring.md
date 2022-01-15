# Monitoring

## Node Exporter

- buat direktory `files` untuk menyimpan semua file yang dicopy ke server host
- Buat file `docker-compose-node_exporter.yml` dan jalankan untuk semua server
```
version: '3'

services:
  node_exporter:
    image: prom/node-exporter:latest
    container_name: node_exporter
    ports:
      - 9100:9100
    command:
      - '--path.procfs=/host/proc'
      - '--path.rootfs=/rootfs'
      - '--path.sysfs=/host/sys'
      - '--collector.filesystem.mount-points-exclude=^/(sys|proc|dev|host|etc)($$|/)'
    restart: unless-stopped
    volumes:
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro
      - /:/rootfs:ro    
```
- Buat file setup-node_exporter.yml
```
- name: Installing node exporter
  hosts: all
  become: true
  tasks:
    - name: Copying docker compose file
      copy:
        src: files/monitoring/docker-compose-node_exporter.yml
        dest: /home/ubuntu/

    - name: Run docker compose
      shell:
        cmd: "docker-compose -f docker-compose-node_exporter.yml up -d"
```
Jalankan dengan perintah `sudo ansible-playbook setup-node_exporter.yml`


## Prometheus dan Grafana

- Kemudian install prometheus dan grafana hanya untuk server monitoring. 
buat file konfigurasi `prometheus.yml` dan `web.yml` dalam direktory files.

```
prometheus.yml
---
global:
  scrape_interval: 5m

scrape_configs:
  - job_name: "prometheus-metrics"
    scrape_interval: 5m
    static_configs:
      - targets: ['172.19.146.231:9100']
  - job_name: "node_exporter_metrics"
    scrape_interval: 5m
    scrape_timeout: 1m
    tls_config:
      insecure_skip_verify: true
    static_configs:
      - targets: ['172.19.147.152:9100','172.19.158.16:9100']
```
```
web.yml
basic_auth_users:
  admin: admin
```
- Setelah itu buat docker-compose untuk prometheus dan grafana didalam direktory `files` `nano docker-compose-monitoring.yml`
 ```
docker-compose-monitoring.yml
 ---
version: '3'
services:
  prometheus:
    image: prom/prometheus:latest
    container_name: prometheus
    restart: unless-stopped   
    volumes:
      - /home/ubuntu/prometheus.yml:/etc/prometheus/prometheus.yml
      - /home/ubuntu/web.yml:/etc/prometheus/web.yml
    command:
      - '--config.file=/etc/prometheus/prometheus.yml'
      - '--web.config.file=web.yml'
      - '--storage.tsdb.path=/prometheus'
      - '--web.console.libraries=/etc/prometheus/console_libraries'   
      - '--web.console.templates=/etc/prometheus/consoles'
      - '--web.enable-lifecycle'
    ports:
      - 9090:9090

  grafana:
    image: grafana/grafana:latest-ubuntu
    container_name: grafana
    volumes:
      - /home/ubuntu/grafana/data:/var/lib/grafana
    ports:
      - 3000:3000
    user: "1000"
    restart: unless-stopped
```

kemudian buat file ansible-playbook untuk instalasi prometheus-grafana `nano setup-monitoring.yml`
```
setup-monitoring.yml
  ---
- name: Setup monitoring
  hosts: monitoring
  become: true
  tasks:
    - name: Copying docker compose monitoring file
      copy:
        src: setup-monitoring.yml
        dest: /home/ubuntu/

    - name: Copying prometheus.yml file
      copy:
        src: files/monitoring/prometheus.yml
        dest: /home/ubuntu/
    
    - name: Copying web.yml file
      copy:
        src: files/monitoring/web.yml
        dest: /home/ubuntu/

    - name: Run compose up 
      shell:
        cmd: "docker-compose -f setup-monitoring.yml up -d"

    - name: Change grafana folder permission
      shell: "sudo chown 1000:1000 grafana/data/"
      args:
        executable: /bin/bash   
```

### Grafana
1. Membuat password baru
  - akses grafana melalui web browser dan akan muncul tampilan awal grafana
  - masukkan admin:admin
  - dan ubah password untuk akses grafana kembali 
2. 