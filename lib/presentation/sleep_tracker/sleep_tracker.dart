import 'package:fitness_app/core/ui/widgets/input_field.dart';
import 'package:fitness_app/presentation/sleep_tracker/schedule_card.dart';
import 'package:fitness_app/presentation/sleep_tracker/sleep_schedule.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../core/ui/style/colors.dart';
import '../activity_tracker/activity_tracker.dart';

class SleepTrackerWidget extends StatefulWidget {
  const SleepTrackerWidget({super.key});

  @override
  State<SleepTrackerWidget> createState() => _SleepTrackerWidgetState();
}

class _SleepTrackerWidgetState extends State<SleepTrackerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 16,
                        )),
                  ),
                  const Text(
                    "Sleep Tracker",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50)),
                    child: Image.asset("assets/icons/notifSettings.png"),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      '62% increase ↑',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child:
                          CustomChart(), // Replace with your custom chart widget
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    stops: const [0.1, 0.9],
                    colors: [AppConstants.malibu, AppConstants.anakiwa],
                  ),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Last Night Sleep",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "8h 20m",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/Sleep-Graph.png",
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              _buildTodayTargetSection(),
              SizedBox(
                height: 30,
              ),
              ScheduleList()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTodayTargetSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: AppConstants.malibu.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Daily Sleep Schedule",
            style: TextStyle(fontSize: 18),
          ),
          _buildCheckButton(),
        ],
      ),
    );
  }

  Widget _buildCheckButton() {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: SleepScheduleWidget(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: const Text(
          "Check",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            stops: const [0.1, 0.9],
            colors: [AppConstants.malibu, AppConstants.anakiwa],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}

class ScheduleList extends StatelessWidget {
  const ScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today Schedule',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        Container(
          height: 200,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            children: [
              ScheduleCard(
                icon: "alarm-clock.png",
                title: 'Bedtime',
                time: '09:00pm',
                description: 'in 6 hours 22 minutes',
              ),
              const SizedBox(height: 16),
              ScheduleCard(
                icon: "bed.png",
                title: 'Alarm',
                time: '05:10am',
                description: 'in 14 hours 30 minutes',
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class CustomChart extends StatelessWidget {
  const CustomChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          drawVerticalLine: false,
          drawHorizontalLine: true,
          horizontalInterval: 2,
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}h',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey, // Adjust to match the image color
                  ),
                );
              },
              interval: 2, // Ensure consistent intervals
            ),
          ),
          topTitles: AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
                return Text(
                  days[value.toInt()],
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                );
              },
              interval: 1, // Display titles for all days
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 10,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 2),
              FlSpot(1, 4),
              FlSpot(2, 2.5),
              FlSpot(3, 6),
              FlSpot(4, 8),
              FlSpot(5, 9),
              FlSpot(6, 7),
            ],
            isCurved: true,
            color: const Color(0xFFAEDCFF), // Replace with your desired color
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFAEDCFF).withOpacity(0.3),
                  const Color(0xFFAEDCFF).withOpacity(0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
