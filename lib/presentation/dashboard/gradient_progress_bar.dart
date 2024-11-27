import 'package:fitness_app/core/ui/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientProgressBar extends StatelessWidget {
  final double percentage; // Pass percentage as a parameter (e.g., 0.0 to 1.0)

  const GradientProgressBar({Key? key, required this.percentage})
      : assert(percentage >= 0 && percentage <= 1,
  "Percentage must be between 0 and 1."),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6, // Adjust width as needed
      height: 10.0, // Adjust height as needed
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // Background color
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          // Filled bar with gradient
          FractionallySizedBox(
            widthFactor: percentage, // Use the percentage parameter to control width
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppConstants.malibu, AppConstants.perfume], // Gradient colors
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}