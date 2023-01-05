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

  List<String> titlesList = [
    "Unlimited films, TV programmes & more",
    'Download and watch offline',
    'No annoying contracts',
    'Watch everywhere',

  ];

  List<String> subtitles = [
    "Watch anywhere. Cancel at any time.",
    "Always have something to watch offline.",
    "Join today, cancel at any\n time",
    "Stream on your phone, tablet, laptop, TV and more"
  ];

  List<String> images = [
    "assets/images/png/banner.png",
    "assets/images/png/download.png",

    "assets/images/png/celebrations.png",
    "assets/images/png/watch_anywhere.png",


  ];

  void navigateToLogin(){
    _navigationService.replaceWith(Routes.loginView);
  }

  void navigateToSignup(){
    _navigationService.replaceWith(Routes.signupView);
  }



}
