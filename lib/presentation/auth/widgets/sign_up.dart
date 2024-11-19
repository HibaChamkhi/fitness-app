import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/input_validation/validate_email.dart';
import '../../../core/ui/style/colors.dart';
import '../../../core/ui/widgets/input_field.dart';
import 'complete_profile.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
          children: [
            Text(
              "Hey there,",
              style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
            ),
            const Text(
              "Create an Account",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Poppins"),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  InputField(
                      hintText: 'First Name',
                      controller: _emailController,
                      prefixWidget: Container(
                          width: 5,
                          child: SvgPicture.asset(
                            "assets/icons/Profile.svg",
                            width: 12,
                            height: 15,
                            fit: BoxFit.scaleDown,
                            color: Colors.grey,
                          )),
                      validator: (value) => validateEmail(value!, context)),
                  SizedBox(
                    height: 15,
                  ),
                  InputField(
                      hintText: 'Last Name',
                      controller: _emailController,
                      prefixWidget: SvgPicture.asset(
                        "assets/icons/Profile.svg",
                        width: 12,
                        height: 15,
                        fit: BoxFit.scaleDown,
                        color: Colors.grey,
                      ),
                      validator: (value) => validateEmail(value!, context)),
                  SizedBox(
                    height: 15,
                  ),
                  InputField(
                      hintText: 'Email',
                      controller: _emailController,
                      prefixWidget: SvgPicture.asset(
                        "assets/icons/Message.svg",
                        width: 12,
                        height: 15,
                        fit: BoxFit.scaleDown,
                        color: Colors.grey,
                      ),
                      validator: (value) => validateEmail(value!, context)),
                  SizedBox(
                    height: 15,
                  ),
                  InputField(
                      hintText: 'Password',
                      isPassword: true,
                      controller: _emailController,
                      prefixWidget: SvgPicture.asset(
                        "assets/icons/Lock.svg",
                        width: 12,
                        height: 15,
                        fit: BoxFit.scaleDown,
                        color: Colors.grey,
                      ),
                      validator: (value) => validateEmail(value!, context)),
                  SizedBox(
                    height: 15,
                  ),
                   const Row(
                    children: [
                       Checkbox(value: true, onChanged: null),
                      SizedBox(
                        width: 250,
                        child: Text(
                          "By continuing you accept our Privacy Policy and Term of Use",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: "Poppins",
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      vertical: 50,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            stops: [
                              0.1,
                              0.9
                            ],
                            colors: [
                              AppConstants.malibu,
                              AppConstants.anakiwa,
                            ])),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CompleteProfile(),
                        ),
                        );
                      },
                      child: const Text(
                        "Register",
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
                      text: 'Already have an account? ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "Poppins"),
                      children: [
                        TextSpan(
                          text: 'Login',
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
          ],
        ),
      ),
    );
  }
}
