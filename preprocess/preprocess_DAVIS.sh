#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
conda activate banmo/
prefix=$1
finaloutdir=database/DAVIS/
ishuman=$2 # y/n
counter=0
seqname=$prefix$(printf "%03d" $counter)
# create required dirs
mkdir -p ./tmp
mkdir -p database/DAVIS/
mkdir -p raw/output
mv database/DAVIS/Annotations/Full-Resolution/$prefix database/DAVIS/Annotations/Full-Resolution/$seqname
mv database/DAVIS/JPEGImages/Full-Resolution/$prefix database/DAVIS/JPEGImages/Full-Resolution/$seqname
python preprocess/compute_dp.py $seqname $ishuman

# flow
cd third_party/vcnplus
bash compute_flow.sh $seqname
cd -

# write config file
python preprocess/write_config.py ${seqname::-3} $ishuman
