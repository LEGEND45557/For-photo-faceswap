#!/bin/bash

source /venv/main/bin/activate
COMFYUI_DIR=${WORKSPACE}/ComfyUI

### MODELS

DIFFUSION_MODELS=(
"https://huggingface.co/Kijai/WanVideo_comfy_fp8_scaled/resolve/main/Wan22Animate/Wan2_2-Animate-14B_fp8_scaled_e4m3fn_KJ_v2.safetensors"
"https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank256_bf16.safetensors"
)

LORA_MODELS=(
"https://huggingface.co/vpakarinen/wan22-vae-lora-clip/resolve/main/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors"
"https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Pusa/Wan21_PusaV1_LoRA_14B_rank512_bf16.safetensors"
"https://huggingface.co/rahul7star/wan2.2Lora/resolve/main/Wan2.2-Fun-A14B-InP-low-noise-HPS2.1.safetensors"
)

VAE_MODELS=(
"https://huggingface.co/OreX/Models/resolve/main/WAN/wan_2.1_vae.safetensors"
)

CLIP_MODELS=(
"https://huggingface.co/f5aiteam/CLIP/resolve/main/qwen_2.5_vl_7b_fp8_scaled.safetensors"
)

CLIP_VISION_MODELS=(
"https://huggingface.co/ratoenien/clip_vision_h/resolve/main/clip_vision_h.safetensors"
)

TEXT_ENCODER_MODELS=(
"https://huggingface.co/OreX/Models/resolve/main/WAN/umt5_xxl_fp8_e4m3fn_scaled.safetensors"
)

DETECTION_MODELS=(
"https://huggingface.co/JunkyByte/easy_ViTPose/resolve/main/onnx/wholebody/vitpose-l-wholebody.onnx"
)

### FUNCTIONS

download_group() {
    dir="$1"
    shift
    arr=("$@")

    mkdir -p "$dir"

    echo "Downloading ${#arr[@]} file(s) to $dir"

    for url in "${arr[@]}"; do
        echo "Downloading $url"
        wget -qnc --show-progress --content-disposition -P "$dir" "$url"
        echo ""
    done
}

### START

echo ""
echo "===== WAN VIDEO PROVISIONING ====="
echo ""

download_group "${COMFYUI_DIR}/models/diffusion_models" "${DIFFUSION_MODELS[@]}"
download_group "${COMFYUI_DIR}/models/loras" "${LORA_MODELS[@]}"
download_group "${COMFYUI_DIR}/models/vae" "${VAE_MODELS[@]}"
download_group "${COMFYUI_DIR}/models/clip" "${CLIP_MODELS[@]}"
download_group "${COMFYUI_DIR}/models/clip_vision" "${CLIP_VISION_MODELS[@]}"
download_group "${COMFYUI_DIR}/models/text_encoders" "${TEXT_ENCODER_MODELS[@]}"
download_group "${COMFYUI_DIR}/models/detection" "${DETECTION_MODELS[@]}"

echo ""
echo "Provisioning complete"
echo ""
