
project(mcharts
  VERSION 0.0.1
  DESCRIPTION "Milo QML Charts"
  LANGUAGES CXX
)

find_package(Qt5 COMPONENTS REQUIRED Core)

set(SOURCES mcharts.qrc)

add_library(mcharts OBJECT ${SOURCES})

target_include_directories(mcharts
  PUBLIC
  $<INSTALL_INTERFACE:include>
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

target_link_libraries(mcharts
  Qt5::Core
)

message("MCharts: missing unit test!")
#add_subdirectory(tst_mcharts)
