#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -u 

COMPRESS=0
COMPRESS_CODEC=$COMPRESS_CODEC_GLOBAL

 

if [ $COMPRESS -eq 1 ]; then
    INPUT_HDFS=${INPUT_HDFS}-comp
    OUTPUT_HDFS=${OUTPUT_HDFS}-comp
fi


#50个文件，50个map
NUM_FILES=5
#每个文件1GB
FILE_SIZE=1GB
#分块大小
#BLOCK_SIZE=67108864表示64MB
BLOCK_SIZE=67108864
#副本数
REPLICATION=2
#结果保存位置（本机上）
RES_FILE=/home/ptmind/benchmark/TestDFSIO_results.log

