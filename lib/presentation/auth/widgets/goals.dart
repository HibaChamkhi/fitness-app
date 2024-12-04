import 'package:fitness_app/presentation/auth/widgets/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/ui/style/colors.dart';

class GoalsWidget extends StatefulWidget {
  const GoalsWidget({super.key});

  @override
  State<GoalsWidget> createState() => _GoalsWidgetState();
}

class _GoalsWidgetState extends State<GoalsWidget> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
             SizedBox(height: 20.h),
             Text(
              "What is your goal?",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold,  fontFamily: "Poppins",),
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 60.w),
              child: Text(
                "It will help us to choose the best program for you",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16.sp , fontFamily: "Poppins",),
              ),
            ),
             SizedBox(height: 20.h),
            Expanded(
              child: PageView.builder(
                itemCount: 3,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final isCurrent = index == _currentPage;
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isCurrent ? 1.0 : 0.5, // Adjust opacity
                    child: Transform.scale(
                      scale: isCurrent ? 1 : 0.9, // Highlight the centered card
                      child: GoalCard(
                        imagePath: index == 0
                            ? 'assets/images/goal1.png'
                            : index == 1
                                ? 'assets/images/goal2.png'
                                : 'assets/images/goal3.png',
                        title: index == 0
                            ? "Improve Shape"
                            : index == 1
                                ? "Lean & Tone"
                                : "Lose Fat",
                        description: index == 0
                            ? "I have a low amount of body fat and need to build more muscle"
                            : index == 1
                                ? "I'm 'skinny fat', look thin but have no shape. I want to add lean muscle in the right way"
                                : "I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass",
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              margin:  EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
              padding:  EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  stops: [0.1, 0.9],
                  colors: [
                    AppConstants.malibu,
                    AppConstants.anakiwa,
                  ],
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInWidget(),
                    ),
                  );
                },
                child:  Text(
                  "Confirm",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
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
}

class GoalCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const GoalCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0.w),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            stops: [0.1, 0.9],
            colors: [
              AppConstants.malibu,
              AppConstants.anakiwa,
            ],
          ),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath,height: 250.h,),
             SizedBox(height: 18.h),
            Text(
              title,
              style:  TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,  fontFamily: "Poppins",
              ),
            ),
            Divider(
              height: 5.h,
              color: Colors.white,
              thickness: 1.5,
              indent: 120,
              endIndent: 120,
            ),
             SizedBox(height: 10.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 18.0.w),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style:  TextStyle(color: Colors.white,fontSize: 14.sp,  fontFamily: "Poppins",),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
