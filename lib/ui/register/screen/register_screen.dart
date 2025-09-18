import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_final_project/core/resources/AssetsManager.dart';
import 'package:movies_final_project/core/resources/ColorsManager.dart';
import 'package:movies_final_project/core/reusable_componets/custom_button.dart';
import 'package:movies_final_project/core/reusable_componets/custom_field.dart';

import '../../../core/resources/Routes.dart';
import '../../../core/resources/constants.dart';
import '../../../core/reusable_componets/custom_switch.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int currentIndex = 0;

  final List<String> avatars = [
    AssetsManager.avatar1,
    AssetsManager.avatar2,
    AssetsManager.avatar3,
  ];
  int selectedlanguage = 0;
  late TextEditingController emailcontroller;
  late TextEditingController passwordcontroller;
  late TextEditingController namecontroller;
  late TextEditingController repasscontroller;
  late TextEditingController phonecontroller;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    namecontroller = TextEditingController();
    repasscontroller = TextEditingController();
    phonecontroller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    namecontroller = TextEditingController();
    repasscontroller = TextEditingController();
    phonecontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsManager.primarycolor),
        centerTitle: true,
        title: Text(
          "register".tr(),
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(color: ColorsManager.primarycolor),
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    viewportFraction: 0.3,
                    height: 120,
                    autoPlay: false,
                    aspectRatio: 16 / 9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  itemCount: avatars.length,
                  itemBuilder: (context, index, realIndex) {
                    return CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(avatars[index]),
                    );
                  },
                ),

                CustomField(
                  prefix: AssetsManager.contact,
                  hint: "name".tr(),
                  keyboard: TextInputType.name,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "shouldempty".tr();
                    }
                    return null;
                  },
                  ispassword: false,
                  controller: namecontroller,
                ),
                SizedBox(height: 24.h),

                CustomField(
                  prefix: AssetsManager.email,
                  hint: "email".tr(),
                  keyboard: TextInputType.name,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "shouldempty".tr();
                    }
                    if (!RegExp(emailRegex).hasMatch(value)) {
                      return "email not valid".tr();
                    }
                    return null;
                  },
                  ispassword: false,
                  controller: emailcontroller,
                ),
                SizedBox(height: 24.h),

                CustomField(
                  prefix: AssetsManager.lock,
                  hint: "password".tr(),
                  keyboard: TextInputType.visiblePassword,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "shouldempty".tr();
                    }
                    if (value.length < 8) {
                      return "Password must not be less than 8 charater";
                    }
                    return null; //password is correct
                  },
                  ispassword: true,
                  controller: passwordcontroller,
                ),
                SizedBox(height: 24.h),

                CustomField(
                  prefix: AssetsManager.lock,
                  hint: "repassword".tr(),
                  keyboard: TextInputType.visiblePassword,
                  validation: (value) {
                    if (value != passwordcontroller.text) {
                      return "Must be same";
                    }
                    return null;
                  },
                  ispassword: true,
                  controller: repasscontroller,
                ),
                SizedBox(height: 24.h),

                CustomField(
                  prefix: AssetsManager.phone,
                  hint: "phone".tr(),
                  keyboard: TextInputType.phone,
                  validation: (value) {
                    {
                      if (value == null || value.isEmpty) {
                        return "shouldempty".tr();
                      }

                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return "phone_not_valid";
                      }
                      if (value.length != 11) {
                        return "phone_length";
                      }
                      return null;
                    }
                  },
                  ispassword: false,
                  controller: phonecontroller,
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  child: CustomButton("createaccount".tr(), () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesManager.homescreen,
                      );
                    }
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account".tr(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorsManager.whitecolor,
                        fontSize: 15.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesManager.loginscreen);
                      },
                      child: Text(
                        "login".tr(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
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
