if (POLICY CMP0048)
  cmake_policy(SET CMP0048 NEW)
endif ()

cmake_minimum_required(VERSION 3.5)

project(mcharts
  VERSION 0.0.1
  DESCRIPTION "Milo QML Charts"
  LANGUAGES CXX
)

find_package(Qt5 COMPONENTS REQUIRED Core)

set(SOURCES mcharts.qrc)

add_library(mcharts STATIC ${SOURCES})

set_target_properties(mcharts PROPERTIES LINKER_LANGUAGE CXX)

target_include_directories(mcharts
  PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

target_link_libraries(mcharts
  Qt5::Core
)

message("MCharts: missing unit test!")
#add_subdirectory(tst_mcharts)
