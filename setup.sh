mkdir -p /workspace/ComfyUI/models/diffusion_models
mkdir -p /workspace/ComfyUI/models/loras
mkdir -p /workspace/ComfyUI/models/vae
mkdir -p /workspace/ComfyUI/models/clip
mkdir -p /workspace/ComfyUI/models/clip_vision
mkdir -p /workspace/ComfyUI/models/text_encoders
mkdir -p /workspace/ComfyUI/models/detection

if [ ! -f /workspace/ComfyUI/models/diffusion_models/Wan2_2-Animate-14B_fp8_scaled_e4m3fn_KJ_v2.safetensors ]; then
wget -c -O /workspace/ComfyUI/models/diffusion_models/Wan2_2-Animate-14B_fp8_scaled_e4m3fn_KJ_v2.safetensors https://huggingface.co/Kijai/WanVideo_comfy_fp8_scaled/resolve/main/Wan22Animate/Wan2_2-Animate-14B_fp8_scaled_e4m3fn_KJ_v2.safetensors
fi

if [ ! -f /workspace/ComfyUI/models/diffusion_models/lightx2v_I2V_14B_480p_cfg_step_distill_rank256_bf16.safetensors ]; then
wget -c -O /workspace/ComfyUI/models/diffusion_models/lightx2v_I2V_14B_480p_cfg_step_distill_rank256_bf16.safetensors https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank256_bf16.safetensors
fi

if [ ! -f /workspace/ComfyUI/models/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors ]; then
wget -c -O /workspace/ComfyUI/models/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors https://huggingface.co/vpakarinen/wan22-vae-lora-clip/resolve/main/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors
fi

if [ ! -f /workspace/ComfyUI/models/loras/Wan21_PusaV1_LoRA_14B_rank512_bf16.safetensors ]; then
wget -c -O /workspace/ComfyUI/models/loras/Wan21_PusaV1_LoRA_14B_rank512_bf16.safetensors https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Pusa/Wan21_PusaV1_LoRA_14B_rank512_bf16.safetensors
fi

if [ ! -f /workspace/ComfyUI/models/loras/Wan2.2-Fun-A14B-InP-low-noise-HPS2.1.safetensors ]; then
wget -c -O /workspace/ComfyUI/models/loras/Wan2.2-Fun-A14B-InP-low-noise-HPS2.1.safetensors https://huggingface.co/rahul7star/wan2.2Lora/resolve/main/Wan2.2-Fun-A14B-InP-low-noise-HPS2.1.safetensors
fi

if [ ! -f /workspace/ComfyUI/models/vae/wan_2.1_vae.safetensors ]; then
wget -c -O /workspace/ComfyUI/models/vae/wan_2.1_vae.safetensors https://huggingface.co/OreX/Models/resolve/main/WAN/wan_2.1_vae.safetensors
fi

if [ ! -f /workspace/ComfyUI/models/clip/qwen_2.5_vl_7b_fp8_scaled.safetensors ]; then
wget -c -O /workspace/ComfyUI/models/clip/qwen_2.5_vl_7b_fp8_scaled.safetensors https://huggingface.co/f5aiteam/CLIP/resolve/main/qwen_2.5_vl_7b_fp8_scaled.safetensors
fi

if [ ! -f /workspace/ComfyUI/models/clip_vision/clip_vision_h.safetensors ]; then
wget -c -O /workspace/ComfyUI/models/clip_vision/clip_vision_h.safetensors https://huggingface.co/ratoenien/clip_vision_h/resolve/main/clip_vision_h.safetensors
fi

if [ ! -f /workspace/ComfyUI/models/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors ]; then
wget -c -O /workspace/ComfyUI/models/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors https://huggingface.co/OreX/Models/resolve/main/WAN/umt5_xxl_fp8_e4m3fn_scaled.safetensors
fi

if [ ! -f /workspace/ComfyUI/models/detection/vitpose-l-wholebody.onnx ]; then
wget -c -O /workspace/ComfyUI/models/detection/vitpose-l-wholebody.onnx https://huggingface.co/JunkyByte/easy_ViTPose/resolve/main/onnx/wholebody/vitpose-l-wholebody.onnx
fi
