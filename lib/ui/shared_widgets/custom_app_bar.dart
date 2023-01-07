import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, this.onBackPressed, required this.text}) : super(key: key);

  final void Function()? onBackPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        InkWell(
            onTap: onBackPressed,
            child: const Icon(Icons.arrow_back, color: Colors.white,)),
        15.horizontalSpace,
        Text(text, style: heading3Style,)
      ],
    );
  }
}
