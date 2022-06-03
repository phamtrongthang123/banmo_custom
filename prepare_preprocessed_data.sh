#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
conda activate banmo/
echo "CAT PIKAChu"
bash misc/processed/download.sh cat-pikachiu
echo "CAT human"
bash misc/processed/download.sh human-cap

echo "raw PIKAChu"
bash misc/vid/download.sh cat-pikachiu
bash misc/vid/download.sh human-cap
bash misc/vid/download.sh dog-tetres
bash misc/vid/download.sh cat-coco

echo "raw posenet"
mkdir -p mesh_material/posenet && cd "$_"
wget $(cat ../../misc/posenet.txt); cd ../../