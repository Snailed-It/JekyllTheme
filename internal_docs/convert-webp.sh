INPUT_FILE=$1
cwebp "$INPUT_FILE" -near_lossless 60 -o "${INPUT_FILE%.*}.webp"