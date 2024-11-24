# **Makefile**

#### 基本语法

```makefile
.PHONY: clean//对clean的声明，不会因为有clean文件影响make clean

CFLAGS = -Wall -g -O2 //编译命令选项 

all: hello world//生成多个可执行文件
	echo “all done”//命令行

target: dependencies
	命令行

伪target: //clean all
	命令行
```

####  样例

```makefile
.PHONY: clean all
all: hello world
	echo “all done”

hello world: main.o message.o
	gcc -main.o message.o -o $@//自动变量
main.o: main.c
	gcc $(CFLAGS) -c main.c
message.o: message.c
	gcc -c message.c

clean:
	rm -f *.o hello
```

#### 自动变量

​    $@ 目标文件

​    $< 第一个依赖文件

​    $^ 所有依赖文件

#### 通配符

​    %.c %.o

#### makefile 的参数

​	-f 指定makefile 的名字

​	-n 打印makefile要执行的命令，不真正执行

​	-C 指定makefile要执行的目录

# CMake

CMakeLists.txt文件

#### 基本语法

```cmake
cmake_minimum_required (version 3.10)//CMake最低版本名字

project(项目名)

set(SOURCES 源文件)

add_executable(可执行文件名 ${SOURCES})//生成可执行文件的命令
```



#### CMake 的参数

​	-S 指定源文件目录

​	-B 指定生成目录