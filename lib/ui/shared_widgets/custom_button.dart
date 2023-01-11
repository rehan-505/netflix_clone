import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.mainButtonTitle, required this.busy, this.onPressed, this.borderRadius}) : super(key: key);

  final String mainButtonTitle;
  final bool busy;
  final void Function()? onPressed;
  final BorderRadius? borderRadius;



  @override
  Widget build(BuildContext context) {
    return  InkWell(

      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: kcBackgroundColor,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
        child: busy
            ? const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(kcPrimaryColor),
        )
            : Text(
          mainButtonTitle,
          style:  TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 20.sp),
        ),
      ),
    );
  }
}
