#!/bin/bash

# 设置临时目录
temp_dir="/tmp"

# 备份文件名
backup_file="backup_$(date +'%Y%m%d_%H%M%S').zip"

# 同步 rclone 挂载的路径到本地
rclone sync remote:tianyicloud "$temp_dir"

# 备份文件到 zip 压缩包
zip -r "$temp_dir/$backup_file" "$temp_dir/tianyicloud"

# 备份完成后，使用 rclone 同步到天翼云盘
rclone sync "$temp_dir/$backup_file" remote:甲骨文VPS备份

# 清理本地备份文件
rm "$temp_dir/$backup_file"
rm -rf "$temp_dir/tianyicloud"
