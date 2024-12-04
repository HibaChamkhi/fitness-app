import 'package:fitness_app/presentation/auth/widgets/goals.dart';
import 'package:fitness_app/presentation/buttom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/ui/style/colors.dart';

class GoHomeWidget extends StatefulWidget {
  const GoHomeWidget({super.key});

  @override
  State<GoHomeWidget> createState() => _GoHomeWidgetState();
}

class _GoHomeWidgetState extends State<GoHomeWidget> {
  final TextEditingController _weightController = TextEditingController();
  String? selectedGender; // Holds the selected gender value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 20.w
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
                builder: (context) =>  BottomNavBarWidget(),
              ),
            );
          },
          child: const Text(
            "Go To Home",
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
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/goHome.png"),
             SizedBox(
              height: 25.h,
            ),
            const Text(
              "Welcome, Hiba",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Poppins"),
            ),

            const Text(
              "You are all set now, let’s reach your goals together with us",
              style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
              maxLines: 3, // Limit the text to 3 lines
              textAlign: TextAlign.center, // Center-align the text
              overflow: TextOverflow.ellipsis, // Add ellipsis if text exceeds 3 lines
            ),



          ],
        ),
      ),
    );
  }



}
