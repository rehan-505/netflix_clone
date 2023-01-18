import 'package:netflix_clone/models/app_user.dart';
import 'package:netflix_clone/services/current_user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:netflix_clone/app/app.locator.dart';
import 'package:netflix_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final CurrentUserService _userService = locator<CurrentUserService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 2));
    if (FirebaseAuth.instance.currentUser == null) {
      _navigationService.replaceWith(Routes.onBoardingView);
      return;
    } else {
      await _userService.loadCurrentUser();

      ///user has no profiles setup
      if (_userService.myUser!.profiles.isEmpty) {
        navigateToAddProfile();

      } else {
        _navigationService.replaceWith(Routes.selectProfileView);
      }
    }
  }

  void navigateToAddProfile(){
    _navigationService.replaceWith(Routes.addProfileView,
        arguments:
        const AddProfileViewArguments(nextRoute: Routes.dashboardView));
  }


}
