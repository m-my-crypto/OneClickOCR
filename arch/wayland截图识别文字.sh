#!/bin/env bash 



# 修改 {Username} 为你的用户名

SCR="/home/mmy/OCR/save"



# 截图

grim  -g "$(slurp)"  "$SCR.png"



# 图片处理来增强识别率

mogrify -modulate 100,0 -resize 400% $SCR.png 



# 使用 tesseract 识别英文和简体中文 eng+chi_sim 并去掉空格

tesseract $SCR.png $SCR &> /dev/null -l eng+chi_sim

#去除空格并复制

sed 's/ //g' $SCR.txt | wl-copy

# 将识别结果复制到剪贴板

#cat $SCR.txt | wl-copy



# 删除临时文件

rm  $SCR.txt



exit

