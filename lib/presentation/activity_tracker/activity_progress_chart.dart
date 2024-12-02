import 'package:fitness_app/core/ui/style/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityTrackerScreen extends StatefulWidget {
  const ActivityTrackerScreen({super.key});

  @override
  _ActivityTrackerScreenState createState() => _ActivityTrackerScreenState();
}

class _ActivityTrackerScreenState extends State<ActivityTrackerScreen> {
  bool isWeekly = true; // Tracks whether "Weekly" or "Monthly" is selected
  final Random random = Random(); // Random generator

  // Function to generate random data
  List<double> generateRandomData(int items, double maxValue) {
    return List.generate(items, (_) => random.nextDouble() * maxValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Activity Progress',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    stops: [0.1, 0.9],
                    colors: [AppConstants.malibu, AppConstants.anakiwa],
                  ),
                ),
                child: DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down_sharp, color: Colors.white),
                  dropdownColor: AppConstants.malibu, // Sets the inside of the dropdown to blue
                  elevation: 12,
                  underline: SizedBox(),
                  value: isWeekly ? 'Weekly' : 'Monthly',
                  items: ['Weekly', 'Monthly']
                      .map(
                        (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e  ,style: TextStyle(color: Colors.white), ),
                    ),
                  )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      isWeekly = value == 'Weekly';
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 200, // Set chart height to 200 pixels
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color for the container
                borderRadius: BorderRadius.circular(8), // Optional rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    blurRadius: 5, // Blur radius
                    spreadRadius: 1, // Spread radius
                    offset: Offset(0, 4), // Offset in x and y directions
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0), // Add some padding inside the container
                child: ActivityProgressChart(
                  isWeekly: isWeekly,
                  randomData: generateRandomData(
                    isWeekly ? 7 : 12,
                    100, // Maximum value for the bar
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class ActivityProgressChart extends StatelessWidget {
  final bool isWeekly;
  final List<double> randomData;

  const ActivityProgressChart({
    Key? key,
    required this.isWeekly,
    required this.randomData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labels = isWeekly
        ? ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
        : ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

    return BarChart(
      BarChartData(
        maxY: 100, // Adjust max value as needed
        barGroups: randomData
            .asMap()
            .entries
            .map(
              (entry) {
            final isPerfume = entry.key % 2 == 0; // Alternate red and blue based on index
            return BarChartGroupData(
              x: entry.key,
              barRods: [
                BarChartRodData(
                  toY: entry.value,
                  color: isPerfume ? AppConstants.perfume : AppConstants.malibu, // Alternate colors
                  width: 12,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            );
          },
        )
            .toList(),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= labels.length) return SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    labels[index],
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                );
              },
            ),
          ),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (group) {
              return Colors.black.withOpacity(0.7); // Set the tooltip background color here
            },
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '${labels[group.x.toInt()]}\n${rod.toY.toStringAsFixed(1)}',
                TextStyle(color: Colors.white),
              );
            },
          ),


        ),
      ),
    );
  }
}
