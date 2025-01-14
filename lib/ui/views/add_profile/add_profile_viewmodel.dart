import 'package:netflix_clone/models/profile.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import '../../../app/app.locator.dart';
import '../../../services/current_user_service.dart';
import '../../../utils/global_functions.dart';

class AddProfileViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final CurrentUserService _userService = locator<CurrentUserService>();
  final String? nextRoute;

  AddProfileViewModel({this.nextRoute});

  late String imgPath;

  String? errorText;
  final TextEditingController controller = TextEditingController();

  void getImgPath(){
    imgPath = _userService.getNewProfileImgPath();
  }

  Future<void> saveData() async{

    if(controller.text.trim().isEmpty ) {
      errorText = "Name cannot be empty";
      notifyListeners();
    }

    if(controller.text.trim().isEmpty || errorText!=null){
      return;
    }

    await runBusyFuture(_userService.addProfile(Profile(id: "profile_${_userService.getAvailableProfileSlot()}", assetImg: _userService.getNewProfileImgPath(), name: controller.text, moviesList: [])));

    if(nextRoute!=null){
      _navigationService.replaceWith(nextRoute!);
    }
    else{
      _navigationService.back(result: true);
    }


  }


  void validate(String? x){
    errorText = generalValidation(x,fieldName: "Name");
    notifyListeners();
  }

  void navBack(){
    _navigationService.back(result: false);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}
