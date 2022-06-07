#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
conda activate banmo/
prefix=$1
finaloutdir=database/DAVIS/
ishuman=$2 # y/n
seqname=$prefix
# create required dirs
mkdir -p ./tmp
mkdir -p database/DAVIS/
mkdir -p raw/output

python preprocess/compute_dp.py $seqname $ishuman

# flow
cd third_party/vcnplus
bash compute_flow.sh $seqname
cd -

# write config file
python preprocess/write_config.py ${seqname} $ishuman
