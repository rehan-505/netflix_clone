import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/app/app.locator.dart';
import 'package:netflix_clone/models/profile.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/current_user_service.dart';
import '../../../utils/global_functions.dart';

class EditProfileViewModel extends BaseViewModel {
  EditProfileViewModel(this.profile) : super();



  final Profile profile;
  final CurrentUserService userService = locator<CurrentUserService>();



  final NavigationService navigationService = locator<NavigationService>();
  String? errorText;
  final TextEditingController controller = TextEditingController();
  bool loading = false;

  Future<void> deleteProfile() async{
    loading = true;
    notifyListeners();

    await userService.deleteProfile(profile);

    loading = false;
    notifyListeners();

  }


  Future saveData() async{

    if(controller.text.trim().isEmpty ) {
      errorText = "Name cannot be empty";
      notifyListeners();
    }

    if(controller.text.trim().isEmpty || errorText!=null){
      return false;
    }

    await runBusyFuture(userService.renameProfile(profile.copyWith(name: controller.text)),throwException: true);

    navigationService.back(result: true);
  }

  void setName(){
    controller.text = profile.name;
  }


  void validate(String? x){
    errorText = generalValidation(x,fieldName: "Name");
    notifyListeners();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}
