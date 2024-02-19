#!/bin/bash

# 获取主机名作为 VPS 名称
vps_name=$(hostname)

# 设置备份目录和备份文件名
backup_dirs="/etc /home /var /root /boot"
backup_file="backup_${vps_name}_$(date +'%Y%m%d_%H%M%S').tar.gz"

# 备份文件到 tar 压缩包
tar czvf "$backup_file" --exclude='/root/*.tar.gz' $backup_dirs

# 备份完成后，使用 rclone 同步到天翼云盘
rclone sync "$backup_file" tianyi:甲骨文VPS备份

# 删除本地备份文件
#rm "$backup_file"
