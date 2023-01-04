import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/enums/auth_screen_type.dart';
import 'package:netflix_clone/ui/common/app_colors.dart';
import 'package:netflix_clone/ui/shared_widgets/authentication_layout.dart';
import 'package:netflix_clone/ui/shared_widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: AuthenticationLayout(
          mainButtonTitle: "Sign In",
          authScreenType: AuthScreenType.login,
          onMainButtonPressed: model.saveData,
          onBackPressed: () {},
          busy: model.isBusy,
          form: Column(
            children: [
              CustomTextField(
                textInputAction: TextInputAction.next,
                textEditingController: model.emailController,
                onSubmit: model.onEmailFieldSubmit,
                onTap: model.onEmailFieldTapped,
                focusNode: model.emailFocusNode,
                errorText: model.emailErrorText,
                labelText: 'EMAIL ADDRESS',
                suffixIcon: const Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                onChanged: model.validateEmail,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                  textEditingController: model.passController,
                  onSubmit: model.onPassFieldSubmit,
                  onTap: model.onPassFieldTapped,
                  focusNode: model.passFocusNode,
                  obscureText: model.passVisible,
                  labelText: "PASSWORD",
                  errorText: model.passErrorText,
                  onChanged: model.validatePass,
                  suffixIcon: InkWell(
                      onTap: model.eyePressed,
                      child: Icon(
                        Icons.remove_red_eye,
                        color: model.passVisible
                            ? Colors.grey
                            : kcPrimaryColor.withOpacity(0.7),
                      ))),
            ],
          ),
          showTerms: true,
          alternateText: "New to Netflix? Sign up now.",
          validationMsg: model.validationMessage,
        ),
      ),
    );
  }
}
