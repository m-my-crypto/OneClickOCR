#!/bin/env bash 

#创建/tmp/OCR
mkdir /tmp/OCR/save

# 设定参数
SCR="/tmp/OCR/save"

# 截图
grim  -g "$(slurp)"  "$SCR.png"

# 图片处理来增强识别率
mogrify -modulate 100,0 -resize 400% $SCR.png 

# 使用 tesseract 识别英文和简体中文 eng+chi_sim(可以自己添加语言)
tesseract $SCR.png $SCR &> /dev/null -l eng+chi_sim

#去除空格并复制
sed 's/ //g' $SCR.txt | wl-copy

# 不去掉空格,直接将识别结果复制到剪贴板
#cat $SCR.txt | wl-copy

# 删除临时文件
#rm  $SCR.txt

#退出
exit

