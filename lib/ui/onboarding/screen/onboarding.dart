import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_final_project/core/resources/AssetsManager.dart';
import 'package:movies_final_project/core/resources/ColorsManager.dart';
import 'package:movies_final_project/core/resources/Routes.dart';
import 'package:movies_final_project/core/resources/StringsManager.dart';
import 'package:movies_final_project/core/reusable_componets/custom_button.dart';
import 'package:movies_final_project/model/onboarding-model.dart';
import 'package:movies_final_project/ui/onboarding/widget/onboarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pagecontroller = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Movie> movies = [
      Movie(
        post: AssetsManager.screen1,
        color: Color(0Xff084250),
        description: StringsManager.desc1,
        title: StringsManager.title1,
      ),
      Movie(
        post: AssetsManager.screen2,
        color: Color(0xff85210E),
        description: StringsManager.desc2,
        title: StringsManager.title2,
      ),
      Movie(
        post: AssetsManager.screen3,
        color: Color(0xff4C2471),
        description: StringsManager.desc3,
        title: StringsManager.title3,
      ),
      Movie(
        post: AssetsManager.screen4,
        color: Color(0xff601321),
        description: StringsManager.desc4,
        title: StringsManager.title4,
      ),
      Movie(
        post: AssetsManager.screen5,
        color: Color(0xff2A2C30),
        description: "",
        title: StringsManager.title5,
      ),
    ];
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pagecontroller,
              itemCount: movies.length,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) =>
                  OnboardingWidget(movie: movies[index]),
            ),
          ),

          if (currentPageIndex == 0)
            Container(
              padding: REdgeInsets.all(16),
              width: double.infinity,
              child: CustomButton(StringsManager.next, () {
                pagecontroller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }),
            )
          else
            Padding(
              padding: REdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: CustomButton(
                      currentPageIndex == movies.length - 1
                          ? StringsManager.finish
                          : StringsManager.next,
                      () {
                        if (currentPageIndex == movies.length - 1) {
                          Navigator.pushReplacementNamed(
                            context,
                            RoutesManager.loginscreen,
                          );
                        } else {
                          pagecontroller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 12.h),

                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        pagecontroller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.darkbackgroundcolor,
                        side: BorderSide(color: ColorsManager.primarycolor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                      ),
                      child: Text(StringsManager.back,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorsManager.primarycolor),)
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
