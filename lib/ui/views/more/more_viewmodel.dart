import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/current_user_service.dart';

class MoreViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final CurrentUserService userService = locator<CurrentUserService>();


  logout() async{
    await runBusyFuture((FirebaseAuth.instance.signOut()),);
    _navigationService.clearStackAndShow(Routes.onBoardingView);
  }
}
