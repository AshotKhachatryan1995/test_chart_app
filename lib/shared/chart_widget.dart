import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test_chart_project/constants/app_colors.dart';
import 'package:test_chart_project/shared/section_title_widget.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({Key? key}) : super(key: key);

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  final List<ChartData> chartData = [
    ChartData('JAN', 270),
    ChartData('FEB', 250),
    ChartData('MAR', 480),
    ChartData('APR', 100),
    ChartData('MAY', 180),
    ChartData('JUN', 80),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SectionTitleWidget(title: 'Performance Chart'),
      SfCartesianChart(
        primaryXAxis: CategoryAxis(
            labelPlacement: LabelPlacement.onTicks,
            plotBands: chartData
                .mapIndexed((index, element) =>
                    _renderPlot(index, isSelected: index == 2))
                .toList(),
            labelStyle: const TextStyle(
                fontSize: 12, color: AppColors.rollingStoneColor),
            majorGridLines: const MajorGridLines(width: 0),
            majorTickLines: const MajorTickLines(color: Colors.transparent)),
        primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 500,
            desiredIntervals: 2,
            labelStyle: const TextStyle(
                fontSize: 12, color: AppColors.rollingStoneColor),
            majorGridLines: const MajorGridLines(width: 0),
            majorTickLines: const MajorTickLines(color: Colors.transparent)),
        plotAreaBorderWidth: 0,
        borderWidth: 0,
        series: <ChartSeries<ChartData, String>>[
          SplineSeries<ChartData, String>(
              dataSource: chartData,
              dataLabelSettings: const DataLabelSettings(color: Colors.green),
              markerSettings: const MarkerSettings(
                isVisible: true,
                borderColor: AppColors.denimColor,
                color: AppColors.denimColor,
              ),
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y),
        ],
      )
    ]);
  }

  PlotBand _renderPlot(int start, {bool isSelected = false}) {
    return PlotBand(
        isVisible: true,
        start: start,
        end: start + 1,
        color: isSelected ? AppColors.linkWaterColor : AppColors.selagoColor,
        borderColor: Colors.white,
        borderWidth: 2);
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
