#!/bin/bash

source /venv/main/bin/activate
COMFYUI_DIR=${WORKSPACE}/ComfyUI

### ===== MODELS ===== ###

DIFFUSION_MODELS=(
"https://huggingface.co/drbaph/Qwen-Image-Edit-2511-FP8/resolve/main/qwen_image_edit_2511_fp8_e4m3fn.safetensors"
)

LORA_MODELS=(
"https://huggingface.co/lightx2v/Qwen-Image-Edit-2511-Lightning/resolve/main/Qwen-Image-Edit-2511-Lightning-4steps-V1.0-bf16.safetensors"
"https://huggingface.co/Alissonerdx/BFS-Best-Face-Swap/resolve/main/bfs_head_v5_2511_merged_version_rank_16_fp16.safetensors"
)

VAE_MODELS=(
"https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors"
)

### ===== FUNCTIONS ===== ###

download_model() {
    url="$1"
    dir="$2"

    mkdir -p "$dir"

    echo "Downloading: $url"
    
    if [[ -n "$HF_TOKEN" && "$url" == *"huggingface.co"* ]]; then
        wget --header="Authorization: Bearer $HF_TOKEN" \
             -qnc --content-disposition --show-progress \
             -P "$dir" "$url"
    else
        wget -qnc --content-disposition --show-progress \
             -P "$dir" "$url"
    fi

    echo ""
}

download_group() {
    dir="$1"
    shift
    arr=("$@")

    echo "Downloading ${#arr[@]} model(s) to $dir"
    for url in "${arr[@]}"; do
        download_model "$url" "$dir"
    done
}

### ===== START ===== ###

echo ""
echo "======================================"
echo "       Provisioning Container"
echo "======================================"
echo ""

download_group "${COMFYUI_DIR}/models/diffusion_models" "${DIFFUSION_MODELS[@]}"
download_group "${COMFYUI_DIR}/models/loras" "${LORA_MODELS[@]}"
download_group "${COMFYUI_DIR}/models/vae" "${VAE_MODELS[@]}"

echo ""
echo "Provisioning complete."
echo ""
