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

bin=`dirname "$0"`
bin=`cd "$bin"; pwd`

echo "========== preparing wordcount data=========="
# configure
DIR=`cd $bin/../; pwd`
. "${DIR}/../bin/hibench-config.sh"
. "${DIR}/conf/configure.sh"

# compress check
if [ $COMPRESS -eq 1 ]; then
    COMPRESS_OPT="-D mapred.output.compress=true \
    -D mapred.output.compression.codec=$COMPRESS_CODEC \
    -D mapred.output.compression.type=BLOCK "
else
    COMPRESS_OPT="-D mapred.output.compress=false"
fi

# path check
#hadoop jar ${DATATOOLS}  org.apache.hadoop.fs.TestDFSIO   -clean
#echo "hello world"
# generate data
#echo ${DATA_TOOLS}
#hadoop org.apache.hadoop.fs.TestDFSIO -write \
 hadoop jar ${DATATOOLS}  org.apache.hadoop.fs.CopyOfTestDFSIO -write \
-nrFiles ${NUM_FILES} \
-fileSize ${FILE_SIZE} \
 -resFile ${RES_FILE} \
-D file.blocksize=${BLOCK_SIZE} \
-D file.replication=${REPLICATION} \
-D dfs.replication=${REPLICATION}


