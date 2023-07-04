#!/bin/bash

# 让脚本单例模式，来自stackoverflow

SINGLETON_LOCK_FILE=/tmp/${0##*/}.lck
SINGLETON_WAITA_TIME=12

get_singleton_lock() {
    # 尝试以独占模式打开锁文件
    exec 20>${SINGLETON_LOCK_FILE}
    if flock -n 20; then
        # 锁定成功，继续执行脚本
        echo "get lock, Running..."
        # 设置信号捕获，当脚本异常退出时，自动释放锁文件
        trap "flock -u 20; exit 1" EXIT
        return
    else
        # 锁定失败，说明脚本正在运行中，退出脚本
        echo "get lock failed, Another instance is already running. Exiting."
        if [ "$1" == "second" ]; then
            exit 1
        fi
        echo "wait ${SINGLETON_WAITA_TIME}s, retry!!"
        sleep ${SINGLETON_WAITA_TIME}
        get_singleton_lock "second"
    fi

}

release_singleton_lock() {
    # 执行完毕，释放锁文件
    flock -u 20
}

get_singleton_lock
# sleep 10

release_singleton_lock





