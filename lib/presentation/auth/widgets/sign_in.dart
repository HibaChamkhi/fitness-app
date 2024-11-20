import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/input_validation/validate_email.dart';
import '../../../core/ui/style/colors.dart';
import '../../../core/ui/widgets/input_field.dart';
import 'complete_profile.dart';
import 'go_home.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 200.h,
        padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                vertical: 20.h,
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
                      builder: (context) => const GoHomeWidget(),
                    ),
                  );
                },
                child: const Text(
                  "Login",
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
            const Text.rich(
              TextSpan(
                text: 'Don’t have an account yet? ',
                style: TextStyle(
                    color: Colors.black, fontSize: 14, fontFamily: "Poppins"),
                children: [
                  TextSpan(
                    text: 'Register',
                    style: TextStyle(
                      color: AppConstants.malibuApprox,
                      fontFamily: "Poppins",
                    ), // Red color
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 20.w),
        child: Column(
          children: [
            Text(
              "Hey there,",
              style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
            ),
            const Text(
              "Welcome Back",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Poppins"),
            ),
            SizedBox(
              height: 30.h,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  InputField(
                      hintText: 'Email',
                      controller: _emailController,
                      prefixWidget: SvgPicture.asset(
                        "assets/icons/Message.svg",
                        width: 12.w,
                        height: 15.h,
                        fit: BoxFit.scaleDown,
                        color: Colors.grey,
                      ),
                      validator: (value) => validateEmail(value!, context)),
                   SizedBox(
                    height: 15.h,
                  ),
                  InputField(
                      hintText: 'Password',
                      isPassword: true,
                      controller: _emailController,
                      prefixWidget: SvgPicture.asset(
                        "assets/icons/Lock.svg",
                        width: 12.w,
                        height: 15.h,
                        fit: BoxFit.scaleDown,
                        color: Colors.grey,
                      ),
                      validator: (value) => validateEmail(value!, context)),
                   SizedBox(
                    height: 15.h,
                  ),
                  const Text(
                    "Forgot your password?",
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
