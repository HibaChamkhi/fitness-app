import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../core/ui/style/colors.dart';

Widget caloriesCard() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade200)],
    ),
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Calories",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          "760 kCal",
          style: TextStyle(fontSize: 24, color:AppConstants.malibuApprox),
        ),
        SizedBox(height: 16),
        CircularPercentIndicator(
          radius: 60,
          lineWidth: 8,
          percent: 760 / 1000,
          center: Text("230 kCal\nleft", textAlign: TextAlign.center),
          progressColor: AppConstants.perfume,
          backgroundColor: Colors.grey.shade300,
        ),
      ],
    ),
  );
}