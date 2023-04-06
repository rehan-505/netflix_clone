import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/auth_service.dart';

abstract class AuthenticationViewModel extends FormViewModel {

  final AuthService authService = locator<AuthService>();

  final navigationService = locator<NavigationService>();
  AuthenticationViewModel();

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }


  Future<bool> saveData() async {
    try {
      return await runBusyFuture(runAuthentication(), throwException: true );

      // await _handleAuthenticationResponse(result);
    }
    on FirebaseAuthException catch(e){
      setValidationMessage(e.message);
      return false;
    }

    catch ( e) {
      setValidationMessage(e.toString());
      return false;
    }
  }

  Future<bool> runAuthentication();
}
