import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/ui/style/colors.dart';

Widget sleepCard() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade200)],
    ),
    padding: EdgeInsets.all(12.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sleep",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.h),
        Text(
          "8h 20m",
          style: TextStyle(fontSize: 24.sp, color: AppConstants.malibu),
        ),
        SizedBox(height: 16.h),
        // Replace with a graph widget like CustomPaint or any chart library
        Center(
          child: Image.asset(
              "assets/images/Sleep-Graph.png"), // Replace with a graph
        ),
      ],
    ),
  );
}
