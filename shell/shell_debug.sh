#!/bin/bash

# 将输出重定向到文件，用于保存所有输出到日志文件



# 重定向标准错误到指定文件
exec 2>>/debug_507.log
exec 1>>/debug_507.log
set -x
# 标准输出
echo "hello world 标准输出"
# 标准错误
echo "hello world 标准错误" >&2
