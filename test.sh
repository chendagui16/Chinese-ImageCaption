#!/bin/bash
time=`date +"%m-%d-%H-%M"`
if [ ! -d "checkpoint" ]; then
    mkdir checkpoint
fi
if [ ! -d "log" ]; then
    mkdir log
fi
if [ ! -d "result" ]; then
    mkdir result
fi
LOG=log/test_${time}.log

	#--feature_path "image_vgg19_block5_pool_feature.h5" --ifpool True \
# dir path flags
python test_beam_search.py --workspace "/home/dagui/.keras/datasets/" \
    --feature_path "image_vgg19_fc2_feature.h5" --noifpool \
    --save_result "result/result_${time}.txt" \
    --model_weights "/home/dagui/Documents/class-slides/pattern recognization/course_project/checkpoint/weights.114-0.816.hdf5" \
	--caption_len 40 \
	--embedding_size 256 \
    --image_embedding_size 256 \
	--RNN_out_units 512 \
	--batch_size 40 \
	--num_RNN_layers 3 \
	--RNN_category "LSTM" 2>&1|tee ${LOG}
#if finetune use this
#	--if_finetune=True \
#	--weight_dir="." \
