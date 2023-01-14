# Qt对cmake版本的最小要求（但测试发现低一点的版本似乎也没问题）
cmake_minimum_required(VERSION 3.16)

# 项目命名
# VERSION 1.0.0 LANGUAGES CXX: 是可选的
project(${CMAKE_CURRENT_SOURCE_DIR} VERSION 1.0.0 LANGUAGES CXX)

# 如果采用非Qt Creator开发，需要通过告知Qt的安装路径，建议把Qt的安装路径设置到环境变量
# 例如：QT_DIR=D:\Qt\6.1.2\msvc2019_64
# 加入系统Path里也行
set(QT_DIR "D:/Development/QT/5.15.2/mingw81_64")
set(CMAKE_PREFIX_PATH $ENV{QT_DIR})

# 有些项目会动态生成头文件，项目中需要引入它，因此需要将output目录也include进来
# 等同于INCLUDE_DIRECTORY(${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR})
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Qt特有的编译器需要打开，默认是关闭的
set(CMAKE_AUTOUIC ON)   # User Interface Compiler
set(CMAKE_AUTOMOC ON)   # Meta-Object Compiler
set(CMAKE_AUTORCC ON)   # Resource Compiler

# Qt6 对C++版本推荐至少17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 寻找Qt的库
# Qt6 COMPONENTS Widgets：寻找Qt库中的Widget模块
# REQUIRED： 意味着找不到报错并不会继续下去
find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Quick LinguistTools)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick LinguistTools)

# 指定输出路径
SET(OUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/bin)
# 如果输入路径不存在，则创建
if (NOT EXISTS ${OUT_PATH})
    file(MAKE_DIRECTORY ${OUT_PATH})
endif ()

# 指定执行文件目录，指定Lib文件目录
SET(EXECUTABLE_OUTPUT_PATH ${OUT_PATH})
SET(LIBRARY_OUTPUT_PATH ${OUT_PATH})

# 指定 自定模块目录
set(QML_IMPORT_PATH ${OUT_PATH})

# 子项目
#add_subdirectory(Starter5)
#add_subdirectory(P18_Signal)
add_subdirectory(P20_QmlAndC++)


