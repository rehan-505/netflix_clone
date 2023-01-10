import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared_widgets/custom_app_bar.dart';
import 'select_profile_viewmodel.dart';

class SelectProfileView extends StatelessWidget {
  const SelectProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectProfileViewModel>.reactive(
      viewModelBuilder: () => SelectProfileViewModel(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: model.willPopScope,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                50.verticalSpace,
                model.editClicked ?
                CustomAppBar(text: "Manage Profiles", onBackPressed: model.onBackPressed,) :
                _buildAppbarV2(model),
                100.verticalSpace,
                AnimatedOpacity(
                  opacity: (!(model.editClicked)) ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Text("Who's Watching?", style: bodyStyle16,),
                ),
                30.verticalSpace,
                Expanded(
                    child: _buildProfileIconsGrid(model)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppbarV2(SelectProfileViewModel model){
    return                 Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
            visible: false,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: SvgPicture.asset("assets/images/svg/edit.svg")),
        SvgPicture.asset("assets/images/svg/logo.svg"),
        InkWell(
            onTap: model.onEditClicked,
            child: SvgPicture.asset("assets/images/svg/edit.svg")),
      ],
    );
  }

  Widget _buildProfileIconsGrid(SelectProfileViewModel model){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 42.w),
      child: GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: 5,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisSpacing: 0.w,
              crossAxisCount: 2,
              mainAxisSpacing: 20.h,
              childAspectRatio: 1
          ),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                index == 4 ? Container(
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(7.r)
                  ),
                  height: 100.h,
                  width: 100.h,
                  child: Center(child:  Icon(Icons.add, size: 60.h,color: Colors.white,)),
                ) :
                Stack(
                  alignment: Alignment.center,
                  children: [



                    Image.asset(
                      "assets/images/profile_avatars/img_${index.toString()}.png",
                      height: 100.h,
                      width: 100.h,
                      fit: BoxFit.fill,

                    ),
                    if(model.editClicked)
                      Container(
                        height: 100.h,
                        width: 100.h,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    if(model.editClicked)

                      SvgPicture.asset("assets/images/svg/edit_icon.svg", height:30.h, width: 60.w,
                        // fit: BoxFit.fill,
                        // color: Colors.black,

                      )
                  ],
                ),
                8.verticalSpace,
                Text( index == 4 ? "Add Profile" : "Rehan", style: const TextStyle(color: Colors.white,
                    fontSize: 12
                ),)
              ],
            );
          }),
    );
  }
}