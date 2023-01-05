import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/app_colors.dart';
import '../common/decorations.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.errorText,
      this.labelText,
      this.hintText,
      this.onChanged,
      this.obscureText = false,
      this.suffixIcon, required this.focusNode, this.onTap, this.onSubmit, required this.textEditingController, this.textInputAction})
      : super(key: key);

  final String? errorText;
  final String? labelText;
  final String? hintText;
  final void Function(String?)? onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final FocusNode focusNode;
  final void Function()? onTap;
  final void Function(String?)? onSubmit;
  final TextEditingController textEditingController;
  final TextInputAction? textInputAction;




  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: TextFormField(
            controller: textEditingController,
            onTap: onTap,
            onFieldSubmitted: onSubmit,
            textInputAction: textInputAction,

            focusNode: focusNode,
            // cursorHeight: 30.h ,
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white),


            obscureText: obscureText,
            decoration: InputDecoration(
              floatingLabelStyle: const TextStyle(
                color: Colors.red,
                fontSize: 12
              ),


              // floatingLabelBehavior: FloatingLabelBehavior.never,
              // floatingLabelAlignment: FloatingLabelAlignment.center,
              label: labelText != null
                  ? Text(
                      labelText!,
                      style:  TextStyle(
                        fontSize: (textEditingController.text.isNotEmpty || focusNode.hasFocus) ? 12 : 16,
                        color: focusNode.hasFocus? Colors.white :Colors.grey
                      ),
                    )
                  : null,
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: suffixIcon,
              filled: true,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              border: InputBorder.none,
              disabledBorder:InputBorder.none ,
              focusedErrorBorder: InputBorder.none,
              // enabledBorder: outlineInputBorderKcLightGrey,
              // focusedBorder: outlineInputBorderKcLightGrey,
              // errorBorder: outlineInputBorderKcLightGrey,
              // border: outlineInputBorderKcLightGrey,b
              fillColor: focusNode.hasFocus ? Colors.grey[700] : Colors.grey[800]!.withOpacity(1)
            ),
            onChanged: onChanged,
          ),
        ),
        if(errorText!=null)
          Padding(
            padding:  EdgeInsets.only(top: 12.h, left: 5.w),
            child: Text(errorText!, style:  TextStyle(color: Colors.red, fontSize: 12.sp),),
          )
      ],
    );
  }
}
