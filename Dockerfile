FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

ARG VLLM_WHEEL=https://github.com/vllm-project/vllm/releases/download/v0.21.0/vllm-0.21.0+cu129-cp38-abi3-manylinux_2_34_x86_64.whl

RUN python -m venv /opt/vllm \
    && /opt/vllm/bin/python -m pip install --upgrade pip \
    && /opt/vllm/bin/python -m pip install "${VLLM_WHEEL}" --extra-index-url https://download.pytorch.org/whl/cu129

ENV VIRTUAL_ENV=/opt/vllm
ENV PATH="/opt/vllm/bin:${PATH}"
ENV HF_HOME=/workspace/.cache/huggingface
ENV HF_XET_HIGH_PERFORMANCE=1

WORKDIR /workspace

CMD ["bash"]
