import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartValue {
  final String time;
  final int value;
  final charts.Color barColor;

  ChartValue({required this.time, required this.value, required this.barColor});
}
