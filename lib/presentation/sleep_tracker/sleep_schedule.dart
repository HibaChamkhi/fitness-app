import 'package:fitness_app/presentation/sleep_tracker/schedule_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/ui/style/colors.dart';
import '../../core/ui/widgets/gradient_progress_bar.dart';
import 'add_alarm.dart';

class SleepScheduleWidget extends StatefulWidget {
  const SleepScheduleWidget({super.key});

  @override
  State<SleepScheduleWidget> createState() => _SleepScheduleWidgetState();
}

class _SleepScheduleWidgetState extends State<SleepScheduleWidget> {
  @override
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
              _buildTodayTargetSection(),
              SizedBox(
                height: 15,
              ),
              WeekViewCalendar(),
              SizedBox(
                height: 250,
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  children: [
                    ScheduleCard(
                      icon: "alarm-clock.png",
                      title: 'Bedtime',
                      time: '09:00pm',
                      description: 'in 6 hours 22 minutes',
                    ),
                    const SizedBox(height: 16),
                    ScheduleCard(
                      icon: "bed.png",
                      title: 'Alarm',
                      time: '05:10am',
                      description: 'in 14 hours 30 minutes',
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      AppConstants.perfume.withOpacity(0.3),
                      AppConstants.kobi.withOpacity(0.3),
                    ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 220.w,
                        child:
                            Text("You will get 8hours 10minutes for tonight")),
                    GradientProgressBar(
                      percentage: 62,
                      colors: [
                        AppConstants.perfume,
                        AppConstants.kobi,
                      ],
                      barColor: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddAlarmWidget(),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(colors: [
              AppConstants.perfume,
              AppConstants.kobi,
            ])),
            child: Icon(Icons.add, color: Colors.white)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildTodayTargetSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: AppConstants.malibu.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ideal Hours for Sleep",
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "8hours 30minutes",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: AppConstants.malibuApprox,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              _buildCheckButton(),
            ],
          ),
          Image.asset("assets/images/SleepSchedule.png")
        ],
      ),
    );
  }

  Widget _buildCheckButton() {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: SleepScheduleWidget(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            stops: const [0.1, 0.9],
            colors: [AppConstants.malibu, AppConstants.anakiwa],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          "Learn More",
          style: TextStyle(
              fontSize: 10.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class WeekViewCalendar extends StatefulWidget {
  @override
  _WeekViewCalendarState createState() => _WeekViewCalendarState();
}

class _WeekViewCalendarState extends State<WeekViewCalendar> {
  final DateTime _startDate = DateTime.now(); // Start from today
  final int _numberOfDays = 365; // Show 1 year of data
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Schedule',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 100, // Fixed height for the week view
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _numberOfDays,
              itemBuilder: (context, index) {
                // Calculate the current date based on the start date
                final currentDate = _startDate.add(Duration(days: index));
                final isSelected = _selectedDay == currentDate;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDay = currentDate;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 60,
                    // Width for each day
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        stops: const [0.1, 0.9],
                        colors: isSelected
                            ? [AppConstants.malibu, AppConstants.anakiwa]
                            : [Colors.grey.shade200, Colors.grey.shade200],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat.E().format(currentDate),
                          // Display day (e.g., Mon, Tue)
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? Colors.white
                                : Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          DateFormat.d().format(currentDate),
                          // Display date (e.g., 12, 13)
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? Colors.white
                                : Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
