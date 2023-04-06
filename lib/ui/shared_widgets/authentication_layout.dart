import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone/enums/auth_screen_type.dart';
import 'package:netflix_clone/ui/shared_widgets/custom_button.dart';

import '../common/app_styles.dart';

class AuthenticationLayout extends StatelessWidget {
  const AuthenticationLayout({Key? key, this.onBackPressed, this.form, this.onMainButtonPressed, this.busy = false, required this.mainButtonTitle, required this.authScreenType,  this.alternateText, this.showTerms = false, this.validationMsg, this.onAlternateTextTapped, this.onForgotPassPressed}) : super(key: key);

  final void Function()? onBackPressed;
  final void Function()? onMainButtonPressed;
  final void Function()? onAlternateTextTapped;
  final void Function()? onForgotPassPressed;

  final AuthScreenType authScreenType;
  final String mainButtonTitle;
  final bool busy;
  final Widget? form;
  final String? alternateText;
  final bool showTerms;
  final String? validationMsg;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
      child: Column(
        children: [
          50.verticalSpace,
          Row(
            children: [
              if(onBackPressed!=null) InkWell(
                  onTap: onBackPressed,
                  child: const Icon(Icons.arrow_back, color: Colors.white,)),
              15.horizontalSpace,
              SvgPicture.asset("assets/images/svg/logo.svg"),

            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(form!=null) Padding(
                  padding: EdgeInsets.only(bottom: 40.h),
                  child: form!,
                ),
                if(validationMsg!=null && validationMsg!.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Text(validationMsg!,style: redStyle ,),
                  ),
                CustomButton(mainButtonTitle: mainButtonTitle, busy: busy,onPressed: onMainButtonPressed ),
                if(onForgotPassPressed != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                      child: InkWell(
                        onTap: onForgotPassPressed,
                        child: Text("Forgot Password?", style: subtitleStyle.copyWith(color: white70Style16w600.color),),
                      ),
                    ),
                  ),

                50.verticalSpace,
                if(alternateText!=null) Padding(
                  padding: EdgeInsets.only(bottom: 50.h),
                  child: InkWell(
                      onTap: onAlternateTextTapped,
                      child: Text(alternateText!, style: white70Style16w600,)),
                ),
                if(showTerms)  Text( "By signing ${ isLogin() ? "in" : "up"} you agree with our terms and conditions. ", style: subtitleStyle,),
              ],
            ),
          ),

        ],
      ),
    );
  }

  bool isSignUp(){
    return authScreenType==AuthScreenType.signup;
  }

  bool isLogin(){
    return authScreenType==AuthScreenType.login;
  }

}
