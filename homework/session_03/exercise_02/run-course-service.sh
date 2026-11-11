#!/bin/bash
# Bài 2 [Khá]: Khởi chạy Course-Service phiên bản Mock
set -euo pipefail

# Chạy ngầm (-d), đặt tên, ánh xạ host 8081 -> container 80
docker run -d --name rikkei-course-service -p 8081:80 nginxdemos/hello

# Kiểm tra
docker ps --filter "name=rikkei-course-service"
sleep 2
curl -s http://localhost:8081 | head -n 20
