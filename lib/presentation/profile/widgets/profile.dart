import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/ui/style/colors.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 80.h, horizontal: 20.w),
          child: Column(
            children: [
              _buildHeader(),
               SizedBox(height: 15.h),
              _buildProfileInfo(),
               SizedBox(height: 15.h),
              _buildMetricsRow(),
               SizedBox(height: 25.h),
              _buildSection("Account", _buildAccountOptions()),
               SizedBox(height: 25.h),
              _buildSection("Notification", _buildNotificationOptions()),
               SizedBox(height: 25.h),
              _buildSection("Other", _buildOtherOptions()),
            ],
          ),
        ),
      ),
    );
  }

  // Builds the header row with title and notification icon
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox.shrink(),
         Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
        ),
        Container(
          alignment: Alignment.center,
          padding:  EdgeInsets.all(12.h),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image.asset("assets/icons/notifSettings.png"),
        ),
      ],
    );
  }

  // Builds the profile picture and user information row
  Widget _buildProfileInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset("assets/images/LatestPic2.png"),
             SizedBox(width: 15.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  "Stefani Wong",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
                ),
                Text(
                  "Lose a Fat Program",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            // Implement navigation to edit profile screen
          },
          child: _buildButton("Edit", AppConstants.malibu, AppConstants.anakiwa),
        ),
      ],
    );
  }

  // Builds a row of metrics (Height, Weight, Age)
  Widget _buildMetricsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildMetricCard("180cm", "Height"),
        _buildMetricCard("65kg", "Weight"),
        _buildMetricCard("22yo", "Age"),
      ],
    );
  }

  // Helper to build individual metric cards
  Widget _buildMetricCard(String value, String label) {
    return _buildCard(
      Column(
        children: [
          Text(
            value,
            style:  TextStyle(color: AppConstants.malibu, fontSize: 19.sp),
          ),
          Text(
            label,
            style:  TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }

  // Builds a titled section with content
  Widget _buildSection(String title, List<Widget> children) {
    return _buildCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
          ),
           SizedBox(height: 25.h),
          Column(children: children),
        ],
      ),
    );
  }

  // Builds account-related options
  List<Widget> _buildAccountOptions() {
    return [
      _buildOption("Personal Data", "assets/icons/Profile.svg"),
      _buildOption("Achievement", "assets/icons/Document.svg"),
      _buildOption("Activity History", "assets/icons/Graph.svg"),
      _buildOption("Workout Progress", "assets/icons/Chart.svg"),
    ];
  }

  // Builds notification-related options
  List<Widget> _buildNotificationOptions() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/Notification.svg",
                color: AppConstants.malibu,
              ),
               SizedBox(width: 5.w),
               Text("Pop-up Notification", style: TextStyle(fontSize: 16.sp)),
            ],
          ),
          Switch(
            value: light,
            activeColor: AppConstants.perfume,
            onChanged: (bool value) {
              setState(() {
                light = value;
              });
            },
          ),
        ],
      ),
    ];
  }

  // Builds other options
  List<Widget> _buildOtherOptions() {
    return [
      _buildOption("Contact Us", "assets/icons/Message.svg"),
      _buildOption("Privacy Policy", "assets/icons/Shield Done.svg"),
      _buildOption("Settings", "assets/icons/Setting.svg"),
    ];
  }

  // Helper to build individual options
  Widget _buildOption(String label, String iconPath) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(iconPath, color: AppConstants.malibu),
               SizedBox(width: 5.w),
              Text(label, style:  TextStyle(fontSize: 16.sp)),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppConstants.grayChateau,
            size: 20,
          ),
        ],
      ),
    );
  }

  // Helper to build a card with optional content
  Widget _buildCard(Widget child) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  // Helper to build a gradient button
  Widget _buildButton(String label, Color startColor, Color endColor) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 5.h, horizontal: 25.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style:  TextStyle(fontSize: 16.sp, color: Colors.white),
      ),
    );
  }
}
