set(BIN_NAME M2_Theme)

#寻找源码
file(GLOB_RECURSE  PROJECT_SOURCES  RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}  LIST_DIRECTORIES false 
        ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp 
        ${CMAKE_CURRENT_SOURCE_DIR}/*.h
    )

# 把qml加入工程源码
LIST(APPEND PROJECT_SOURCES "qml/qml.qrc")
LIST(APPEND PROJECT_SOURCES "assets/assets.qrc")

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(M1_Theme
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )
# Define target properties for Android with Qt 6 as:
#    set_property(TARGET Starter7 APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR
#                 ${CMAKE_CURRENT_SOURCE_DIR}/android)
# For more information, see https://doc.qt.io/qt-6/qt-add-executable.html#target-creation
    qt_create_translation(QM_FILES ${CMAKE_SOURCE_DIR} ${TS_FILES})
else()
    if(ANDROID)
        add_library(${BIN_NAME} SHARED
        ${PROJECT_SOURCES}
        )
# Define properties for Android with Qt 5 after find_package() calls as:
    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
    else()
        # 这里如果不加WIN32，会导致编译的可执行文件运行时候会同时弹出一个命令行终端
        # 这是Windows的特性，对于其它平台得去掉WIN32
        add_executable(${BIN_NAME})
        target_sources(${BIN_NAME} PRIVATE ${PROJECT_SOURCES})

    endif()

    qt5_create_translation(QM_FILES ${CMAKE_SOURCE_DIR} ${TS_FILES})
endif()

# cmake本身有四种编译模式：`Debug`, `Release`, `RelWithDebInfo`, `MinSizeRel`
# 此操作将`Debug`和`RelWithDebInfo`归类于QML的debug，即这两种模式下QML运行会保留debug信息
target_compile_definitions(M2_Theme
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

# 链接库到当前项目
# PRIVATE：项目私有内部链接，只有在开发Library对外公开时候才会使用PUBLIC
target_link_libraries(${BIN_NAME} PRIVATE
  Qt${QT_VERSION_MAJOR}::Core 
  Qt${QT_VERSION_MAJOR}::Quick
  Qt${QT_VERSION_MAJOR}::Qml
  Qt${QT_VERSION_MAJOR}::QuickControls2

  )

set_target_properties(${BIN_NAME} PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

if(QT_VERSION_MAJOR EQUAL 6)
    qt_import_qml_plugins(${CMAKE_CURRENT_SOURCE_DIR})
    qt_finalize_executable(${CMAKE_CURRENT_SOURCE_DIR})
endif()
