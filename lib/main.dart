import 'package:flutter/material.dart';
// import 'package:flutter_gauge/flutter_gauge.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter_application_test/home.dart';

void main() {
  return runApp(GaugeApp());
}

/// Represents the GaugeApp class
class GaugeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guage with chart demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
