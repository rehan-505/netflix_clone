import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/ui/common/app_colors.dart';
import 'package:netflix_clone/ui/common/decorations.dart';
import 'package:netflix_clone/ui/shared_widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../shared_widgets/custom_app_bar.dart';
import 'edit_profile_viewmodel.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    OutlineInputBorder _border = outlineInputBorderKcLightGrey.copyWith(
        borderSide: const BorderSide(color: Colors.black),
    );

    return ViewModelBuilder<EditProfileViewModel>.reactive(
      viewModelBuilder: () => EditProfileViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcBackgroundColor,
        body: Padding(

          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              50.verticalSpace,
              CustomAppBar(text: "Edit Profile", onBackPressed: (){},),
              30.verticalSpace,
              Image.asset("assets/images/profile_avatars/img_1.png",
                height: 100.h,
                width: 100.h,
                fit: BoxFit.fill,


              ),
              30.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: TextFormField(
                  controller: model.controller,
                  onChanged: model.validate,
                  decoration:  InputDecoration(
                    errorText: model.errorText,
                    border: outlineInputBorderKcLightGrey,
                    enabledBorder: _border,
                    focusedBorder: _border,
                    errorBorder: _border,
                    focusedErrorBorder: _border,
                    hintText: "Profile Name",
                    filled: true,
                    fillColor: Colors.grey[900],
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7))
                  ),


                ),
              ),
              50.verticalSpace,
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 100.w),
                child:  CustomButton(mainButtonTitle: "Save", busy: false,
                borderRadius: BorderRadius.circular(4),
                  onPressed: model.saveData,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
