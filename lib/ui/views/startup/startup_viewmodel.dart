import 'package:stacked/stacked.dart';
import 'package:netflix_clone/app/app.locator.dart';
import 'package:netflix_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    if(FirebaseAuth.instance.currentUser==null) {
      _navigationService.navigateToLoginView();
    } else {
      _navigationService.navigateToSelectProfileView();
    }

  }
}

