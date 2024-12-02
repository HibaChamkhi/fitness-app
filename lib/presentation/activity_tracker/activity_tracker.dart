import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/ui/style/colors.dart';
import 'activity_progress_chart.dart';
import 'latest_activity_screen.dart';

class ActivityTrackerWidget extends StatefulWidget {
  const ActivityTrackerWidget({super.key});

  @override
  State<ActivityTrackerWidget> createState() => _ActivityTrackerWidgetState();
}

class _ActivityTrackerWidgetState extends State<ActivityTrackerWidget> {
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
                    "Activity Tracker",
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
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppConstants.malibu.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Today Target",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold)),
                        Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(
                                colors: [
                                  AppConstants.malibu,
                                  AppConstants.anakiwa
                                ],
                              ),
                            ),
                            child: Text(
                              "+",
                              style: TextStyle(fontSize: 25, color: Colors.white),
                            )),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/images/glass.png"),
                              SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("8L",
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: AppConstants.malibu)),
                                  Text("Water Intake",
                                      style: TextStyle(fontSize: 18)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/images/boots.png"),
                              SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("2400",
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: AppConstants.malibu)),
                                  Text("Foot Steps",
                                      style: TextStyle(fontSize: 18)),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ActivityTrackerScreen(),
              LatestActivityScreen()
            ],
          ),
        ),
      ),
    );
  }
}
