import 'package:flutter/material.dart';
import '../../../app/app.router.dart';
import '../../../utils/global_functions.dart';
import '../../base/authentication_viewmodel.dart';

class ForgotPassViewModel extends AuthenticationViewModel {
  String? emailErrorText;
  final TextEditingController emailController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();

  // final CurrentUserService _userService = locator<CurrentUserService>();


  @override
  Future<bool> runAuthentication() async{

    if(emailController.text.trim().isEmpty ) {
      emailErrorText = "Email is required";
      notifyListeners();
    }

    if(emailController.text.trim().isEmpty || emailErrorText!=null){
      return false;
    }

    if(await authService.sendResetEmail(emailController.text)){
      navigationService.back();
     return true;
    }

    return false;
  }

  void navigateToSignUp() =>
      navigationService.replaceWith(Routes.signupView);

  void navigateToForgotPass() =>
      navigationService.navigateTo(Routes.onBoardingView);


  void validateEmail(String? x){
    emailErrorText = emailValidation(x);
    notifyListeners();



  }

  void onEmailFieldTapped(){
    if(!emailFocusNode.hasFocus){
      notifyListeners();
    }
  }

  void onEmailFieldSubmit(String? v){
    notifyListeners();
  }

  void navigateBack(){
    navigationService.back();
  }

}
