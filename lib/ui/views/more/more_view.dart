
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/ui/common/app_colors.dart';
import 'package:netflix_clone/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/profile.dart';
import 'more_viewmodel.dart';

class MoreView extends StatelessWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MoreViewModel>.reactive(
      viewModelBuilder: () => MoreViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: kcBackgroundColor,
          elevation: 0,
          title: const Text("Profiles & More",style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.verticalSpace,
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                    itemCount: (!(model.userService.myUser!.profiles.length > 4))
                        ? model.userService.myUser!.profiles.length + 1
                        : model.userService.myUser!.profiles.length,
                    itemBuilder: (context, index) {

                      Profile? profile;

                      bool isLastIndex =
                      (index == model.userService.myUser!.profiles.length);

                      if (!isLastIndex) {
                        profile = model.userService.myUser!.profiles[index];
                      }


                      return Padding(
                        padding:  EdgeInsets.only(right: 10.w ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            isLastIndex
                                ? Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 0.5),
                                        borderRadius: BorderRadius.circular(7.r)),
                                    height: 60.h,
                                    width: 60.h,
                                    child: Center(
                                        child: Icon(
                                      Icons.add,
                                      size: 60.h,
                                      color: Colors.white,
                                    )),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(4.r),
                                    child: Image.asset(
                                      profile!.assetImg,
                                      height: 60.h,
                                      width: 60.h,
                                    )),
                            10.verticalSpace,
                            Text(
                              isLastIndex ? "Add" :
                              profile!.name,
                              style: captionStyleGrey,
                            )
                          ],
                        ),
                      );
                    }),
              ),
              20.verticalSpace,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset("assets/images/svg/edit_icon.svg"),
                  8.horizontalSpace,
                  Text("Manage Profiles", style: heading3Style.copyWith(fontSize: 16.sp,color: Colors.white.withOpacity(0.8)),),
                ],
              ),
              35.verticalSpace,
              _buildTile(iconData: Icons.playlist_add_check, title: "My List"),
              _buildTile(iconData: Icons.person_outline, title: "Account"),
              50.verticalSpace,
              model.isBusy ? SizedBox(
                  height: 50.h,
                  child: const Center(child: CircularProgressIndicator(),)) :
              InkWell(
                  onTap: model.logout,
                  child: Text("Sign Out", style: TextStyle(color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.w600),))


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile({required IconData iconData, required String title} ){
    return Container(
      margin: EdgeInsets.only(bottom: 7.h),
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          10.horizontalSpace,
          Icon(iconData, color: Colors.white,size: 30.r),
          12.horizontalSpace,
          Text(title, style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.sp),),
          const Spacer(),
          Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey, size: 20.r,),
          12.horizontalSpace,


        ],
      ),
    );
  }
}
