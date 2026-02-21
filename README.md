# LobeHub Dockerfile for Choreo

# Version

v2.1.31

# Releases

## 📦 Release v2.1.31


1. 更新的文生图，图生图模型列表，`z-image` `wan2.5` `wan2.6` `qwen-image-plus/max` `qwen-image-edit-plus/max`
2. 新增 `image2image` endpoint，为老版本图生图模型进行兼容
3. 默认使用 `multimodal-generation` endpoint（新模型目前调研下来都是用这个了，同时支持图生图和文生图）
4. 支持多区域 Dashscope URL，跟随 baseUrl 参数，自动切分 `/compatible-mode/v1` 默认北京区域
    北京 https://dashscope.aliyuncs.com
    新加坡 https://dashscope-intl.aliyuncs.com
    弗吉尼亚 https://dashscope-us.aliyuncs.com