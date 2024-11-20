#!/bin/bash

# chmod +x test.sh
# chmod 777 test.sh

# ./ test.sh
# bash test.sh （不需要修改文件权限）
# .test.sh

a=10  # 定义变量
k=$a  # 引用变量
echo $a # 显示变量
echo "---------" # 输出
unset a # 清除变量
read str # 从输入读取
echo "str=$str"

declare -i i 4 # int i=4
readonly m=100 # 创建只读变量

# env 查看所有环境变量
# 1临时设置变量
    VARNAME=value
    export VARNAME
# 2永久设置变量(~/.bashrc  /etc/profile)
    # vim ~/.bashrc
    # source ~/.bashrc
# 3清除环境变量 unset
# 4常用变量
    # HOME：用于保存注册目录的完全路径名。 
    # PATH：用于保存用冒号分隔的目录路径名，shell 将按 PATH 变量中给出的顺序搜索这些目录，找到的第一个与命令名称一致的可执行文件将被执行。 
            # PATH=$HOME/bin:/bin:/usr/bin;export PATH 
    # HOSTNAME：主机名 
    # SHELL：默认的 shell 命令解析器 
    # LOGNAME：此变量保存登录名 
    # PWD：当前工作目录的绝对路径名
# 5预设变量
    # $#：传给shell脚本参数的数量（不包括$0）
    # $*或$@：保存所有命令行传给shell脚本的参数的内容
    # $0：当前执行的进程名
    # $1——$9：运行脚本时传递给其的参数，用空格隔开
        # 如果超过9, 需要加大括号{} 
        # echo "\$10 = ${10}"
    # $?：命令执行后返回的状态
        # "$?"用于检查上一个命令执行是否正确
        # (在Linux中，命令退出状态为0表示该命令正确执行，任何非0值表示命令出错)。 
    # $$：当前进程的进程号
# 6引号
    "" : 变量转字符串
    '' : 变量当字符串解释
    ·· : 内容作为系统命令执行
        # echo "today is date"              #today is date
        # echo "today is `date`"            #today is sun 21
        # echo 'today is `date`'            #today is `date`
        # echo "curr directory is $(ls)"    #curr directory is export.sh
    # \转义字符  :同C语言\n\t\r\a echo命令需要加-e转义
    # (命令序列) :shell 完成，不影响当前shell的变量
    # {命令序列} :shell 完成，影响当前shell的变量
# 7条件测试语句
    # test : 用于测试字符串、文件状态和数字
        # test condition 
        # [ condition ] 注意空格
        # 文件测试
            文件类型
                -e  文件名  文件是否存在
                -s  文件名  是否为非空
                -b  文件名  块设备文件
                -c  文件名  字符设备文件
                -d  文件名  目录文件
                -f  文件名  普通文件
                -L  文件名  软链接文件
                -S  文件名  套接字文件
                -p  文件名  管道文件
            文件权限
                -r  文件名  可读
                -w  文件名  可写
                -x  文件名  可执行
            文件比较
                文件1 -nt 文件2 文件1的修改时间是否比文件2新
                文件1 -ot 文件2 文件1的修改时间是否比文件2旧
                文件1 -ef 文件2 两个文件的inode节点号是否一样，用于判断是否是硬链接
        # 字符串测试
            s1 = s2     测试两个字符串的内容是否完全一样
            s1 != s2    测试两个字符串的内容是否有差异
            -z s1       测试s1 字符串的长度是否为0
            -n s1       测试s1 字符串的长度是否不为0
        # 数字测试
            a -eq b     测试a 与b是否相等           equal
            a -ne b     测试a 与b是否不相等         not equal
            a -gt b     测试a 是否大于b             greater than
            a -ge b     测试a 是否大于等于b         greater equal
            a -lt b     测试a 是否小于b             less than
            a -le b     测试a 是否小于等于b         less equal
        # 复合测试
            命令执行控制
                command1 && command2 ,左边成功(返回0)才执行右边
                command1 || command2 ,左边失败(返回非0)才执行右边
            多重条件判定
                -a  and
                -o  or
                !   相反
# 8控制语句           
    #if语句:
        if[ 条件1 ];then 
            执行第一段程序
        elif[ 条件2 ];then
            执行第二段程序
        else
            执行第三段程序
        fi
    #case语句：
        case $变量名 in
            "第一个变量内容")
            执行第一段程序
            ;;
            "第二个变量内容")
            执行第二段程序
            ;;
            *)                  // * 为通配符
            其他程序段
            exit 1
        esac
    #for语句
        格式一:
            for((初始值;限制值;执行步阶))
            do
                程序段 
            done
        格式二:
            # var 分别赋值con1... con1可以为 ·ls·
            for var in con1 con2 con3 ...
            do
                程序段
            done 
    #while语句
        while[ condition ]
        do
            程序段
        done
    #until语句
        until[ condition ] # "$i"="101"
        do
            程序段
        done
    #break\continue
# 9shell函数
    定义
        #格式一
            函数名(){
                命令
            }
        #格式二
            function 函数名(){
                命令
            }        
    调用
        函数名 param1 param2
    传参
        用$1...
    返回值
        return 0 无错误返回
        return 1 有错误返回
        #函数的返回值一般通过$?可以获取到，但是$?获取到的最大值是255，如果超过这个值，会出错
        #在shell中，除了()中定义的变量，只要不做任何修饰，都可以认为是全局变量，可以再任意一个位置调用


