import 'package:flutter/material.dart';
import 'package:netflix_clone/enums/auth_screen_type.dart';
import 'package:netflix_clone/ui/shared_widgets/authentication_layout.dart';
import 'package:netflix_clone/ui/shared_widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import 'forgot_pass_viewmodel.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPassViewModel>.reactive(
      viewModelBuilder: () => ForgotPassViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: AuthenticationLayout(
          mainButtonTitle: "Send Reset Email",
          authScreenType: AuthScreenType.login,
          onMainButtonPressed: () async{
            bool result = await model.saveData();
            if(result){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Reset Email Sent")));
            }
          },
          onBackPressed: model.navigateBack,
          busy: model.isBusy,
          form: Column(
            children: [
              CustomAuthTextField(
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
            ],
          ),
          showTerms: true,
          alternateText: "New to Netflix? Sign up now.",
          validationMsg: model.validationMessage,
          onAlternateTextTapped: model.navigateToSignUp,

        ),
      ),
    );
  }
}
