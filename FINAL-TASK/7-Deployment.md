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
1. Membuat docker-compose untuk aplikasi
```
nano docker-compose-app.yml
---
version: '3'

services:

 frontend1:
  container_name: frontend1
  build: ./housy-frontend
  stdin_open: true
  ports:
   - 1001:3000
 frontend2:
  container_name: frontend2
  build: ./housy-frontend
  stdin_open: true
  ports:
   - 1002:3000

 backend1:
  container_name: backend1
  build: ./housy-backend
  stdin_open: false
  ports:
   - 1003:5000
 backend2:
  container_name: backend2
  build: ./housy-backend
  stdin_open: false
  ports:
   - 1004:5000
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
    - name: clone housy-frontend development branch
      ansible.builtin.git:
        repo: https://github.com/rifaicham/housy-frontend.git
        dest: /home/ubuntu/housy-frontend
        single_branch: yes
        version: production
    - name: clone housy-backend development branch
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

4. Reverse proxy
- frontend
- backend

