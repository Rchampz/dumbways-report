# Membuat user

## Requirements
- Custom user for every server with password

## Instructions
- Create user with password
- Disable sign in without password

## Answer
Memnggunakan ansible

- Membuat inventory untuk ansible yg bernama `hosts` berisi list server

```
sudo nano hosts
---
[gateaway]
172.19.149.89 ansible_user=ubuntu

[app]
172.19.156.209 ansible_user=ubuntu

[database]
172.19.159.25 ansible_user=ubuntu

[monitoring]
172.19.148.146 ansible_user=ubuntu
```
- Cek koneksi antara ansible dengan server dengan perintah `sudo ansible all --key-file ssh.pem -i h
osts -m ping`

- membuat file ansible-playbook
```
nano setup-user.yml
---
- name: Create User
  hosts: all
  become: true
  vars_files:
    - vars/create_user_vars.yml
  tasks:

    - name: Create new user
      user:
        name: "{{username}}"
        password: "{{password}}"
        groups:
          - sudo
          - admin
        state: present
        shell: /bin/bash
        system: no
        createhome: yes
        home: /home/{{username}}

    - name: Create directory .ssh
      file:   
        path: /home/{{username}}/.ssh
        state: directory
        owner: fai
        group: fai
        mode: 700

    - name: Copy authorized_key
      copy: 
        src: files/authorized_key
        dest: /home/{{username}}/.ssh/

    - name: Change owner authorized_key
      file: 
        path: /home/{{username}}/.ssh/authorized_key
        owner: {{username}}
        group: {{username}}
        mode: 600

    - name: Enable Password Authentication
      lineinfile:
        path: /etc/ssh/sshd_config
        search_string: 'PasswordAuthentication no'
        line: PasswordAuthentication yes

    - name: Enable SSH Authentication
      lineinfile:
        path: /etc/ssh/sshd_config
        search_string: '#PubkeyAuthentication yes'
        line: PubkeyAuthentication yes

    - name: Restart SSH Service
      service:
        name: ssh
        state: restarted
```
Kemudian buat variabel yang berisi username dan password
```
nano setup-user-vars.yml
---
username: fai
password: rifai
```
Jalankan denga perintah `sudo ansible-playbook setup-user.yml`

