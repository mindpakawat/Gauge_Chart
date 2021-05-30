import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_application_test/bar_chart.dart';
import 'package:flutter_application_test/chart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:math';
import 'dart:core';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ChartValue> data = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String msg = "0.0";
  double val = 0;
  var random = new Random();
  int n = 0;
  void randomNum() {
    setState(() {
      int rn = random.nextInt(150);
      val = rn.toDouble();
      msg = val.toString();
      String formattedDate = DateFormat.yMMMMd().format(DateTime.now());
      data.insert(
          n,
          new ChartValue(
              time: n.toString(),
              value: val.toInt(),
              barColor: charts.ColorUtil.fromDartColor(Colors.cyan)));
    });
    print(data);
    n += 1;
  }

  Widget _getGauge() {
    return SfRadialGauge(
        title: GaugeTitle(
            text: 'DEMO',
            textStyle:
                const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 50,
                color: Colors.tealAccent[400],
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 50,
                endValue: 100,
                color: Colors.deepOrange[400],
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 100,
                endValue: 150,
                color: Colors.redAccent[400],
                startWidth: 10,
                endWidth: 10)
          ], pointers: <GaugePointer>[
            NeedlePointer(value: val)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: Text(msg,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment(-1, -1),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: _getGauge(),
              ),
            ),
            Align(
              alignment: Alignment(-1, -1),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Align(
                  alignment: Alignment(0, 0),
                  child: Container(
                    width: 180,
                    height: 60,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      child: Text(" START "),
                      onPressed: () => {randomNum()},
                      color: Colors.cyan,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-1, -1),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: BarChart(
                  data: data,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
