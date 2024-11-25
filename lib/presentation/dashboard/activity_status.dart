import 'dart:math';
import 'dart:ui';

import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SensorValue {
  final DateTime time;
  final double value;

  SensorValue(this.time, this.value);
}

class ChartComp extends StatelessWidget {
  final List<SensorValue> allData;

  const ChartComp({Key? key, required this.allData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
        [
          charts.Series<SensorValue, DateTime>(
            id: 'Values',
            colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xFF92A3FD)),
            domainFn: (SensorValue values, _) => values.time,
            measureFn: (SensorValue values, _) => values.value,
            data: allData,
          )
        ],
        animate: false,
        dateTimeFactory: const charts.LocalDateTimeFactory(),
        primaryMeasureAxis: const charts.NumericAxisSpec(
          tickProviderSpec:
          charts.BasicNumericTickProviderSpec(zeroBound: false),

        ),
        behaviors: [
          charts.ChartTitle('Time',
              behaviorPosition: charts.BehaviorPosition.bottom,
              titleStyleSpec: const charts.TextStyleSpec(fontSize: 14),
              titleOutsideJustification:
              charts.OutsideJustification.middleDrawArea),
          charts.ChartTitle('Beat',
              behaviorPosition: charts.BehaviorPosition.start,
              titleStyleSpec: const charts.TextStyleSpec(
                fontSize: 14,
              ),
              titleOutsideJustification:
              charts.OutsideJustification.middleDrawArea)
        ],
        domainAxis: const charts.DateTimeAxisSpec());
  }
}

List<SensorValue> generateRandomData(int count) {
  final List<SensorValue> randomData = [];
  final now = DateTime.now();
  final random = Random();

  for (int i = 0; i < count; i++) {
    randomData.add(
      SensorValue(
        now.subtract(Duration(minutes: count - i)), // Timestamps spaced 1 minute apart
        50 + random.nextDouble() * 50, // Random values between 50 and 100
      ),
    );
  }

  return randomData;
}
