import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_final_project/core/resources/AssetsManager.dart';
import 'package:movies_final_project/core/resources/ColorsManager.dart';
import 'package:movies_final_project/core/resources/StringsManager.dart';
import 'package:movies_final_project/core/reusable_componets/custom_button.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AssetsManager.poster, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: REdgeInsets.only(top: 647, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    StringsManager.startsreen,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    StringsManager.startsreen2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(width: double.infinity,
                      child: CustomButton("Explore Now", () {})),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
