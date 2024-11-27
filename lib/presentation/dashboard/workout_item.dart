
import 'package:flutter/material.dart';

import '../../core/ui/style/colors.dart';
import 'gradient_progress_bar.dart';

class WorkoutItem extends StatelessWidget {
  final Workout workout;

  const WorkoutItem({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                workout.imagePath,
                height: 50,
                width: 50,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workout.title,
                    style: const TextStyle(color: AppConstants.alto),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    workout.subtitle,
                    style: const TextStyle(color: AppConstants.grayChateau),
                  ),
                  const SizedBox(height: 8),
                  GradientProgressBar(
                    percentage: workout.progress,
                  ),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                width: 1,
                color: AppConstants.perfume,
              ),
            ),
            child: const Icon(
              Icons.navigate_next_outlined,
              color: AppConstants.perfume,
            ),
          ),
        ],
      ),
    );
  }
}

class Workout {
  final String imagePath; // Path to the image asset for the workout.
  final String title; // Title of the workout (e.g., "Fullbody Workout").
  final String subtitle; // Subtitle with details (e.g., "180 Calories Burn | 20 minutes").
  final double progress; // A number between 0.0 and 1.0 indicating completion progress.

  Workout({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.progress,
  });
}
