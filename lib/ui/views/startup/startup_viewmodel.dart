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
    await Future.delayed(const Duration(seconds: 1));
    if(FirebaseAuth.instance.currentUser==null) {
      _navigationService.replaceWith(Routes.onBoardingView);
      return;
    } else {

      ///user is login but doesn't exist on db.
      if(!(await _userService.currentUserExistsInDB())){
        await _userService.updateCurrentUser(AppUser(id: FirebaseAuth.instance.currentUser!.uid, profiles: [], email: FirebaseAuth.instance.currentUser!.email!));
      _navigationService.replaceWith(Routes.addProfileView,arguments: const AddProfileViewArguments(nextRoute: Routes.dashboardView));
      return;
      }

      ///user is login and exists on db.
      else{

        await _userService.loadCurrentUser();

        if(_userService.myUser!.profiles.isEmpty){
          _navigationService.replaceWith(Routes.addProfileView,arguments: const AddProfileViewArguments(nextRoute: Routes.dashboardView));
        }

        else{
          _navigationService.replaceWith(Routes.selectProfileView);
        }


      }

    }

  }
}

