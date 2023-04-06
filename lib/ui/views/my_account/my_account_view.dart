import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/ui/common/app_colors.dart';
import 'package:netflix_clone/ui/common/app_styles.dart';
import 'package:netflix_clone/ui/shared_widgets/custom_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'my_account_viewmodel.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyAccountViewModel>.reactive(
      viewModelBuilder: () => MyAccountViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppBar(title: "My Account"),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              Row(
                children: [
                  const Icon(Icons.video_collection, color: kcPrimaryColor,),
                  10.horizontalSpace,
                  Text("Member Since ${model.getJoiningDate()}",style: captionStyleGrey.copyWith(fontSize: 14.sp, color: Colors.white.withOpacity(0.8)),),
                ],
              ),
              20.verticalSpace,
              const Text("Email",style: captionStyle,),
              2.verticalSpace,
              Text(model.getEmail(), style: heading3Style.copyWith(fontSize: 16.sp),),
              20.verticalSpace,
              Text("Visit your account information on netflix.com to update your payment details, change your plan and other account management features.",
              style: captionStyleGrey.copyWith(fontSize: 14.sp, color: Colors.white.withOpacity(0.8)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
