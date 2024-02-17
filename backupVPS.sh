#!/bin/bash

# 备份文件名
backup_file="backup_$(date +'%Y%m%d_%H%M%S').zip"

# 同步 rclone 挂载的路径到本地
rclone sync tianyi:甲骨文VPS备份 "$backup_file"

# 备份文件到 zip 压缩包
zip -r "$backup_file" "$backup_file"

# 备份完成后，使用 rclone 同步到天翼云盘
rclone sync "$backup_file" tianyi:甲骨文VPS备份

# 删除本地备份文件
rm "$backup_file"
