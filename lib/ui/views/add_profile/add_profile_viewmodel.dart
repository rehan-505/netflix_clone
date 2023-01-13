import 'package:netflix_clone/models/profile.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/current_user_service.dart';
import '../../../utils/global_functions.dart';

class AddProfileViewModel extends BaseViewModel {

  final NavigationService navigationService = locator<NavigationService>();
  final CurrentUserService userService = locator<CurrentUserService>();
  final String? nextRoute;

  AddProfileViewModel({this.nextRoute});

  late String imgPath;

  String? errorText;
  final TextEditingController controller = TextEditingController();

  void getImgPath(){
    imgPath = userService.getNewProfileImgPath();
  }

  Future<void> saveData() async{

    if(controller.text.trim().isEmpty ) {
      errorText = "Name cannot be empty";
      notifyListeners();
    }

    if(controller.text.trim().isEmpty || errorText!=null){
      return;
    }

    // await runBusyFuture(Future.delayed(const Duration(seconds: 3)));




    await runBusyFuture(userService.addProfile(Profile(id: "profile_${userService.myUser!.profiles.length}", assetImg: userService.getNewProfileImgPath(), name: controller.text, moviesList: [])));

    if(nextRoute!=null){
      navigationService.replaceWith(nextRoute!);
    }
    else{
      navigationService.back(result: true);
    }


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
