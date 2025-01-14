import 'package:netflix_clone/app/app.router.dart';
import 'package:netflix_clone/models/profile.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/current_user_service.dart';

class SelectProfileViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();
  final CurrentUserService _userService = locator<CurrentUserService>();

  SelectProfileViewModel({this.onyEditClickedView = false}){
    editClicked = onyEditClickedView;
  }

  final bool onyEditClickedView;

  bool editClicked = false;



  void onBackPressed(){
    if(onyEditClickedView){
      _navigationService.back();
      return;
    }

    ///else

    if(editClicked){
      editClicked=false;
      notifyListeners();
    }
    else {
      _navigationService.back();
    }
  }


  Future<bool> willPopScope()async{

    if(onyEditClickedView){
      return true;
    }

    ///else

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

  void onProfileClicked(Profile profile) async{

    if(onyEditClickedView){
      await _navigationService.navigateToEditProfileView(profile: profile,);
      notifyListeners();
      return;
    }



    ///else
    if(editClicked){

      editClicked=false;
      await _navigationService.navigateToEditProfileView(profile: profile,);
      notifyListeners();
    }

    else{
      _userService.currentProfile = profile;
      _navigationService.replaceWith(Routes.dashboardView);
    }

  }

  onAddProfileTapped() async{
    bool? added = await _navigationService.navigateToAddProfileView(backIcon: true);
    if(added ?? false){
      notifyListeners();
    }

  }

  bool profilesLimitCompleted() {
    return _userService.myUser!.profiles.length > 4;
  }

  int profilesLength() {
    return _userService.myUser!.profiles.length;
  }

  Profile getProfile(int index) {
    return _userService.myUser!.profiles[index];
  }





}
