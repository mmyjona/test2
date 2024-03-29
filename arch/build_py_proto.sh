#!/usr/bin/env bash

#
#  Copyright 2019 The FATE Authors. All Rights Reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

BASEDIR=$(dirname "$0")/..
cd $BASEDIR



python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  basic-meta.proto

python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  storage-basic.proto

python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto --grpc_python_out=./arch/api/proto kv.proto

python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto --grpc_python_out=./arch/api/proto processor.proto

python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto --grpc_python_out=./arch/api/proto federation.proto

python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto --grpc_python_out=./arch/api/proto proxy.proto

python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto --grpc_python_out=./arch/api/proto inference_service.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto --grpc_python_out=./arch/api/proto model_service.proto

python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  feature-binning-meta.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  feature-binning-param.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  feature-selection-meta.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  feature-selection-param.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  lr-model-meta.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  lr-model-param.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  pipeline.proto

python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  feature-imputer-meta.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  feature-imputer-param.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  feature-outlier-meta.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  feature-outlier-param.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  feature-scale-meta.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  feature-scale-param.proto

python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  onehot-meta.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  onehot-param.proto

python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  data-io-meta.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  data-io-param.proto

python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  boosting-tree-model-meta.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  boosting-tree-model-param.proto


python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  model_param.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  model_meta.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  data_transform_server.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  one-vs-rest-param.proto
python -m grpc_tools.protoc -Iarch/proto --python_out=./arch/api/proto  default-empty-fill.proto
