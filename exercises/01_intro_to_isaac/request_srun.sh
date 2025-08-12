srun --account isaac-UTK0411 \
     --partition=short \
     --qos=short \
     --nodes=1 \
     --cpus-per-task=20 \
     --mem=20G \
     --time=0-03:00:00 \
     --pty /bin/bash
