#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
conda activate banmo/
mkdir -p database/DAVIS/Annotations/Full-Resolution/
mkdir -p database/DAVIS/JPEGImages/Full-Resolution/
rm -rf database/DAVIS/Annotations/Full-Resolution/breakdance-flare000
rm -rf database/DAVIS/JPEGImages/Full-Resolution/breakdance-flare000
rm -rf database/DAVIS/Annotations/Full-Resolution/breakdance-flare
rm -rf database/DAVIS/JPEGImages/Full-Resolution/breakdance-flare

cp /home/ptthang/DAVIS/Annotations/Full-Resolution/breakdance-flare/ -rf database/DAVIS/Annotations/Full-Resolution/
cp /home/ptthang/DAVIS/JPEGImages/Full-Resolution/breakdance-flare/ -rf database/DAVIS/JPEGImages/Full-Resolution/

# mkdir -p ./lasr_vcn
# gdown "https://drive.google.com/uc?id=139S6pplPvMTB-_giI6V2dxpOHGqqAdHn" -O ./lasr_vcn/vcn_rob.pth

bash preprocess/preprocess_DAVIS.sh breakdance-flare n 
