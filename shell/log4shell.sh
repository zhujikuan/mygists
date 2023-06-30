#!/bin/bash

# 日志级别
LOG_LEVEL="DEBUG"

# 格式化输出日志信息
log() {
    # 获取当前时间
    local TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

    # 设置日志级别
    local LEVEL=$1

    # 检查日志级别是否需要输出
    if [[ "$LEVEL" == "DEBUG" && ("$LOG_LEVEL" == "INFO" || "$LOG_LEVEL" == "ERROR") ]]; then
        return
    elif [[ "$LEVEL" == "INFO" && "$LOG_LEVEL" == "ERROR" ]]; then
        return
    elif [[ "$LEVEL" == "ERROR" && "$LOG_LEVEL" == "NONE" ]]; then
        return
    fi

    # 打印日志信息
    echo "[ ${TIMESTAMP} ] [${LEVEL}] $2"
}

# DEBUG级别日志函数
log_debug() {
    log "DEBUG" "$1"
}

# INFO级别日志函数
log_info() {
    log "INFO" "$1"
}

# ERROR级别日志函数
log_err() {
    log "ERROR" "$1"
}

#------------------------------------------------------------------------
