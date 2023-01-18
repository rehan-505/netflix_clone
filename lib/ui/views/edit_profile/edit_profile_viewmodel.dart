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
  final CurrentUserService _userService = locator<CurrentUserService>();



  final NavigationService navigationService = locator<NavigationService>();
  String? errorText;
  final TextEditingController controller = TextEditingController();

  Future<void> deleteProfile() async{
    if(!isCurrentProfile()){
      await runBusyFuture((_userService.deleteProfile(profile)));
      navigationService.back(result: true);
    }
  }

  bool isCurrentProfile(){
    return _userService.currentProfile?.id == profile.id;
  }


  Future saveData() async{

    if(controller.text.trim().isEmpty ) {
      errorText = "Name cannot be empty";
      notifyListeners();
    }

    if(controller.text.trim().isEmpty || errorText!=null){
      return false;
    }

    await runBusyFuture(_userService.renameProfile(profile.copyWith(name: controller.text)),throwException: true);

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
