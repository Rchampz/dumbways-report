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
1. use branch production
- git clone aplikasi menggunakan ssh
```
git clone git@github.com:rifaicham/housy-backend.git
git clone git@github.com:rifaicham/housy-frontend.git
```
- Pull aplikasi dari branch production
```
cd housy-frontend
git pull origin production
---
cd housy-backend
git pull origin production
```
2. Build images docker untuk aplikasi 
```
cd housy-frontend
sudo docker build -t rifaicham/housy-frontend .
cd housy-backend
sudo docker build -t rifaicham/housy-backend .
```
Jika sudah dapat dicek melalui `sudo docker images`

3. Deploy aplikasi menggunakan docker container
- buat file docker-compose
```
version: '3'

services:

 frontend1:
  container_name: frontend1
  image: rifaicham/housy-frontend
  stdin_open: true
  ports:
   - 1001:3000
 frontend2:
  container_name: frontend2
  image: rifaicham/housy-frontend
  stdin_open: true
  ports:
   - 1002:3000

 backend1:
  container_name: backend1
  image: rifaicham/housy-backend
  stdin_open: false
  ports:
   - 1003:5000
 backend2:
  container_name: backend2
  image: rifaicham/housy-backend
  stdin_open: false
  ports:
   - 1004:5000
```
Alasan mengapa dideploy 2 adalah untuk load-balance

