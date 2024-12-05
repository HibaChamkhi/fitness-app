import 'package:fitness_app/core/ui/widgets/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../core/ui/style/colors.dart';
import 'comparison.dart';

class ProgressPhotoWidget extends StatefulWidget {
  const ProgressPhotoWidget({super.key});

  @override
  State<ProgressPhotoWidget> createState() => _ProgressPhotoWidgetState();
}

class _ProgressPhotoWidgetState extends State<ProgressPhotoWidget> {
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
              SizedBox(height: 30),
              _buildReminder(),
              SizedBox(height: 30),
              _buildTrackProgressSection(),
              SizedBox(height: 30),
              _buildTodayTargetSection(),
              SizedBox(height: 30),
              _buildGallerySection(),
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
        Container(),
        const Text(
          "Progress Photo",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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

  Widget _buildReminder() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/Reminder.png"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reminder!",
                style: TextStyle(fontSize: 14.sp, color: Colors.red),
              ),
              Text(
                "Next Photos Fall On July 08",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(Icons.close),
        ],
      ),
    );
  }

  Widget _buildTrackProgressSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      decoration: BoxDecoration(
        color: AppConstants.malibu.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTrackProgressText(),
          Image.asset("assets/images/ProgressPhoto.png"),
        ],
      ),
    );
  }

  Widget _buildTrackProgressText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 170.w,
          child: Text(
            "Track Your Progress Each Month With Photo",
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
        SizedBox(height: 15.h),
        _buildLearnMoreButton(),
      ],
    );
  }

  Widget _buildLearnMoreButton() {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const (),
        //   ),
        // );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            stops: const [0.1, 0.9],
            colors: [AppConstants.malibu, AppConstants.anakiwa],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          "Learn More",
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTodayTargetSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      decoration: BoxDecoration(
        color: AppConstants.malibu.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Compare my Photo",
            style: TextStyle(fontSize: 18.sp),
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
          screen: ComparisonWidget(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            stops: const [0.1, 0.9],
            colors: [AppConstants.malibu, AppConstants.anakiwa],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          "Compare",
          style: TextStyle(fontSize: 16.sp, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildGallerySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildGalleryHeader(),
        SizedBox(height: 15.h),
        _buildGalleryImages(),
      ],
    );
  }

  Widget _buildGalleryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Gallery",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          "See more",
          style: TextStyle(
            fontSize: 18.sp,
            color: AppConstants.grayChateau,
          ),
        ),
      ],
    );
  }

  Widget _buildGalleryImages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildGalleryDate("2 June"),
        _buildGalleryDate("5 May"),
      ],
    );
  }

  Widget _buildGalleryDate(String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(date),
        SizedBox(height: 10.h),
        Container(
          height: 100.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(6, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/FrontFacing2.png",
                    width: 150,
                    height: 150,
                    fit: BoxFit.scaleDown,
                  ),
                )
              );
            }),
          ),
        ),
      ],
    );
  }
}
