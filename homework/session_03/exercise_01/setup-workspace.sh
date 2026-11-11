#!/bin/bash
# Bài 1 [Khá]: Thiết lập quyền và không gian làm việc cho Rikkei LMS
# Chạy bằng: sudo bash setup-workspace.sh
set -euo pipefail

if [ "$EUID" -ne 0 ]; then
  echo "Hãy chạy script bằng root hoặc sudo." >&2
  exit 1
fi

# 1. Tạo user rikkeilms (nếu chưa có). -m: tạo home, group rikkeilms được tạo tự động
if id rikkeilms &>/dev/null; then
  echo "User rikkeilms đã tồn tại, bỏ qua bước tạo user."
else
  useradd -m -s /bin/bash rikkeilms
fi

# 2. Tạo thư mục gốc chứa mã nguồn và cấu hình
mkdir -p /opt/rikkei/course-service

# 3. Chuyển owner cho rikkeilms (group = group chính của user, tức rikkeilms)
chown rikkeilms: /opt/rikkei/course-service

# 4. Chỉ owner có quyền ghi; owner rwx, group/others r-x => drwxr-xr-x
chmod 755 /opt/rikkei/course-service

# 5. Kiểm tra
ls -ld /opt/rikkei/course-service
