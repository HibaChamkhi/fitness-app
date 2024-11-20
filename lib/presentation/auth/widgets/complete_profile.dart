import 'package:fitness_app/presentation/auth/widgets/goals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/ui/style/colors.dart';
import '../../../core/ui/widgets/input_field.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final TextEditingController _weightController = TextEditingController();
  String? selectedGender; // Holds the selected gender value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: 15.h, horizontal: 20.w
        ),
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            gradient:
            const LinearGradient(begin: Alignment.centerLeft, stops: [
              0.1,
              0.9
            ], colors: [
              AppConstants.malibu,
              AppConstants.anakiwa,
            ])),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GoalsWidget(),
              ),
            );
          },
          child: const Text(
            "Next",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding:  EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          children: [
            Image.asset("assets/images/complete_profile.png"),
            const Text(
              "Let’s complete your profile",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Poppins"),
            ),
            Text(
              "It will help us to know more about you!",
              style: TextStyle(fontSize: 12, fontFamily: "Poppins"),
            ),
             SizedBox(
              height: 25.h,
            ),
            Form(
                child: Column(
              children: [
                // Gender Selector
                _buildGenderField(),
                SizedBox(height: 15.h),
                // Example scaled-down Date Picker
                _buildDateOfBirthField(),
                SizedBox(
                  height: 15.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: InputField(
                          hintText: 'Your Weight',
                          controller: _weightController,
                          prefixWidget: Image.asset(
                            "assets/icons/weight-scale 1.png",
                            width: 12.w,
                            height: 15.h,
                            fit: BoxFit.scaleDown,
                            color: Colors.grey,
                          ),
                          validator: null),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              stops: [
                                0.1,
                                0.9
                              ],
                              colors: [
                                AppConstants.perfume,
                                AppConstants.kobi,
                              ])),
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: const Text(
                        "KG",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: InputField(
                          hintText: 'Your Height',
                          controller: _weightController,
                          prefixWidget: SvgPicture.asset(
                            "assets/icons/Swap.svg",
                            width: 12.w,
                            height: 15.h,
                            fit: BoxFit.scaleDown,
                            color: Colors.grey,
                          ),
                          validator: null),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              stops: [
                                0.1,
                                0.9
                              ],
                              colors: [
                                AppConstants.perfume,
                                AppConstants.kobi,
                              ])),
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: const Text(
                        "CM",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            )),

          ],
        ),
      ),
    );
  }

  Widget _buildGenderField() {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: DropdownButtonFormField<String>(
        value: selectedGender,
        hint: Row(
          children: [
            Icon(Icons.person_outline, color: Colors.grey),
             SizedBox(width: 12.w),
            Text(
              "Choose Gender",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
        decoration: const InputDecoration.collapsed(hintText: ''),
        // Remove underline
        items: [
          DropdownMenuItem(
            value: "Male",
            child: Text("Male", style: TextStyle(color: Colors.grey[700])),
          ),
          DropdownMenuItem(
            value: "Female",
            child: Text("Female", style: TextStyle(color: Colors.grey[700])),
          ),
        ],
        onChanged: (value) {
          setState(() {
            selectedGender = value; // Update the selected value
          });
        },
        icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
        dropdownColor: Colors.white,
      ),
    );
  }

  Widget _buildDateOfBirthField() {
    return GestureDetector(
      onTap: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (selectedDate != null) {
          print('Selected Date: $selectedDate');
        }
      },
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today_outlined, color: Colors.grey),
                 SizedBox(width: 12.w),
                Text(
                  "Date of Birth",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
