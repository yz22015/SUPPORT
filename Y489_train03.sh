#!/bin/bash

#SBATCH --time=24:00:00
#SBATCH --job-name=Y489_train03
#SBATCH --array=11
#SBATCH --ntasks=1
#SBATCH --mem=120000
#SBATCH --partition=gpu
#SBATCH --gpus-per-node=1
#SBATCH --output=/camp/home/zhangy3/em-schafer-working/yuxin_scripts/Projects/CLEM/CLEM221010/Y489/15-SUPPORT/out/Y489_test03_%j.out
#SBATCH --error=/camp/home/zhangy3/em-schafer-working/yuxin_scripts/Projects/CLEM/CLEM221010/Y489/15-SUPPORT/out/Y489_test03_%j.err
# #SBATCH --cpus-per-task=32 # python only uses 1 thread?
#SBATCH --mail-type=FAIL,END,TIME_LIMIT_90
# #SBATCH --mail-user= yuxin.zhang@crick.ac.uk
# #sbatch  --dependency=afterok 12312423423: try to use this method to stop the process after job 1 which generate plane folders, then run job 2 which does detection etc

# first source bashrc (with conda.sh), then conda can be used
source ~/.bashrc

# make sure conda base is activated
conda activate

conda activate SUPPORT

echo 'so far so good'

# yes | python -u batch_s2p_Y489.py $SLURM_ARRAY_TASK_ID
# python batch_s2p.py $SLURM_ARRAY_TASK_ID

# cd /camp/home/zhangy3/em-schafer-working/yuxin_scripts/repos/SUPPORT
yes | python -m src.train --exp_name Y489_train03 --noisy_data /camp/home/zhangy3/em-schafer-working/processed/CLEM2022/CLEM221010/Y489/18-2P_denoise_SURPPORT/test_data/plane4/Y489_s2p_reg_test_01_manualReg_chunk0_plane4.tif --n_epochs 40 --checkpoint_interval 10



# python ./src/train.py --exp_name Y489_test03 --noisy_data /camp/home/zhangy3/em-schafer-working/processed/CLEM2022/CLEM221010/Y489/18-2P_denoise_SURPPORT/test_data/plane4/Y489_s2p_reg_test_01_manualReg_chunk0_plane4.tif --n_epochs 40 --checkpoint_interval 10

