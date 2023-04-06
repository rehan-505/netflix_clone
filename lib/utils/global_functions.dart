import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String? emailValidation(String? x) {
  if (x == null || x.isEmpty) {
    return "Email is required";
  }

  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(x)) {
    return "Enter a valid email address";
  }
  return null;
}


String? passwordValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is Required';
  }
  if (value.length < 6) {
    return 'Password Must be greater than 6 characters';
  }
  return null;
}

String? generalValidation(String? value, {String fieldName = 'Field'}) {
  if (value == null || value.isEmpty) {
    return '$fieldName cannot be empty';
  }
  return null;
}

SvgPicture buildNLogo({double? height, double? width}){
  return SvgPicture.asset("assets/images/svg/n_logo.svg", height: height ?? 45.h, width: width ?? 30.w, );
}

