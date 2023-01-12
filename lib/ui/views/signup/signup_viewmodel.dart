
import 'package:flutter/material.dart';

import '../../../app/app.router.dart';
import '../../../utils/global_functions.dart';
import '../../base/authentication_viewmodel.dart';

class SignupViewModel extends AuthenticationViewModel {
  SignupViewModel() : super();


  bool passVisible = true;
  String? emailErrorText;
  String? passErrorText;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();



  eyePressed(){

    if(passFocusNode.hasFocus){
      passVisible = !passVisible;
      notifyListeners();
    }
  }


  @override
  Future runAuthentication() async{

    if(emailController.text.trim().isEmpty ) {
      emailErrorText = "Email is required";
      notifyListeners();
    }
    if (passController.text.trim().isEmpty ){
      passErrorText = "Password is required";
      notifyListeners();
    }

    if(emailController.text.trim().isEmpty|| passController.text.trim().isEmpty || passErrorText !=null || emailErrorText!=null){
      return false;
    }

    if(await authService.signUpWithEmailAndPass(emailController.text, passController.text)){
      navigationService.navigateTo(Routes.onBoardingView);
    }
  }

  void navigateToLogin() =>
      navigationService.replaceWith(Routes.loginView);

  void navigateToForgotPass() =>
      navigationService.navigateTo(Routes.onBoardingView);


  void validateEmail(String? x){
    emailErrorText = emailValidation(x);
    notifyListeners();



  }

  void validatePass(String? x){
    passErrorText = passwordValidation(x);
    notifyListeners();
  }

  void navigateToPhoneScreen(){
    // navigationService.navigateTo(Routes.phoneAuthView);
  }

  void onEmailFieldTapped(){
    if(!emailFocusNode.hasFocus){
      notifyListeners();
    }
  }

  void onPassFieldTapped(){
    if(!passFocusNode.hasFocus){
      notifyListeners();
    }

  }

  void onEmailFieldSubmit(String? v){
    notifyListeners();
  }

  void onPassFieldSubmit(String? v){
    notifyListeners();
  }


}
