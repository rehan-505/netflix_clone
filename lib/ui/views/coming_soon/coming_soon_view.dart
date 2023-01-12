import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/svg.dart';
import 'coming_soon_viewmodel.dart';

class ComingSoonView extends StatelessWidget {
  const ComingSoonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ComingSoonViewModel>.reactive(
      viewModelBuilder: () => ComingSoonViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black12,
          title: Row(
            children: [
              Text(
                "New & Hot",
                style: heading3Style,
              ),
              // const Icon(Icons.arrow_back),
              const Spacer(),
              ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Image.asset(
                    "assets/images/profile_avatars/blue.png",
                    scale: 12.r,
                  )),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Colors.white),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/images/svg/popcorn-svgrepo-com (1).svg",
                      height: 25.h,
                      width: 25.w,
                      fit: BoxFit.cover,
                    ),
                    5.horizontalSpace,
                    Text(
                      "Coming Soon",
                      style: heading3Style.copyWith(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ),
              10.verticalSpace,
              Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (conntext, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Jan",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  5.verticalSpace,
                                  const Text("20",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                              10.horizontalSpace,
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.asset(
                                      'assets/posters/dogs.jpg',
                                      height: 200.h,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                  5.verticalSpace,
                                  Row(
                                    children: [
                                      Text("How to Sell Drugs"),
                                      Spacer(),
                                      Icon(
                                        Icons.info_outline_rounded,
                                        color: Colors.white,
                                      ),
                                      0.horizontalSpace
                                    ],
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    "Coming January 20",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    "dummy " * 20,
                                    style: captionStyleGrey,
                                  ),
                                ],
                              ))
                            ],
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
