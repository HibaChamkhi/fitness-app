import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/ui/style/colors.dart';

class AddAlarmWidget extends StatefulWidget {
  const AddAlarmWidget({super.key});

  @override
  State<AddAlarmWidget> createState() => _AddAlarmWidgetState();
}

class _AddAlarmWidgetState extends State<AddAlarmWidget> {
  bool vibrateEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomButton(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
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
                    "Add Alarm",
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
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    _buildTile(
                      icon: "assets/icons/Icon-Bed.svg",
                      title: "Bedtime",
                      subtitle: "09:00 PM",
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    _buildTile(
                      icon: "assets/icons/Time Circle.svg",
                      title: "Hours of sleep",
                      subtitle: "8 hours 30 minutes",
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    _buildTile(
                      icon: "assets/icons/Icon-Repeat.svg",
                      title: "Repeat",
                      subtitle: "Mon to Fri",
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    _buildToggleTile(
                      icon: "assets/icons/vibrate.svg",
                      title: "Vibrate When Alarm Sound",
                      value: vibrateEnabled,
                      onChanged: (bool newValue) {
                        setState(() {
                          vibrateEnabled = newValue;
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile({
    required String icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                icon,
                color: AppConstants.empress,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(color: AppConstants.empress, fontSize: 12.sp),
              )
            ],
          ),
          Row(
            children: [
              Text(subtitle,
                  style:
                      TextStyle(color: AppConstants.empress, fontSize: 10.sp)),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppConstants.empress,
                size: 15,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildToggleTile({
    required String icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: SvgPicture.asset(
        icon,
        color: AppConstants.empress,
      ),
      title: Text(
        title,
        style: TextStyle(color: AppConstants.empress, fontSize: 12.sp),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppConstants.perfume,
      ),
      tileColor: const Color(0xFFF7F7F7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildBottomButton() {
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
          "add",
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
}
