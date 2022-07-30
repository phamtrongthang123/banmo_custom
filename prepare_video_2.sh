#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
conda activate banmo/
mkdir -p database/DAVIS/Annotations/Full-Resolution/
mkdir -p database/DAVIS/JPEGImages/Full-Resolution/
rm -rf database/DAVIS/Annotations/Full-Resolution/video_2000
rm -rf database/DAVIS/JPEGImages/Full-Resolution/video_2000
rm -rf database/DAVIS/Annotations/Full-Resolution/video_2
rm -rf database/DAVIS/JPEGImages/Full-Resolution/video_2

cp /home/ptthang/data_mount/journal_data/Annotations/* -rf database/DAVIS/Annotations/Full-Resolution/
cp /home/ptthang/data_mount/journal_data/JPEGImages/* -rf database/DAVIS/JPEGImages/Full-Resolution/

# mkdir -p ./lasr_vcn
# gdown "https://drive.google.com/uc?id=139S6pplPvMTB-_giI6V2dxpOHGqqAdHn" -O ./lasr_vcn/vcn_rob.pth

bash preprocess/preprocess_DAVIS.sh video_2 n 
