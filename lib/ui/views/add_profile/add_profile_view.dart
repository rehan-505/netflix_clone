import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/app_styles.dart';
import '../../common/decorations.dart';
import '../../shared_widgets/custom_app_bar.dart';
import '../../shared_widgets/custom_button.dart';
import 'add_profile_viewmodel.dart';

class AddProfileView extends StatelessWidget {
  const AddProfileView({Key? key, this.nextRoute, this.backIcon = false}) : super(key: key);

  final String? nextRoute;
  final bool backIcon;

  @override
  Widget build(BuildContext context){

    OutlineInputBorder _border = outlineInputBorderKcLightGrey.copyWith(
      borderSide: const BorderSide(color: Colors.black),
    );

    return ViewModelBuilder<AddProfileViewModel>.reactive(
      onModelReady: (model){
        model.getImgPath();
      },
      viewModelBuilder: () => AddProfileViewModel(nextRoute: nextRoute),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Add Profile", style: heading3Style,),
          elevation: 0,
          backgroundColor: kcBackgroundColor,
          automaticallyImplyLeading: false,
          leading: backIcon ? InkWell(
              onTap: model.navBack,
              child: const Icon(Icons.arrow_back)) : null,
        ),
        backgroundColor: kcBackgroundColor,
        body: Padding(

          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              // 50.verticalSpace,
              // CustomAppBar(text: "Add Profile", onBackPressed: (){},),
              10.verticalSpace,
              Image.asset(model.imgPath,
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
              (!model.isBusy) ?
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 100.w),
                child:  CustomButton(
                  mainButtonTitle: "Save", busy: false,
                  borderRadius: BorderRadius.circular(4),
                  onPressed: model.saveData,
                ),
              ) : SizedBox(
                height: 50.h,
                child: const Center(child: CircularProgressIndicator()),
              )

            ],
          ),
        ),
      ),
    );
  }
}
