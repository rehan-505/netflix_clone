import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class OnBoardingViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  int currentIndex = 0;

  modifyIndex(int index){

    currentIndex = index;
    print(index);

    notifyListeners();
  }

  void navigateToLogin(){
    _navigationService.replaceWith(Routes.loginView);
  }

  void navigateToSignup(){
    _navigationService.replaceWith(Routes.signupView);
  }



}
