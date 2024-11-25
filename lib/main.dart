
import 'package:fitness_app/presentation/auth/widgets/go_home.dart';
import 'package:fitness_app/presentation/auth/widgets/goals.dart';
import 'package:fitness_app/presentation/auth/widgets/sign_in.dart';
import 'package:fitness_app/presentation/auth/widgets/sign_up.dart';
import 'package:fitness_app/presentation/buttom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Your design size
      minTextAdapt: true,
      builder: (context, child) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
        );
      },
    );
  }
}
