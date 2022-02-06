## Install ansible

1. Konfigurasi
   
   ```
   sudo apt update
   sudo apt install software-properties-common
   sudo add-apt-repository --yes --update ppa:ansible/ansible
   ```

2. Install ansible
   
   ```
   sudo apt install ansible
   ```

## Membuat Inventori atau host

1. Buat direktori guna menyimpan file-file konfigurasi

2. Masuk kedalam folder dan buat file inventori untuk ansible yang bernama `hosts` fungsinya untuk menyimpan hostserver
   
   ```
   [app]
   172.19.147.152 ansible_user=ubuntu
   [database]
   172.19.158.16 ansible_user=ubuntu
   [monitoring]
   172.19.146.231 ansible_user=ubuntu
   ```

3. Kemudian buat file yang berisi sshkey guna masuk kedalam server. disini akan bernama ssh-key dan ubah kepemilikan berkas `sudo chmod 400 multipass.pem` 

4. Ping hosts untuk memastikan koneksi ansible dengan server host berjalan dengan perintah
   
   ```
   sudo ansible all --key-file multipass.pem -i hosts -m ping
   ```
   
   <p align="center">
    <img src="assets\ansibleping0.jpg" />
   </p>

## Setup ansible.cfg

1. buat file ansible.cfg dengan `nano ansible.cfg`

2. perintah yang akan dieksekusi oleh ansible.cfg
   
   ```
   [defaults]
   inventory = hosts # nama file inventori untuk menyimpan serverhost 
   private_key_file = multipass.pem #ssh-key guna akses server
   ```

3. kemudian jalankan perintah
   
   ```
   sudo ansible all -y -m ping
   ```
   
   <p align="center">
    <img src="assets\ansibleping1.jpg" />
   </p>

## Ansible-playbook

<p align="center">
    <img src="assets\serverlist.jpg" />
</p>

1. Buat file `main.yml` untuk update dan upgrade sistem 
   `sudo nano main.yml`
   isi dari file 
   ```
- hosts: all
  become: true
  tasks:
  
  - name: update dan upgrade
    apt:
      update_cache: yes
      upgrade: dist
    
    ```
    Jalankan dengan perintah `sudo ansible-playbook main.yml`
    <p align="center">
    <img src="assets\ansibleupdate.jpg" />
    </p>
    ```
2. Buat file setup-database.yml
   ```
- hosts: database
  become: true
  tasks:
  
  - name: install mysql
    apt:
      name: mysql-server
      state: present
    
    ```
    Jalankan dengan perintah `sudo ansible-playbook setup-database.yml`
    <p align="center">
    <img src="assets\ansibledatabase.jpg" />
    </p>
    ```
3. Buat file setup-docker.yml
   
   ```
   
   ```

---

- name: Setup Docker & Docker Compose
  hosts: all
  become: true
  tasks:
  
  - name: Setup repository
    shell: "sudo apt-get install ca-certificates curl gnupg lsb-release"
    args:
      executable: /bin/bash
  
  - name: Add docker GPG key
    apt_key:
      url: https://download.docker.com/linux/ubuntu/gpg
      state: present
  
  - name: Add docker repository
    apt_repository:
      repo: deb https://download.docker.com/linux/ubuntu focal stable
      state: present
  
  - name: Update system
    apt:
      update_cache: yes
  
  - name: Install docker engine
    apt:
      name: "{{item}}"
      state: latest
      update_cache: yes
    loop:
    
    - docker-ce
    - docker-ce-cli
    - containerd.io
  
  - name: Install stable release docker compose
    shell: sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    args:
      executable: /bin/bash
  
  - name: Apply executable permission to the binary
    shell: "sudo chmod +x /usr/local/bin/docker-compose"
    args:
      executable: /bin/bash
    
    ```
    Jalankan dengan perintah `sudo ansible-playbook setup-docker.yml`
    <p align="center">
    <img src="assets\ansibledocker.jpg" />
    </p>
    ```
4. Setup-monitoring
- buat direktory `files` untuk menyimpan semua file yang dicopy ke server host

- Buat file node_exporter-compose.yml dan jalankan untuk semua server
  
  ```
  version: '3'
  ```

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
      src: node_exporter-compose.yml
      dest: /home/ubuntu/
  
  - name: Run docker compose
    shell:
      cmd: "docker-compose -f node_exporter-compose.yml up -d"
    
    ```
    Jalankan dengan perintah `sudo ansible-playbook setup-node_exporter.yml`
    <p align="center">
    <img src="assets\ansiblenodeexporter.jpg" />
    </p>
    ```

