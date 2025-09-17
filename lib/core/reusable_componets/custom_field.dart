import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_final_project/core/resources/ColorsManager.dart';

class CustomField extends StatefulWidget {
  String prefix;
  String hint;
  TextEditingController controller;
  bool ispassword;
  String? Function(String?) validation;
  TextInputType keyboard;

  CustomField({
    required this.prefix,
    required this.hint,
    required this.keyboard,
    required this.validation,
    required this.ispassword,
    required this.controller,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool isHidden=true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboard,
      style: Theme.of(context).textTheme.titleMedium, //user
      validator: widget.validation,
      controller: widget.controller,
      obscureText: widget.ispassword?isHidden:false,
      decoration: InputDecoration(
        suffixIcon:widget.ispassword? IconButton(
          onPressed: () {
            setState(() {
              isHidden=!isHidden;
            });
          },
          icon: Icon(isHidden?
          Icons.visibility_off:Icons.visibility,
            color: Theme.of(context).textTheme.titleMedium!.color!,
          ),
        ):null,
        filled: true,
        fillColor: ColorsManager.greycolor,
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.titleMedium,//user
        prefixIconConstraints: BoxConstraints(maxWidth: 60, maxHeight: 60),
        prefixIcon: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: SvgPicture.asset(
            widget.prefix,
            width: 36.w,
            height: 36.h,
            colorFilter: ColorFilter.mode(
              Theme.of(context).textTheme.titleMedium!.color!,
              BlendMode.srcIn,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Colors.red, width: 2.w),

        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Colors.red, width: 1.5.w),
        ),
      ),
    );
  }
}
