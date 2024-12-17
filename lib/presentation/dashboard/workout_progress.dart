import 'package:fitness_app/core/ui/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutProgress extends StatefulWidget {
  const WorkoutProgress({super.key, required this.text});
  final String text ;

  @override
  _WorkoutProgressState createState() => _WorkoutProgressState();
}

class _WorkoutProgressState extends State<WorkoutProgress> {
  // Track the selected view (weekly, monthly, or yearly)
  String selectedPeriod = 'Weekly';

  // Sample data for each period
  Map<String, List<FlSpot>> chartData = {
    'Weekly': [
      FlSpot(0, 20), // Sunday
      FlSpot(1, 40), // Monday
      FlSpot(2, 60), // Tuesday
      FlSpot(3, 80), // Wednesday
      FlSpot(4, 50), // Thursday
      FlSpot(5, 90), // Friday
      FlSpot(6, 40), // Saturday
    ],
    'Monthly': [
      FlSpot(0, 30), // January
      FlSpot(1, 50), // February
      FlSpot(2, 70), // March
      FlSpot(3, 60), // April
      FlSpot(4, 40), // May
      FlSpot(5, 80), // June
      FlSpot(6, 90), // July
      FlSpot(7, 65), // August
      FlSpot(8, 75), // September
      FlSpot(9, 50), // October
      FlSpot(10, 80), // November
      FlSpot(11, 85), // December
    ],
    'Yearly': [
      FlSpot(0, 25), // Year 1
      FlSpot(1, 50), // Year 2
      FlSpot(2, 40), // Year 3
      FlSpot(3, 60), // Year 4
      FlSpot(4, 55), // Year 5
      FlSpot(5, 70), // Year 6
      FlSpot(6, 80), // Year 7
      FlSpot(7, 90), // Year 8
      FlSpot(8, 85), // Year 9
      FlSpot(9, 75), // Year 10
      FlSpot(10, 80), // Year 11
      FlSpot(11, 65), // Year 12
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              widget.text,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  stops: [0.1, 0.9],
                  colors: [AppConstants.malibu, AppConstants.anakiwa],
                ),
              ),
              child: DropdownButton<String>(
                value: selectedPeriod,
                icon: Icon(Icons.arrow_drop_down_sharp, color: Colors.white),
                dropdownColor: AppConstants.malibu, // Sets the inside of the dropdown to blue
                elevation: 16,
                underline: SizedBox(), // Removes the underline
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPeriod = newValue!;
                  });
                },
                items: <String>['Weekly', 'Monthly', 'Yearly']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.white,fontSize: 12.sp), // Text color inside dropdown
                    ),
                  );
                }).toList(),
              ),
            ),

          ],
        ),
        SizedBox(height: 16),

        // Line Chart
        Expanded(
          child: LineChart(
            LineChartData(
              // gridData: FlGridData(show: false),
              borderData: FlBorderData(
                border: Border.all(color: Colors.transparent),
              ),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false, // Disable the left titles
                  ),
                ),
                topTitles: AxisTitles(),
                rightTitles: AxisTitles(
                  // Add right titles for percentages
                  axisNameSize: 9,
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      return Text(
                        "${value.toInt()}%",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  axisNameSize: 9,
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, _) {
                      List<String> labels;
                      if (selectedPeriod == 'Weekly') {
                        labels = [
                          "Sun",
                          "Mon",
                          "Tue",
                          "Wed",
                          "Thu",
                          "Fri",
                          "Sat"
                        ];
                      } else if (selectedPeriod == 'Monthly') {
                        labels = List.generate(12, (index) => "M${index + 1}");
                      } else {
                        labels = List.generate(12, (index) => "Y${index + 1}");
                      }
                      return Text(
                        labels[value.toInt()],
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      );
                    },
                  ),
                ),
              ),
              lineBarsData: [
                // Line for Progress
                LineChartBarData(
                  spots: chartData[selectedPeriod]!,
                  isCurved: true,
                  barWidth: 3,
                  dotData: FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.transparent],
                    ),
                  ),
                ),
                // Line for another metric (optional)
                LineChartBarData(
                  spots: chartData[selectedPeriod]!,
                  isCurved: true,
                  gradient: LinearGradient(
                    colors: [AppConstants.malibu, AppConstants.anakiwa],
                  ),
                  barWidth: 3,
                  dotData: FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        AppConstants.malibu.withOpacity(0.2),
                        Colors.transparent
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Tooltip Section (Placeholder)
        SizedBox(height: 16),
        // Container(
        //   width: double.infinity,
        //   padding: EdgeInsets.all(12),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(16),
        //     boxShadow: [
        //       BoxShadow(
        //         blurRadius: 10,
        //         color: Colors.grey.shade200,
        //       ),
        //     ],
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text("Fri, 28 May",
        //               style: TextStyle(color: Colors.grey, fontSize: 14)),
        //           SizedBox(height: 4),
        //           Text("Upperbody Workout",
        //               style: TextStyle(
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.bold,
        //               )),
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           Text("90% ↑",
        //               style: TextStyle(color: Colors.green, fontSize: 14)),
        //           SizedBox(height: 4),
        //           Container(
        //             width: 100,
        //             height: 8,
        //             decoration: BoxDecoration(
        //               color: Colors.grey.shade300,
        //               borderRadius: BorderRadius.circular(4),
        //             ),
        //             child: FractionallySizedBox(
        //               widthFactor: 0.9,
        //               alignment: Alignment.centerLeft,
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                   color: Colors.purple,
        //                   borderRadius: BorderRadius.circular(4),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
