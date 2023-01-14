
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/models/app_user.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/current_user_service.dart';
import '../../../utils/global_functions.dart';
import '../../base/authentication_viewmodel.dart';

class LoginViewModel extends AuthenticationViewModel{
  LoginViewModel() : super();


  bool passVisible = true;
  String? emailErrorText;
  String? passErrorText;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();

  final CurrentUserService _userService = locator<CurrentUserService>();




  eyePressed(){

    if(passFocusNode.hasFocus){
      passVisible = !passVisible;
      notifyListeners();
    }
  }


  @override
  Future<bool> runAuthentication() async{

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

    if(await authService.signInWithEmailAndPass(emailController.text, passController.text)){

      ///if current user doesn't exist in db, create it
      if(!(await _userService.currentUserExistsInDB())){
        await _userService.updateCurrentUser(AppUser(id: FirebaseAuth.instance.currentUser!.uid, profiles: [], email: FirebaseAuth.instance.currentUser!.email!));
        navigationService.replaceWith(Routes.addProfileView,arguments: const AddProfileViewArguments(nextRoute: Routes.homeView));

      }
      else{
        await _userService.loadCurrentUser();
        navigationService.replaceWith(Routes.selectProfileView);

      }

      return true;

    }

    return false;
  }

  void navigateToSignUp() =>
      navigationService.replaceWith(Routes.signupView);

  void navigateToForgotPass() =>
      navigationService.navigateTo(Routes.forgotPassView);


  void validateEmail(String? x){
    emailErrorText = emailValidation(x);
    notifyListeners();



  }

  void validatePass(String? x){
    passErrorText = passwordValidation(x);
    notifyListeners();
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

  void navigateBack(){
    navigationService.back();
  }



}

