#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
rm -rf banmo/
conda create --prefix banmo/ python=3.8 -y
conda env update --prefix banmo/ -f misc/banmo.yml --prune
conda activate banmo/
python --version
# install kmeans-pytorch
pip install -e third_party/kmeans_pytorch
# install detectron2
python -m pip install detectron2 -f \
  https://dl.fbaipublicfiles.com/detectron2/wheels/cu110/torch1.7/index.html