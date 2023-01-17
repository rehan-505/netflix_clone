import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/models/profile.dart';
import 'package:netflix_clone/ui/common/app_colors.dart';
import 'package:netflix_clone/ui/common/decorations.dart';
import 'package:netflix_clone/ui/shared_widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_styles.dart';
import 'edit_profile_viewmodel.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  Widget build(BuildContext context) {

    OutlineInputBorder _border = outlineInputBorderKcLightGrey.copyWith(
        borderSide: const BorderSide(color: Colors.black),
    );

    return ViewModelBuilder<EditProfileViewModel>.reactive(
      viewModelBuilder: () => EditProfileViewModel(profile),
      onModelReady: (model){
        model.setName();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcBackgroundColor,
        appBar: AppBar(
          actions: [
            // InkWell(
            //     onTap: (){
            //       model.deleteProfile();
            //     },
            //     child: const Icon(Icons.delete_forever, color: Colors.red,)),
            30.horizontalSpace,
          ],
          title: Text("Edit Profile", style: heading3Style,),
          elevation: 0,
          backgroundColor: kcBackgroundColor,
          automaticallyImplyLeading: false,
          leading:  InkWell(
              onTap: (){
                model.navigationService.back(result: false);
              },
              child: const Icon(Icons.arrow_back))
        ),
        body: Padding(

          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              10.verticalSpace,
              Image.asset(model.profile.assetImg,
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
                    hintStyle: normalStyleLowOpacity
                  ),


                ),
              ),
              50.verticalSpace,
              model.isBusy ? SizedBox(
                height: 50.h,
                child: const Center(child: CircularProgressIndicator()),
              ) :

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
