# Deployment

## Requirements
- Deployment dumbflix frontend
- Deployment dumbflix backend

## Instructions
- Please read the instruction for deploy the apps
- Use the branch production
- Deploy applications with docker
- Integration housy frontend, backend and database
- Use command production to run the application -> not **npm start**
- Reverse proxy the frontend -> https://name.onlinecamp.id
- Reverse proxy the backend -> https://api.name.onlinecamp.id

## Answer
0. Install ansible
```
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

1. Membuat docker-compose untuk aplikasi
```
nano docker-compose-app.yml
---
version: '3.9'

services:

 frontend1:
  container_name: frontend1
  build: ./housy-frontend
  stdin_open: true
  ports:
   - 1001:3000

 backend1:
  container_name: backend1
  build: ./housy-backend
  stdin_open: false
  ports:
   - 1003:5000

```

2. Membuat ansible-playbook untuk setup aplikasi
```
nano setup-app.yml
---
- name: Setup-Aplikasi-Frontend-Backend
  hosts: app
  become: true
  tasks:
    - name: Copy docker compose
      copy:
        src: docker-compose-app.yml
        dest: /home/ubuntu/
    - name: clone housy-frontend production branch
      ansible.builtin.git:
        repo: https://github.com/rifaicham/housy-frontend.git
        dest: /home/ubuntu/housy-frontend
        single_branch: yes
        version: production
    - name: clone housy-backend production branch
      ansible.builtin.git:
        repo: https://github.com/rifaicham/housy-backend.git
        dest: /home/ubuntu/housy-backend
        single_branch: yes
        version: production
    - name: Run docker compose
      shell: "docker-compose -f docker-compose-app.yml up -d"
      args:
        executable: /bin/bash
```
Jalankan dengan perintah `sudo ansible-playbook setup-app.yml`

3. Menghubungkan frontend-backend-database
- frontend-backend
mengubah konfigurasi pada file src/config/api.js
- backend-database
mengubah konfigurasi pada file config/config.json
- Jika sudah terhubung dapat dicoba melalui signup housy via web browser. maka akan muncul tampilan seperti berikut

1. Reverse proxy
- frontend
- backend

