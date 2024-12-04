import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/style/colors.dart';

class ResultWidget extends StatefulWidget {
  final String month1;
  final String month2;

  ResultWidget({required this.month1, required this.month2});

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
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
          onTap: () {},
          child: const Text(
            "Go Back Home",
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
                    "Result",
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
            ],
          ),
        ),
      ),
    );
  }
}
