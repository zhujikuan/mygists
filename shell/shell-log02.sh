LOG_FILE="./hello.log"

function log_init() {
    # 将标准输出和标准错误都重定向到 LOG_FILE 文件中
    exec &>>${LOG_FILE}
}

function log_check() {
    # 获取文件大小，单位为KB
    size=$(du -k "$LOG_FILE" | cut -f1)

    if [ $size -gt 10 ]; then
        cp -f $LOG_FILE $LOG_FILE.bak
        echo >$LOG_FILE
    fi
}

# 格式化输出日志信息
function logger() {
    # 获取当前时间
    local TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    # 打印日志信息
    echo "[ ${TIMESTAMP} ] $1"
}

while true; do
    # 执行一些操作
    logger "hello00000000000000000"
    # 等待 1 秒钟
    sleep 1
    log_check
done
