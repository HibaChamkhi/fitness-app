import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/style/colors.dart';
import '../../../core/ui/widgets/gradient_progress_bar.dart';

class ResultWidget extends StatefulWidget {
  final String month1;
  final String month2;

  const ResultWidget({required this.month1, required this.month2, Key? key})
      : super(key: key);

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  bool isPhotoSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 25),
            _buildSelectionButtons(),
            SizedBox(height: 15),
            isPhotoSelected
                ? _buildPhotoSection()
                : FitnessAnalytics(
                    month1: widget.month1,
                    month2: widget.month2,
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          stops: [0.1, 0.9],
          colors: [
            AppConstants.malibu,
            AppConstants.anakiwa,
          ],
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: Text(
          "Go Back Home",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIconButton(
          icon: Icons.arrow_back_ios_rounded,
          onTap: () => Navigator.pop(context),
        ),
        const Text(
          "Result",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        _buildIconButton(
          iconPath: "assets/icons/notifSettings.png",
        ),
      ],
    );
  }

  Widget _buildIconButton(
      {IconData? icon, String? iconPath, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: icon != null
            ? Icon(icon, size: 16)
            : Image.asset(iconPath!, width: 20),
      ),
    );
  }

  Widget _buildSelectionButtons() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[300]?.withOpacity(0.3),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        children: [
          _buildSelectionButton(
            label: 'Photo',
            isSelected: isPhotoSelected,
            onTap: () => setState(() => isPhotoSelected = true),
          ),
          _buildSelectionButton(
            label: 'Statistic',
            isSelected: !isPhotoSelected,
            onTap: () => setState(() => isPhotoSelected = false),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
                    begin: Alignment.centerLeft,
                    stops: [0.1, 0.9],
                    colors: [AppConstants.malibu, AppConstants.anakiwa],
                  )
                : null,
            borderRadius: BorderRadius.circular(90),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoSection() {
    return Column(
      children: [
        _buildProgressSection(),
        _buildImageSection(title: "Front Facing"),
        _buildImageSection(title: "Back Facing"),
        _buildImageSection(title: "Left Facing"),
        _buildImageSection(title: "Right Facing"),
      ],
    );
  }

  Widget _buildProgressSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Average Progress",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            Text(
              "Good",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                color: Colors.green,
              ),
            ),
          ],
        ),
        GradientProgressBar(percentage: 62, colors: [
          AppConstants.perfume,
          AppConstants.perfumeApprox,
          AppConstants.malibu,
        ], barColor: Colors.grey[300]!.withOpacity(0.3),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.month1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: AppConstants.empress,
              ),
            ),
            Text(
              widget.month2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: AppConstants.empress,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImageSection({required String title}) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: AppConstants.empress,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(2, (_) => _buildImageThumbnail())
                .expand((w) => [w, SizedBox(width: 16)])
                .toList()
              ..removeLast(),
          ),
        ],
      ),
    );
  }

  Widget _buildImageThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/images/FrontFacing1.png",
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}



class FitnessAnalytics extends StatelessWidget {
  final String month1;
  final String month2;

  const FitnessAnalytics({required this.month1, required this.month2, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            // Chart Section
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
            const SizedBox(height: 32),
            // Data Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  month1,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  month2,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Progress Bars
            ProgressRow(label: 'Lose Weight', mayPercent: 33, junePercent: 67),
            ProgressRow(
                label: 'Height Increase', mayPercent: 88, junePercent: 12),
            ProgressRow(
                label: 'Muscle Mass Increase', mayPercent: 57, junePercent: 43),
            ProgressRow(label: 'Abs', mayPercent: 89, junePercent: 11),
          ],
        ),
      ),
    );
  }
}

class ProgressRow extends StatelessWidget {
  final String label;
  final int mayPercent;
  final int junePercent;

  const ProgressRow({
    super.key,
    required this.label,
    required this.mayPercent,
    required this.junePercent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('$mayPercent%',
                  style: TextStyle(color: Colors.red.shade300)),
              const SizedBox(width: 8),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: mayPercent / 100,
                      child: Container(
                        height: 10,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            stops: [0.1, 0.9],
                            colors: [
                              AppConstants.malibu,
                              AppConstants.anakiwa,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text('$junePercent%',
                  style: TextStyle(color: Colors.blue.shade300)),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomChart extends StatelessWidget {
  const CustomChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(drawVerticalLine: false, drawHorizontalLine: true,horizontalInterval: 10),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(),
          // rightTitles: AxisTitles(),
          topTitles: AxisTitles(), // leftTitles: AxisTitles(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const months = [
                  'Jan',
                  'Feb',
                  'Mar',
                  'Apr',
                  'May',
                  'Jun',
                  'Jul'
                ];
                return Text(
                  months[value.toInt()],
                  // style:  TextStyle(fontSize: 12, color: Colors.grey) ,
                );
              },
              // interval: 1,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 100,
        lineBarsData: [
          // First Line
          LineChartBarData(
            spots: const [
              FlSpot(0, 20),
              FlSpot(1, 40),
              FlSpot(2, 25),
              FlSpot(3, 60),
              FlSpot(4, 80),
              FlSpot(5, 90),
              FlSpot(6, 70),
            ],
            isCurved: true,
            color: AppConstants.anakiwa,
            // dotData: FlDotData(show: true),
            // belowBarData: BarAreaData(show: false),
          ),
          // Second Line
          LineChartBarData(
            spots: const [
              FlSpot(0, 30),
              FlSpot(1, 20),
              FlSpot(2, 50),
              FlSpot(3, 40),
              FlSpot(4, 60),
              FlSpot(5, 50),
              FlSpot(6, 30),
            ],
            isCurved: true,
            color: Colors.red.withOpacity(0.3),
            // dotData: FlDotData(show: true),
            // belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
