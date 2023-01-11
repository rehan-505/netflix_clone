import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../utils/global_functions.dart';

class EditProfileViewModel extends BaseViewModel {
  EditProfileViewModel() : super();


  final NavigationService navigationService = locator<NavigationService>();
  String? errorText;
  final TextEditingController controller = TextEditingController();

  Future saveData() async{

    if(controller.text.trim().isEmpty ) {
      errorText = "Name cannot be empty";
      notifyListeners();
    }

    if(controller.text.trim().isEmpty || errorText!=null){
      return false;
    }

    if(true){
      ///do
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
