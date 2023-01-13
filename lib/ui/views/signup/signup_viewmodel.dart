
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/models/app_user.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/current_user_service.dart';
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

  final CurrentUserService _userService = locator<CurrentUserService>();



  void eyePressed(){

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

      await _userService.updateCurrentUser(AppUser(id: FirebaseAuth.instance.currentUser!.uid, profiles: [], email: emailController.text.trim(),));
      navigationService.navigateTo(Routes.addProfileView,arguments: const AddProfileViewArguments(nextRoute: Routes.homeView));


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