- Kemudian install prometheus dan grafana hanya untuk server monitoring. 
  buat file konfigurasi `prometheus.yml` dalam direktory files 
  
  ```
  prometheus.yml
  ```

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

Setelah itu buat docker-compose untuk prometheus dan grafana didalam direktory `files` `nano prometheus-grafana-compose.yml`

```
prometheus-grafana-compose.yml
---
version: '3'
services:
 prometheus:
   image: prom/prometheus:latest
   container_name: prometheus
   restart: unless-stopped
   volumes:
     - /home/ubuntu/prometheus.yml:/etc/prometheus/prometheus.yml
   command:
     - '--config.file=/etc/prometheus/prometheus.yml'
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

kemudian buat file ansible-playbook untuk instalasi prometheus-grafana `nano setup-prometheus-grafana.yml`

```
prometheus-grafana-compose.yml
  ---
- name: Installing Prometheus & Grafana
  hosts: monitoring
  become: true
  tasks:
    - name: Copying docker compose file
      copy:
        src: prometheus-grafana-compose.yml
        dest: /home/ubuntu/

    - name: Copying prometheus.yml file
      copy:
        src: files/prometheus.yml
        dest: /home/ubuntu/

    - name: Run compose up 
      shell:
        cmd: "docker-compose -f prometheus-grafana-compose.yml up -d"

    - name: Change grafana folder permission
      shell: "sudo chown 1000:1000 grafana/data/"
      args:
        executable: /bin/bash   
```

<p align="center">
    <img src="assets\ansiblegrafana.jpg" />
</p>

5. Setup-Jenkins
- Buat file docker-compose untuk instalasi jenkins didalam direktory `files`, karena disini kita akan menginstall versi docker
  
  ```
  docker-compose-jenkins.yml
  ```

---

version: '3.9'
services:
  jenkins:
    image: jenkins/jenkins:lts-jdk11
    ports:
      - 8080:8080
      - 50000:50000
    privileged: true
    user: root
    container_name: jenkins
    volumes:
      - ~/jenkins:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
      - /usr/local/bin/docker:/usr/local/bin/docker   

```
- Kemudian buat file ansible-playbook yang berisi perintah untuk instalasi jenkins pada server cicd
```

setup-jenkins.yml
---

- name: Setup Jenkins Docker
  hosts: app
  become: true
  tasks:
  
  - name: Copy docker compose
    copy:
      src: docker-compose-jenkins.yml
      dest: /home/ubuntu/
  
  - name: Run docker compose
    shell: "docker-compose -f docker-compose-jenkins.yml up -d"
    args:
      executable: /bin/bash 
    
    ```
    <p align="center">
    <img src="assets\ansiblejenkins.jpg" />
    </p>
    ```
6. Setup-Apps
- Buat file docker-compose untuk apps `docker-compose-apps.yml` dalam  direktory `files` 
  
  ```
  version: '3'
  ```

services:

 frontend:
  container_name: frontend
  image: rifaicham/dumbflix-frontend
  stdin_open: true
  ports:

- 2001:3000
  
  backend:
  container_name: backend
  image: rifaicham/dumbflix-backend
  stdin_open: false
  ports:

- 2002:5000
  
  ```
  - Buat file ansible-playbook dan copy files docker-compose yang sebelumnya dibuat
  ```
  
  setup-apps.yml

---

- name: Setup-Aplikasi-Frontend-Backend
  hosts: app
  become: true
  tasks:
  
  - name: Copy docker compose
    copy:
      src: docker-compose-apps.yml 
      dest: /home/ubuntu/
  - name: Docker pull frontend
    shell: docker pull rifaicham/dumbflix-frontend
    args:
      executable: /bin/bash
  - name: Docker pull backend
    shell: docker pull rifaicham/dumbflix-backend
    args:
      executable: /bin/bash
  - name: Install dumbflix
    shell:"docker-compose -f docker-compose-apps.yml up -d"
    args:
      executable: /bin/bash
    
    ```
    
    ```

- Jalankan dengan perintah `sudo ansible-playbook setup-apps.yml`
  
  <p align="center">
    <img src="assets\ansibleapp.jpg" />
  </p>