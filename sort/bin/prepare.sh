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

bin=`dirname "$0"`
bin=`cd "$bin"; pwd`

echo "========== preparing sort data=========="
# configure
DIR=`cd $bin/../; pwd`
. "${DIR}/../bin/hibench-config.sh"
. "${DIR}/conf/configure.sh"

# path check
hadoop dfs -rmr $INPUT_HDFS

# compress check
if [ $COMPRESS -eq 1 ]; then
    COMPRESS_OPT="-D mapred.output.compress=true \
    -D mapred.output.compression.codec=$COMPRESS_CODEC \
    -D mapred.output.compression.type=BLOCK "
else
    COMPRESS_OPT="-D mapred.output.compress=false"
fi

# generate data

# generate data
$HADOOP_EXECUTABLE jar $HADOOP_EXAMPLES_JAR randomtextwriter \
   $COMPRESS_OPT \
   -D mapreduce.randomtextwriter.bytespermap=${BYTES_PER_MAP} \
   -D mapreduce.randomtextwriter.mapsperhost=${MAPS_PER_HOST} \
   $INPUT_HDFS
result=$?
if [ $result -ne 0 ]
then
    echo "ERROR: Hadoop job failed to run successfully." 
    exit $result
fi

hadoop dfs -rmr $INPUT_HDFS/_*
