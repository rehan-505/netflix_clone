
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/ui/common/app_styles.dart';
import 'package:netflix_clone/ui/shared_widgets/custom_app_bar.dart';
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
        appBar: CustomAppBar(title: "Profiles & More"),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
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

                        bool selectedProfile = model.userService.currentProfile!.id==profile?.id;


                        return Padding(
                          padding:  EdgeInsets.only(right: 10.w ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              isLastIndex
                                  ? InkWell(onTap: model.navigateToAddProfile,

                                    child: Container(
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
                                      ),
                                  )
                                  : InkWell(
                                   onTap: (){
                                     model.changeCurrentProfile(profile!);
                                   },
                                    child: Container(
                                      height: selectedProfile ? 65.h : 60.h,
                                      width: selectedProfile ? 65.h : 60.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(profile!.assetImg),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(color: Colors.white,width: selectedProfile ? 3.r : 0),
                                        borderRadius: BorderRadius.circular(4.r),
                                      ),
                                    ),
                                  ),
                              (selectedProfile ? 5 : 10).verticalSpace,
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
                InkWell(
                  onTap: model.navigateToManageProfile,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset("assets/images/svg/edit_icon.svg"),
                      8.horizontalSpace,
                      Text("Manage Profiles", style: heading3Style.copyWith(fontSize: 16.sp,color: Colors.white.withOpacity(0.8)),),
                    ],
                  ),
                ),
                35.verticalSpace,
                _buildTile(iconData: Icons.playlist_add_check, title: "My List",onTap : model.navigateToMyList),
                _buildTile(iconData: Icons.person_outline, title: "Account",onTap: model.navigateToMyAccount),
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
      ),
    );
  }

  Widget _buildTile({required IconData iconData, required String title,void Function()? onTap} ){
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
