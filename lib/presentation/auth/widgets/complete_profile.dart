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
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            const SizedBox(
              height: 25,
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
                            width: 12,
                            height: 15.h,
                            fit: BoxFit.scaleDown,
                            color: Colors.grey,
                          ),
                          validator: null),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
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
                            width: 12,
                            height: 15.h,
                            fit: BoxFit.scaleDown,
                            color: Colors.grey,
                          ),
                          validator: null),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
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
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                vertical: 30.h,
              ),
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
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
                      builder: (context) => const CompleteProfile(),
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
          ],
        ),
      ),
    );
  }

  Widget _buildGenderField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButtonFormField<String>(
        value: selectedGender,
        hint: Row(
          children: [
            Icon(Icons.person_outline, color: Colors.grey),
            const SizedBox(width: 12),
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
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
                const SizedBox(width: 12),
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
