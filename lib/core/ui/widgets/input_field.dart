import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String? inputTitle;
  final String? hintText;
  late void Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final String? prefixIcon; // Path to SVG or image for prefix icon
  final Widget? prefixWidget; // Widget for custom left-side icon
  final int? maxLines;
  final bool isPassword;

  InputField({
    super.key,
    required this.controller,
    this.hintText,
    this.inputTitle,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.prefixWidget,
    this.maxLines,
    FocusNode? focusNode,
    this.isPassword = false,
  });

  @override
  State<InputField> createState() => _TextFormFieldWidget();
}

class _TextFormFieldWidget extends State<InputField> {
  bool show = false;
  bool hidePassword = true;
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.inputTitle != null
            ? Column(
          children: [
            Text(widget.inputTitle!,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                )),
            SizedBox(height: 10.h),
          ],
        )
            : Container(),
        TextFormField(
          controller: widget.controller,
          cursorColor: Colors.grey,
          obscureText: widget.isPassword
              ? hidePassword
              ? true
              : false
              : false,
          maxLines: widget.maxLines ?? 1,
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            letterSpacing: widget.isPassword ? 1 : 0,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            fillColor: Color(0xFFF7F8F8),
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: Colors.grey
            ),
            errorStyle: TextStyle(
              fontFamily: "Poppins",
              color: const Color(0xffF04438),
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            prefixIcon: widget.prefixWidget ??
                (widget.prefixIcon != null
                    ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SvgPicture.asset(
                    widget.prefixIcon!,
                    height: 24.h,
                    fit: BoxFit.scaleDown,
                  ),
                )
                    : null),
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: SvgPicture.asset(
                'assets/icons/Hide.svg',
                height: 18.h,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
            )
                : null,
          ),
          validator: widget.validator,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}

