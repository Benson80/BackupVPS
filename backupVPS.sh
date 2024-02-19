#!/bin/bash

# 设置备份目录和备份文件名
backup_dirs=("/etc" "/home" "/var" "/root" "/boot")
backup_file="backup_$(date +'%Y%m%d_%H%M%S').zip"

# 备份文件到 zip 压缩包
zip -r "$backup_file" $backup_dir

# 备份完成后，使用 rclone 同步到天翼云盘
rclone sync "$backup_file" tianyi:甲骨文VPS备份

# 删除本地备份文件
#rm "$backup_file"
