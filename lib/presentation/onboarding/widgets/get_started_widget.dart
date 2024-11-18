import 'package:fitness_app/presentation/onboarding/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/style/colors.dart';

class GetStartedWidget extends StatelessWidget {
  const GetStartedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: const LinearGradient(begin: Alignment.centerLeft, stops: [
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
                builder: (context) => const OnboardingWidget(), // The new screen to navigate to
              ),
            );
          },
          child: const Text(
            "Get Started",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Flexi', // Regular text part
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      fontFamily: "Poppins"), // Default color
                  children: [
                    TextSpan(
                      text: 'FY', // Text to be styled in red
                      style: TextStyle(
                        color: AppConstants.malibuApprox,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                      ), // Red color
                    ),
                  ],
                ),
              ),
              Text(
                "Everybody Can Train",
                style: TextStyle(
                    fontSize: 18, fontFamily: "Poppins"), // Default color
              ),
            ],
          ),
        ),
      ),
    );
  }
}
