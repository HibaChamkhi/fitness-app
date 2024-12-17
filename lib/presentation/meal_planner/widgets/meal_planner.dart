import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../core/ui/style/colors.dart';
import '../../dashboard/workout_progress.dart';

class MealPlannerWidget extends StatefulWidget {
  const MealPlannerWidget({super.key});

  @override
  State<MealPlannerWidget> createState() => _MealPlannerWidgetState();
}

class _MealPlannerWidgetState extends State<MealPlannerWidget> {
  final List<String> mealTypes = ["Breakfast", "Lunch", "Dinner"];

  // Track the currently selected meal type
  String selectedMealType = "Breakfast";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 20.w),
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 15.h),
              Container(height: 300, child: const WorkoutProgress(text: "Meal Nutritions",)),
              SizedBox(height: 15.h),
              _buildTodayTargetSection(),
              SizedBox(height: 24.h),
              _buildTodayMealsSection(),
              SizedBox(height: 32.h),
              _buildFindSomethingToEatSection(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the header row with title and notification settings icon.
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(), // Empty space for symmetry
        Text(
          "Meal Planner",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image.asset("assets/icons/notifSettings.png"),
        ),
      ],
    );
  }

  /// Builds the "Daily Meal Schedule" section with a "Check" button.
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
            "Daily Meal Schedule",
            style: TextStyle(fontSize: 18),
          ),
          _buildCheckButton(),
        ],
      ),
    );
  }

  /// Builds the button that navigates to the activity tracker (if implemented).
  Widget _buildCheckButton() {
    return GestureDetector(
      onTap: () {
        // Navigation logic would go here
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            stops: [0.1, 0.9],
            colors: [AppConstants.malibu, AppConstants.anakiwa],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Text(
          "Check",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  /// Builds the "Today Meals" section with a dropdown to select meal type.
  Widget _buildTodayMealsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Dropdown Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                "Today Meals",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildMealTypeDropdown(),
            ],
          ),
          const SizedBox(height: 20),

          // Today's Meals List
          const _MealCard(
            mealName: "Salmon Nigiri",
            mealTime: "Today | 7am",
            iconData: Icons.notifications_active_outlined,
            iconColor: Color(0xFFE1BEE7), // Purple[100]
            imageAsset: "assets/images/TodayMeals2.png",
          ),
          const SizedBox(height: 16),
          const _MealCard(
            mealName: "Lowfat Milk",
            mealTime: "Today | 8am",
            iconData: Icons.notifications_off_outlined,
            iconColor: Color(0xFFE1BEE7), // Purple[100]
            imageAsset: "assets/images/TodayMeals1.png",
          ),
        ],
      ),
    );
  }

  /// Builds the dropdown for selecting the meal type.
  Widget _buildMealTypeDropdown() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          stops: [0.1, 0.9],
          colors: [AppConstants.malibu, AppConstants.anakiwa],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedMealType,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 20,
            color: Colors.white,
          ),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(10),
          items: mealTypes.map((String meal) {
            return DropdownMenuItem<String>(
              value: meal,
              child: Text(meal),
            );
          }).toList(),
          onChanged: (newValue) {
            if (newValue != null) {
              setState(() {
                selectedMealType = newValue;
              });
            }
          },
        ),
      ),
    );
  }

  /// Builds the "Find Something to Eat" section with horizontal list of categories.
  Widget _buildFindSomethingToEatSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Find Something to Eat",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _CategoryCard(
                  title: "Breakfast",
                  subtitle: "120+ Foods",
                  imageAsset: "assets/images/FindSomethingtoEat1.png",
                  backgroundColor: Color(0xFFE3F2FD), // blue[50]
                  buttonColor: Color(0xFF90CAF9), // blue[200]
                ),
                _CategoryCard(
                  title: "Lunch",
                  subtitle: "130+ Foods",
                  imageAsset: "assets/images/FindSomethingtoEat2.png",
                  backgroundColor: Color(0xFFF3E5F5), // purple[50]
                  buttonColor: Color(0xFFCE93D8), // purple[200]
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MealCard extends StatelessWidget {
  final String mealName;
  final String mealTime;
  final IconData iconData;
  final Color iconColor;
  final String imageAsset;

  const _MealCard({
    Key? key,
    required this.mealName,
    required this.mealTime,
    required this.iconData,
    required this.iconColor,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          // Meal Image
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(
              imageAsset,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          ),
          // Meal Info
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mealName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  mealTime,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          // Notification Icon
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: iconColor,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, size: 18, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageAsset;
  final Color backgroundColor;
  final Color buttonColor;

  const _CategoryCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageAsset,
    required this.backgroundColor,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 160.w,
          margin: const EdgeInsets.only(right: 16),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(22),
              topRight: Radius.circular(100),
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey[700], fontSize: 12),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Select",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: Image.asset(
            width: 117.w,
            height: 73.h,
            imageAsset,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
