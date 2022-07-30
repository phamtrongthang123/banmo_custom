#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
conda activate banmo/
seqname=video_2

# Extract articulated meshes and render
bash scripts/render_mgpu_fullmesh.sh 1 $seqname logdir/$seqname-e120-b128-ft2/params_latest.pth \
        "0" 256
# argv[1]: gpu id
# argv[2]: sequence name
# argv[3]: weights path
# argv[4]: video id separated by space
# argv[5]: resolution of running marching cubes (256 by default)
