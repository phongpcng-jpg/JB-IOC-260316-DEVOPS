#!/bin/bash
# Bài 2 [Giỏi]: Cấu hình môi trường cho Frontend QA
set -euo pipefail

# Tạo container nếu chưa tồn tại
if docker container inspect rikkei-frontend-qa >/dev/null 2>&1; then
  echo "Container rikkei-frontend-qa đã tồn tại, dùng lại."
else
  docker run -d --name rikkei-frontend-qa \
    -e API_ENDPOINT=https://qa-api.rikkei.edu.vn \
    nginx
fi

echo ">>> Đang mở bash trong container. Hãy gõ:  echo \$API_ENDPOINT   rồi gõ  exit  để thoát."
docker exec -it rikkei-frontend-qa bash
