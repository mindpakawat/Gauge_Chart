import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_application_test/chart.dart';

class BarChart extends StatelessWidget {
  final List<ChartValue> data;

  BarChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartValue, String>> series = [
      charts.Series(
          id: "value",
          data: data,
          domainFn: (ChartValue series, _) => series.time,
          measureFn: (ChartValue series, _) => series.value,
          colorFn: (ChartValue series, _) => series.barColor)
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
