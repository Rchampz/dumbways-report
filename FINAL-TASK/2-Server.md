# Membuat Server

## Requirements
- Server Nginx
- Server Frontend, Backend, Database, CI/CD
- Server Monitoring

## Instructions
- Create multiple server with load balancing (Frontend and Backend)
- Create security group for all server using ufw

## Answer
### 1. Create server
Membuat beberapa server dari multipass dengan perintah 
```
multipass launch -c 1 -m 1G -d 10G --name <nama server>
```
dan setelah dibuat semuanya dpat dicek menggunakan perintah `multipass ls`
<p align="center">
    <img src="assets\createserver.jpg" />
</p>

### 2. Load Balance
untuk konfigurasi load balance disini menggunakan nginx type least connection, yang di isikan dalam file frontend.conf dan backend.conf
```
frontend.conf
---
upstream lb-frontend{
       least_conn;
       server 172.19.156.209:1001;
       server 172.19.156.209:1002;
}

server {
      server_name housy.rifai.xyz;

      location / {
         proxy_pass http://lb-frontend;
      }
}
```
```
backend.conf
---
upstream lb-backend{
       least_conn;
       server 172.19.156.209:1003;
       server 172.19.156.209:1004;
}

server {
      server_name api.housy.rifai.xyz;

      location / {
         proxy_pass http://lb-backend;
      }
}
```
<p align="center">
    <img src="assets\ansibehosts.jpg" />
</p>

### Docker in all server
- Buat file setup-docker-all.yml
```
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

- Jalankan dengan perintah `sudo ansible-playbook setup-docker-all.yml`