import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class SelectProfileViewModel extends BaseViewModel {

  final navigationService = locator<NavigationService>();
  bool editClicked = false;



  void onBackPressed(){
    if(editClicked){
      editClicked=false;
      notifyListeners();
    }
    else {
      navigationService.back();
    }
  }

  Future<bool> willPopScope()async{
    if (editClicked){
      editClicked = false;
      notifyListeners();
      return false;
    }
    return true;
  }

  void onEditClicked(){
    editClicked = true;
    notifyListeners();
  }
}
