import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_final_project/core/resources/ColorsManager.dart';

class CustomButton extends StatelessWidget {
String title;
void Function() onClick;
CustomButton(this.title,this.onClick);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primarycolor,
        padding: REdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15.r))
      ),
      child: Text(title,
          style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
