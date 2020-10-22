MCharts
===

[Online documentation](https://docs.milosolutions.com/milo-code-db/mcharts)

[Source code](https://github.com/milosolutions/mcharts)

![MCharts on Android](doc/img/QmlChartsAndroidExample.png "MCharts at work")

# Getting Started

MChart implements some simple yet meaningful and eye friendly charts to display data. It's based on [ChartJs2QML](https://github.com/MichaelVoelkel/ChartJs2QML.git): QML Bindings for Chart.js.

# How to use

1. Close this repository.
2. Run `git submodule update --init --recursive` to check out and initialize
ChartJs2QML subproject.
3. Add `mcharts.pri` into your `qmake` project or use `add_subdirectory` to add
`MCharts` to your `CMake` project.
4. Prepare a class that will provide data for MChart. For more information you
can look at provided examples.
5. Compile and enjoy.

For example usage, see the examples. This project is fully documented - please
check doxygen docs or see the comments directly in the source file(s).

# License

This project is licensed under the MIT license - see the LICENSE-MiloCodeDB.txt file for details. The giants on whose shoulders it is based - ChartJs2QML
and Chart.js are both available under MIT license as well.

# Gallery

Here are some examples showing barcode scanner:

<img src="QmlChartsGoldPriceHistory.png" alt="Charts running on Ubuntu desktop" style="width: 650px;"/>
Charts running on Ubuntu desktop


<img src="QmlChartsWindowsDoughnutExample.png" alt="Doughnut chart on Windows" style="width: 650px;"/>
Doughnut chart on Windows


<img src="QmlChartsWindowsPieExample.png" alt="Pie chart on Windows" style="width: 650px;"/>
Pie chart on Windows


<img src="QmlChartsWindowsPolarExample.png" alt="Polar chart on Windows" style="width: 650px;"/>
Polar chart on Windows
