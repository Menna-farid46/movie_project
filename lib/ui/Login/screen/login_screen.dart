import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_final_project/core/resources/AssetsManager.dart';
import 'package:movies_final_project/core/resources/ColorsManager.dart';
import 'package:movies_final_project/core/resources/Routes.dart';
import 'package:movies_final_project/core/resources/StringsManager.dart';
import 'package:movies_final_project/core/reusable_componets/custom_button.dart';
import 'package:movies_final_project/core/reusable_componets/custom_field.dart';

import '../../../core/resources/constants.dart';
import '../../../core/reusable_componets/custom_switch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailcontroller;
  late TextEditingController passwordcontroller;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int selectedlanguage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    if (context.locale.languageCode == "ar") {
      selectedlanguage = 1;
    }
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: REdgeInsets.only(top: 67, right: 140, left: 140),
                  child: Image.asset(AssetsManager.logo),
                ),
                SizedBox(height: 69.h),
                CustomField(
                  prefix: AssetsManager.email,
                  hint: "email".tr(),
                  controller: emailcontroller,
                  keyboard: TextInputType.emailAddress,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "shouldempty".tr();
                    }
                    if (!RegExp(emailRegex).hasMatch(value)) {
                      return "Email not valid".tr();
                    }
                    return null;
                  },
                  ispassword: false,
                ),
                SizedBox(height: 22.4.h),
                CustomField(
                  prefix: AssetsManager.lock,
                  hint: "password".tr(),
                  controller: passwordcontroller,
                  ispassword: true,
                  keyboard: TextInputType.visiblePassword,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "shouldempty".tr();
                    }
                    if (value.length < 8) {
                      return "Password must not be less than 8 charater".tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: 17.8.h),
                TextButton(
                  onPressed: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "forgetpassword".tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                SizedBox(height: 33.26.h),
                Container(
                  width: double.infinity,
                  child: CustomButton("login".tr(), () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesManager.homescreen,
                      );
                    }
                  }),
                ),
                SizedBox(height: 22.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "haveaccount".tr(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorsManager.whitecolor,
                        fontSize: 15.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RoutesManager.regiterscreen,
                        );
                      },
                      child: Text(
                        "createone".tr(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: 130.w,
                        child: Divider(
                          color: ColorsManager.primarycolor,
                          thickness: 1,
                          endIndent: 10,
                          indent: 11,
                        ),
                      ),
                    ),
                    Text(
                      "or".tr(),
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(fontSize: 15.sp),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 130.w,
                        child: Divider(
                          color: ColorsManager.primarycolor,
                          thickness: 1,
                          endIndent: 10,
                          indent: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28.h),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: ColorsManager.primarycolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetsManager.google,
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "google".tr(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 33.16.h),
                CustomSwitch(
                  onChange: (value) {
                    setState(() {
                      selectedlanguage = value;
                      if (selectedlanguage == 1) {
                        context.setLocale(Locale("ar"));
                      } else {
                        context.setLocale(Locale("en"));
                      }
                    });
                  },
                  icons: [
                    SvgPicture.asset(AssetsManager.lr, height: 30, width: 30),
                    //0
                    SvgPicture.asset(AssetsManager.eg, height: 30, width: 30),
                    //1
                  ],
                  current: selectedlanguage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
