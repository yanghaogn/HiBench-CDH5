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

# paths
INPUT_HDFS=/benchmarks/Terasort/Input
OUTPUT_HDFS=/benchmarks/Terasort/Output

# for prepare (total) - 100G
#共产生DATASIZE行数据，每行数据100字节
DATASIZE=1000000000
#NUM_MAPS=180
NUM_MAPS=35

# for running (total)
NUM_REDS=35

