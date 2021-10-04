# Intel-Sales-Kit
SYNNEX Intel AI Sales Kit pre-install Intel OpenVINO Toolkits, it helps you to run the demos and benchmark your device in a easy way on docker.

# Build

'''sh
docker build --build-arg models_url=openvino_models.tgz --build-arg patch_url=2021.4_ESH/openvino_2021.4.582_saleskit.tgz -t tgl_saleskit:2021.4_tgl -f dockerfiles/synnex_openvino_2021.4_esh.dockerfile .
'''