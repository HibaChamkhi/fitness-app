
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/style/colors.dart';

class WorkoutTrackerWidget extends StatefulWidget {
  const WorkoutTrackerWidget({super.key});

  @override
  State<WorkoutTrackerWidget> createState() => _WorkoutTrackerWidgetState();
}

class _WorkoutTrackerWidgetState extends State<WorkoutTrackerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(),
                  const Text(
                    "Workout Tracker",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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

            ],
          ),
        ),
      ),
    );
  }
}
