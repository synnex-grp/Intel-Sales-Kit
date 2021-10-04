# Copyright (C) 2019-2021 Intel Corporation
# SPDX-License-Identifier: Apache-2.0
FROM openvino/ubuntu20_data_runtime:2021.4_tgl AS base

USER openvino
WORKDIR /opt/intel/openvino_2021.4.582
SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

ARG patch_url
ADD ${patch_url} /opt/intel

ARG models_url
ADD ${models_url} /opt/intel

# setup Python
ENV PYTHON_VER python3.8
RUN ${PYTHON_VER} -m pip install --no-cache-dir -r ${INTEL_OPENVINO_DIR}/python/${PYTHON_VER}/requirements.txt && \
    ${PYTHON_VER} -m pip install --no-cache-dir -r ${INTEL_OPENVINO_DIR}/deployment_tools/tools/benchmark_tool/requirements.txt;

ADD 2021.4_ESH/smartcity_demo.sh /home/openvino
ADD 2021.4_ESH/SYNNEX_demokit.tar.xz /home/openvino
ADD 2021.4_ESH/action_recognition.sh /home/openvino
ADD 2021.4_ESH/vehicle_pedestrian_tracking.sh /home/openvino
ADD 2021.4_ESH/human_pose_estimation.sh /home/openvino

CMD ["/bin/bash"]
