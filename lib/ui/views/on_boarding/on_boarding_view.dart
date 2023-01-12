import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';
import '../../../utils/global_functions.dart';
import '../../common/app_colors.dart';
import 'on_boarding_constants.dart';
import 'on_boarding_viewmodel.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardingViewModel>.nonReactive(
      viewModelBuilder: () => OnBoardingViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: kcBackgroundColor,
          body: Stack(
            children: [

              PageView.builder(
                  onPageChanged: model.modifyIndex,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return _buildLayout(context, index,
                        model,
                        titleText: OnBoardingConstants.titlesList[index],
                        subtitle: OnBoardingConstants.subtitles[index],
                        imgPath: OnBoardingConstants.images[index],);
                  }),

              Positioned(
                bottom: 20.h,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const OnBoardingDots(),
                      20.verticalSpace,
                      GestureDetector(
                        onTap: model.navigateToSignup,
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: kcPrimaryColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "GET STARTED",
                            style: buttonHeadingStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                decoration:  const BoxDecoration(
                  // color: Colors.black38,
                  boxShadow: [BoxShadow(color: Colors.black45,offset: Offset(20, 20), blurRadius: 15,spreadRadius: 30 )]

                ),
                child: Padding(
                  padding:  EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                  child: Row(
                    children: [
                      buildNLogo(),
                      const Spacer(),
                      InkWell(
                          onTap: model.navigateToLogin,
                          child: Text("SIGN IN", style: heading3Style,)),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: resHeight(context, 80),)
            ],
          ),
        ),
      ),
    );
  }

  _buildLayout(BuildContext context, int index, OnBoardingViewModel model,
      {required String titleText,
      required String subtitle,
      required String imgPath}) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 12,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:  EdgeInsets.only(bottom: index==0? 0.h : 20.h),
                  child: Image.asset(imgPath,
                    height: index==0? double.infinity : null,
                    width: index==0? double.infinity : null,
                    fit: index==0? BoxFit.cover : null,

                  ),
                ),
              )),
          Expanded(
            flex: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 55.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    titleText,
                    style: headlineStyle,
                    textAlign: TextAlign.center,
                  ),
                  20.verticalSpace,
                  Text(subtitle,
                      style: bodyStyleWhite70, textAlign: TextAlign.center),
                   140.verticalSpace
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingDots extends ViewModelWidget<OnBoardingViewModel> {
  const OnBoardingDots({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, OnBoardingViewModel viewModel) {
    return SizedBox(
      height: 5,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child:
                  _buildDot(active: i == viewModel.currentIndex ? true : false),
            );
          }),
    );
  }

  Widget _buildDot({bool active = false}) {
    return Icon(
      Icons.circle,
      color: active ? Colors.white : Colors.grey,
      size: 11.w,
    );
  }
}
