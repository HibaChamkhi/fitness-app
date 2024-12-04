import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/ui/style/colors.dart';

Widget waterIntakeCard() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade200)],
    ),
    padding: EdgeInsets.symmetric(vertical: 15.h),
    child: Row(
      children: [
        // Vertical Progress Bar
        Container(
          width: 40.w, // Width of the progress bar container
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Background of the bar
              Container(
                width: 20.w,
                height: 370.h, // Total height of the bar
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              // Filled portion of the bar
              Container(
                width: 20.w,
                height: 160.h,
                // Adjust this based on water intake (e.g., 4/5 of 200)
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppConstants.malibu, AppConstants.perfume],
                    // Gradient colors
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.w), // Spacing between the bar and text content

        // Text Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Water Intake",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                "4 Liters",
                style: TextStyle(fontSize: 24.sp, color: AppConstants.malibu),
              ),
              SizedBox(height: 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Real time updates",
                      style: TextStyle(
                        fontSize: 15.sp,
                      )),
                  SizedBox(height: 5),
                  timeUpdate("6am - 8am", "600ml"),
                  timeUpdate("9am - 11am", "500ml"),
                  timeUpdate("11am - 2pm", "1000ml"),
                  timeUpdate("2pm - 4pm", "700ml"),
                  timeUpdate("4pm - now", "900ml"),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget timeUpdate(String time, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(time, style: TextStyle(color: Colors.grey.shade600)),
      SizedBox(
        height: 5.h,
      ),
      Text(value, style: TextStyle(color: Colors.purple)),
      SizedBox(
        height: 15.h,
      ),
    ],
  );
}
