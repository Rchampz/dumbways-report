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

- Generate password
  generate password dengan mkpasswd `sudo apt install whois` kemudian `mkpasswd --method=sha-512 password`
  maka akan muncul seperti ini. dan copy password yang digenerate
<p align="center">
    <img src="assets\mkpasswd.jpg" />
</p>

- buat variabel ansible yang berisi username dan password yg telah dicopy sebelumnya
```
nano setup-user-vars.yml
---
username: fai
password:
```

- membuat file ansible-playbook
```
nano setup-user.yml
---
- name: Create User
  hosts: all
  become: true
  vars_files:
    - vars/setup-user-vars.yml
  tasks:

    - name: Create new user
      user:
        name: "{{username}}"
        password: "{{password}}"
        groups:
          - sudo
          - admin
        state: present
 
    - name: Add public key to authorized_keys
      ansible.posix.authorized_key:
        user: "{{ username }}"
        state: present
        key: "{{ lookup('file', '/home/ubuntu/.ssh/id_rsa.pub') }}"  
  
    - name: Allow specific users to log in
      ansible.builtin.lineinfile:
        dest: /etc/ssh/sshd_config
        regexp: '^AllowUsers'
        line: 'AllowUsers {{ username }}'
        state: present

    - name: Add {{ username }} to sudoers file
      ansible.builtin.lineinfile:
        path: /etc/sudoers
        regexp: '^{{ username }}'
        line: '{{ username }} ALL=(ALL) NOPASSWD: ALL'
        validate: 'visudo -cf %s'

    - name: Enable Password Authentication
      lineinfile:
        path: /etc/ssh/sshd_config
        search_string: 'PasswordAuthentication no'
        line: PasswordAuthentication yes

    - name: Restart SSH Service
      service:
        name: ssh
        state: restarted
```

Jalankan denga perintah `sudo ansible-playbook setup-user.yml`
<p align="center">
    <img src="assets\ansiblecreateuser.jpg" />
</p>

akses menggunakanan ubuntu home melalui ssh dengan perintah `ssh fai@172.29.149.56` 

<p align="center">
    <img src="assets\cekuser.jpg" />
</p>
<p align="center">
    <img src="assets\aksesuserdariserverlain.jpg" />
</p>
