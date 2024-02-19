#!/bin/bash

# 设置备份目录和备份文件名
backup_dirs=("/etc" "/home" "/var" "/usr/local" "/root")
backup_time=$(date +'%Y%m%d_%H%M%S')

# 错误处理函数
handle_error() {
    echo "Error occurred at line $1"
    exit 1
}
trap 'handle_error $LINENO' ERR

# 备份每个目录到单独的 zip 压缩包
for dir in "${backup_dirs[@]}"; do
    backup_file="backup_${dir##*/}_${backup_time}.zip"
    zip -r "$backup_file" "$dir"
done

# 备份完成后，使用 rclone 同步到天翼云盘
#rclone sync "$backup_file" tianyi:甲骨文VPS备份

# 删除本地备份文件
#rm "$backup_file"
