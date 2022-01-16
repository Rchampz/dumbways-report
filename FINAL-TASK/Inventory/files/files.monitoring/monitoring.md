# Auth
Karena prometheus aplikasi yang memungkinan diakses oleh publik dan merupakan jembatan antara node_exporter dan grafana, maka keamanan dari prometheus juga amat sangat penting. Belum lagi banyak sekali Prometheus Endpoints yang dapat dicari dengan mudah menggunakan search engine Zoomeye dan sebagainya.
(sumber: https://jfrog.com/blog/dont-let-prometheus-steal-your-fire/)

## Mengamankan prometheus dengan bcrypt

1. Membuat dockerfile untuk membuat images bcrypt
```
FROM python:3-alpine

RUN pip install bcrypt --disable-pip-version-check

COPY ./gen-pass.py /usr/src/myapp/gen-pass.py

WORKDIR /usr/src/myapp

ENTRYPOINT python gen-pass.py $PASSWORD
```
buat file `gen-pass.py` yang berisi program untuk generate password bcrypt
```
import getpass
import bcrypt
import sys

password = str(sys.argv[1])
print(password)
hashed_password = bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt())
print(hashed_password.decode())

original_stdout = sys.stdout # Save a reference to the original standard output

with open('/usr/src/myapp/web.yml', 'w') as f:
    sys.stdout = f # Change the standard output to the file we created.
    print('basic_auth_users:\n  admin: ' + hashed_password.decode())
    sys.stdout = original_stdout
```
kemudian jalankan dengan perintah `docker build --no-cache -t python-password .`

2. Membuat `docker-compose.yml` yang berisi tentang setup monitoring, dari prometheus dan grafana
```
version: "3"
services:
  prometheus:
    image: prom/prometheus:v2.32.1
    ports:
      - 9090:9090
    volumes:
      - ./files/prometheus:/etc/prometheus/
      - shared:/etc/password
    command:
      - '--config.file=/etc/prometheus/prometheus.yml'
      - '--web.config.file=/etc/password/web.yml'
      - '--storage.tsdb.path=/prometheus'
      - '--web.console.libraries=/usr/share/prometheus/console_libraries'
      - '--web.console.templates=/usr/share/prometheus/consoles'
    depends_on:
      - python
  python:
    image: python-password
    volumes:
      - shared:/usr/src/myapp
    environment:
      - PASSWORD=${PROM_ADMIN_PASS:-admin}
  grafana:
    image: grafana/grafana
    volumes:
      - grafana:/var/lib/grafana
      - ./files/grafana/provisioning/dashboards:/etc/grafana/provisioning/dashboards
      - ./files/grafana/provisioning/datasources:/etc/grafana/provisioning/datasources
    environment:
      - GF_SECURITY_ADMIN_USER=${GF_ADMIN_USER:-admin}
      - GF_SECURITY_ADMIN_PASSWORD=${GF_ADMIN_PASSWORD:-admin}
      - GF_USERS_ALLOW_SIGN_UP=false
      - PROMETHEUS_ADMIN_PASS=${PROM_ADMIN_PASS:-admin}
    restart: unless-stopped
    ports:
      - 3000:3000
    labels:
      org.label-schema.group: "monitoring"
volumes:
  grafana:
  shared:
    driver: local
```
3. Membuat direktory files yang berisi file-file konfigurasi untuk prometheus dan grafana
- prometheus
  buat direktory prometheus kemudian buat file prometheus.yml
```
global:
  scrape_interval: 10s
  evaluation_interval: 10s
scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets:
          - localhost:9090
  - job_name: server aplikasi
    static_configs:
      - targets:
          -<IPserveraplikasi>:9100
  - job_name: server database
    static_configs:
      - targets:
          -<IPserverdatabase>:9100
```
- grafana
  - grafana/provisioning/dashboards
    - [dashboard.yml](Inventory\files\files.monitoring\grafana\provisioning\dashboards\dashboard.yml)
    - [docker_containers.json](Inventory\files\files.monitoring\grafana\provisioning\dashboards\docker_containers.json)
    - [docker_host.json](Inventory\files\files.monitoring\grafana\provisioning\dashboards\docker_host.json)
    - [monitor_services.json](Inventory/files/files.monitoring/grafana/provisioning/dashboards/monitor_services.json)
  - grafana/provisiioning/datasources
    - [prometheus.yml](Inventory\files\files.monitoring\grafana\provisioning\datasources\prometheus.yml)