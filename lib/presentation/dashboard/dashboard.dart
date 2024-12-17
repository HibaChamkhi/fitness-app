import 'dart:math';
import 'package:fitness_app/presentation/notification/widgets/notfication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitness_app/core/ui/style/colors.dart';
import 'package:fitness_app/presentation/dashboard/sleep_card.dart';
import 'package:fitness_app/presentation/dashboard/water_intake_card.dart';
import 'package:fitness_app/presentation/dashboard/workout_item.dart';
import 'package:fitness_app/presentation/dashboard/workout_progress.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../activity_tracker/activity_tracker.dart';
import 'activity_status.dart';
import 'calories_card.dart';
import 'circular_chart.dart';
import 'gradient_progress_bar.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final List<SensorValue> _data = generateRandomData(30);
  final _chartKey = GlobalKey();
  final List<Workout> workouts = [
    Workout(
      imagePath: "assets/images/Workout-Pic1.png",
      title: "Fullbody Workout",
      subtitle: "180 Calories Burn | 20 minutes",
      progress: 0.5,
    ),
    Workout(
      imagePath: "assets/images/Workout-Pic2.png",
      title: "Morning Yoga",
      subtitle: "120 Calories Burn | 30 minutes",
      progress: 0.7,
    ),
    Workout(
      imagePath: "assets/images/Workout-Pic3.png",
      title: "HIIT Session",
      subtitle: "250 Calories Burn | 15 minutes",
      progress: 0.8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 25),
              _buildBMISection(),
              const SizedBox(height: 25),
              _buildTodayTargetSection(),
              const SizedBox(height: 25),
              _buildActivityStatus(),
              const SizedBox(height: 25),
              _buildChart(),
              const SizedBox(height: 25),
              _buildCards(),
              const SizedBox(height: 25),
              _buildWorkoutProgress(),
              _buildLatestWorkout(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back,",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              "Hiba Chamkhi",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: NotificationWidget(),
              withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          child: SvgPicture.asset(
            "assets/icons/Notification.svg",
            fit: BoxFit.scaleDown,
            height: 45,
          ),
        ),
      ],
    );
  }

  Widget _buildBMISection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          stops: [0.1, 0.9],
          colors: [AppConstants.malibu, AppConstants.anakiwa],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "BMI (Body Mass Index)",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "You have a normal weight",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              _buildViewMoreButton(),
            ],
          ),
          CircularChartWidget(percentage: 21.5),
        ],
      ),
    );
  }

  Widget _buildViewMoreButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: const Text(
        "View More",
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          stops: [0.1, 0.9],
          colors: [AppConstants.perfume, AppConstants.kobi],
        ),
        borderRadius: BorderRadius.circular(50),
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
            "Today Target",
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
          screen: ActivityTrackerWidget(),
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
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            stops: [0.1, 0.9],
            colors: [AppConstants.malibu, AppConstants.anakiwa],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Widget _buildActivityStatus() {
    return const Text(
      "Activity Status",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildChart() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: AppConstants.malibu.withOpacity(0.2),
      ),
      child: RepaintBoundary(
        key: _chartKey,
        child: ChartComp(allData: _data),
      ),
    );
  }

  Widget _buildCards() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width.w * 0.40,
          child: waterIntakeCard(),
        ),
        SizedBox(
          height: 350.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 150.w,
                child: sleepCard(), // Removed Expanded
              ),
              SizedBox(height: 16.h), // Changed from `width` to `height`
              SizedBox(
                width: 150.w,
                child: caloriesCard(), // Removed Expanded
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWorkoutProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 400, child: const WorkoutProgress(text: "Workout Progress",)),
      ],
    );
  }

  Widget _buildLatestWorkout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Latest Workout",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "See more",
              style: TextStyle(
                fontSize: 18,
                color: AppConstants.grayChateau,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              final workout = workouts[index];
              return WorkoutItem(workout: workout);
            },
          ),
        ),
      ],
    );
  }
}
