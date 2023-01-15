import 'package:firebase_auth/firebase_auth.dart';
import 'package:netflix_clone/models/profile.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/bottom_navbar_service.dart';
import '../../../services/current_user_service.dart';

class MoreViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final CurrentUserService _userService = locator<CurrentUserService>();
  final BottomNavbarService _navbarService = locator<BottomNavbarService>();

  CurrentUserService get userService => _userService;


  void logout() async{
    await runBusyFuture(userService.signOut());
    _navigationService.clearStackAndShow(Routes.onBoardingView);
  }

  void navigateToManageProfile() async{
    await _navigationService.navigateToSelectProfileView(onlyEditClickedView: true);
    notifyListeners();
  }

  void navigateToAddProfile() async{
    await _navigationService.navigateToAddProfileView();
    notifyListeners();
  }


  void changeCurrentProfile(Profile profile){
    _userService.changeCurrentProfile(profile);
    _navigationService.clearStackAndShow(Routes.dashboardView);
    _navbarService.jumpToHome();
  }
}
