#!/bin/bash
# 2023 - Palguno Wicaksono

# build docker dari dockerfile
echo -e "==== BUILD DOCKER IMAGE DARI DOCKER FILE ===="
docker build -t ghcr.io/icaksh/karsajobs:latest .

# delay 5 detik
sleep 5

# lihat daftar image di lokal
echo -e "\n==== DAFTAR IMAGE DI LOKAL ===="
docker images

# delay 5 detik
sleep 5

echo -e "\n==== AUTENTIKASI GHCR ===="
# login ke ghcr.io
echo -e "\nSebelum anda mengunggah file ke GitHub Container Registry"
echo -e "\nPastikan anda telah melakukan forking repository"
read -p "Masukkan username GitHub: " github_username

# delay 5 detik
sleep 5

# push ke ghcr.io
echo -e "\n==== LOGIN KE GHCR.IO ===="
echo $GITHUB_ACCESS_TOKEN | docker login ghcr.io -u $github_username --password-stdin

# delay 5 detik
sleep 5

# push ke github packages
echo -e "\n==== PUSH KE GHCR.IO ===="
echo -e "\nPastikan anda telah melakukan forking repository dan langkah sebelumnya tidak denied"
read -p "Konfirmasi (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
docker push ghcr.io/icaksh/karsajobs:latest