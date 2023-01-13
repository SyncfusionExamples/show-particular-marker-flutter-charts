import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MarkerAtSinglePoint(),
    );
  }
}

/// Renders the default line chart sample.
class MarkerAtSinglePoint extends StatefulWidget {
  /// Creates the default line chart sample.
  // ignore: use_key_in_widget_constructors
  const MarkerAtSinglePoint();

  @override
  MarkerAtSinglePointState createState() => MarkerAtSinglePointState();
}

/// State class of the default area chart.
class MarkerAtSinglePointState extends State<MarkerAtSinglePoint> {
  MarkerAtSinglePointState();
  List<ChartSampleData>? chartData;

  @override
  void initState() {
    chartData = <ChartSampleData>[
      ChartSampleData(x: 0, y: 10),
      ChartSampleData(x: 1, y: 25),
      ChartSampleData(x: 2, y: 30),
      ChartSampleData(x: 3, y: 45),
      ChartSampleData(x: 4, y: 35),
      ChartSampleData(x: 5, y: 50),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        onMarkerRender: (MarkerRenderArgs args) {
          if (!(args.pointIndex == 3)) {
            args.markerHeight = 0.0;
            args.markerWidth = 0.0;
          }
        },
        series: <ChartSeries<ChartSampleData, double>>[
          LineSeries<ChartSampleData, double>(
            markerSettings: const MarkerSettings(isVisible: true),
            dataSource: chartData!,
            xValueMapper: (ChartSampleData sales, _) => sales.x,
            yValueMapper: (ChartSampleData sales, _) => sales.y,
          ),
        ]);
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}

///Chart sample data
class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData({
    this.x,
    this.y,
  });

  /// Holds x value of the datapoint
  final double? x;

  /// Holds y value of the datapoint
  final double? y;
}
