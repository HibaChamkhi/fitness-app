import 'package:fitness_app/presentation/progress_tracker/widgets/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/style/colors.dart';

class ComparisonWidget extends StatefulWidget {
  const ComparisonWidget({super.key});

  @override
  State<ComparisonWidget> createState() => _ComparisonWidgetState();
}

class _ComparisonWidgetState extends State<ComparisonWidget> {
  String? selectedMonth1;
  String? selectedMonth2;

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 20.w
        ),
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            gradient: LinearGradient(begin: Alignment.centerLeft, stops: [
              0.1,
              0.9
            ], colors: [
              AppConstants.malibu,
              AppConstants.anakiwa,
            ])),
        child: InkWell(
          onTap: () {
              if (selectedMonth1 != null && selectedMonth2 != null) {
                // Navigate to Result Screen with selected months
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultWidget(
                      month1: selectedMonth1!,
                      month2: selectedMonth2!,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please select both months!'),
                  ),
                );
              }
          },
          child: const Text(
            "Compare",
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
                    "Comparison",
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonFormField<String>(
                      value: selectedMonth1,
                      dropdownColor: Colors.white,
                      items: months
                          .map((month) => DropdownMenuItem<String>(
                        value: month,
                        child: Text(month),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedMonth1 = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true, // Enables background fill
                        fillColor: Colors.grey.withOpacity(0.2), // Sets the background color to grey
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12), // Sets border radius
                          borderSide: BorderSide.none, // Removes the border line
                        ),
                        prefixIcon: Icon(Icons.calendar_today, color: Colors.grey), // Adds an icon on the left
                      ),
                      hint: Text(
                        'Select a month 1', // Placeholder text
                        style: TextStyle(color: Colors.grey), // White text color for placeholder
                      ),
                    ),

                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: selectedMonth2,
                      dropdownColor: Colors.white,
                      items: months
                          .map((month) => DropdownMenuItem<String>(
                        value: month,
                        child: Text(month),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedMonth2 = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true, // Enables background fill
                        fillColor: Colors.grey.withOpacity(0.2), // Sets the background color to grey
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12), // Sets border radius
                          borderSide: BorderSide.none, // Removes the border line
                        ),
                        prefixIcon: Icon(Icons.calendar_today, color: Colors.grey), // Adds an icon on the left
                      ),
                      hint: Text(
                        'Select a month 2', // Placeholder text
                        style: TextStyle(color: Colors.grey), // White text color for placeholder
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



