import 'dart:math';

import 'package:fitness_app/core/ui/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'activity_status.dart';
import 'circular_chart.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final List<SensorValue> _data = generateRandomData(30);
  final _chartKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back,",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Hiba Chamkhi",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    "assets/icons/Notification.svg",
                    fit: BoxFit.scaleDown,
                    height: 45,
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          AppConstants.malibu,
                          AppConstants.anakiwa,
                        ]),
                    borderRadius: BorderRadius.circular(22)),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "BMI (Body Mass Index)",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "You have a normal weight",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Text("View More",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white)),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  stops: [
                                    0.1,
                                    0.9
                                  ],
                                  colors: [
                                    AppConstants.perfume,
                                    AppConstants.kobi,
                                  ]),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ],
                    ),
                    CircularChartWidget(
                      percentage: 21.5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                    color: AppConstants.malibu.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today Target",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: Text("Check",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              stops: [
                                0.1,
                                0.9
                              ],
                              colors: [
                                AppConstants.malibu,
                                AppConstants.anakiwa,
                              ]),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Activity Status",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 500,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppConstants.malibu.withOpacity(0.2),
                  ),
                  child: RepaintBoundary(
                      key: _chartKey, child: ChartComp(allData: _data)),
                )
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Workout Progress",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "Latest Workout",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
