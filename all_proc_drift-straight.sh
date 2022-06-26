#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
conda activate banmo/
seqname=drift-straight
# PREPARE
mkdir -p database/DAVIS/Annotations/Full-Resolution/
mkdir -p database/DAVIS/JPEGImages/Full-Resolution/
rm -rf database/DAVIS/Annotations/Full-Resolution/${seqname}000
rm -rf database/DAVIS/JPEGImages/Full-Resolution/${seqname}000
rm -rf database/DAVIS/Annotations/Full-Resolution/${seqname}
rm -rf database/DAVIS/JPEGImages/Full-Resolution/${seqname}

cp /home/ptthang/DAVIS/Annotations/Full-Resolution/${seqname}/ -rf database/DAVIS/Annotations/Full-Resolution/
cp /home/ptthang/DAVIS/JPEGImages/Full-Resolution/${seqname}/ -rf database/DAVIS/JPEGImages/Full-Resolution/


bash preprocess/preprocess_DAVIS.sh ${seqname} n 


# RUN 
python preprocess/img2lines.py --seqname $seqname

# Optimization
bash scripts/template-accu.sh 2 $seqname 10008 "no" "no"
# argv[1]: gpu ids separated by comma 
# args[2]: sequence name
# args[3]: port for distributed training
# args[4]: use_human, pass "" for human cse, "no" for quadreped cse
# args[5]: use_symm, pass "" to force x-symmetric shape

# Extract articulated meshes and render
bash scripts/render_mgpu.sh 2 $seqname logdir/$seqname-e120-b128-ft2/params_latest.pth \
        "0" 256
# argv[1]: gpu id
# argv[2]: sequence name
# argv[3]: weights path
# argv[4]: video id separated by space
# argv[5]: resolution of running marching cubes (256 by default)
