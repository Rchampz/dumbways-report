<p align="center">
    <img src="assets\mindmap.jpg" />
</p>

Secara garis besar, yang dilakukan adalah
1. Membuat 5 server yaitu gateway, app, database, monitoring, cicd
2. Membangun aplikasi frontend dan backend menggunakan docker container dalam server app
3. Membuat server database menggunakan postgresql
4. Menghubungkan antara frontend-backend-server_database
5. Membuat server CICD docker jenkins dan melakukan otomatis build trigger by push github
6. Membuat reverse proxy untuk frontend, backend, cicd, dan monitoring
7. Memantau atau memonitoring kinerja tiap server melalui node_exporter(untuksemuaserver), prometheus, dan grafana
8. Mengamankan prometheus dengan auth_prometheus