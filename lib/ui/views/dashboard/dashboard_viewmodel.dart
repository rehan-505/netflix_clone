import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/bottom_navbar_service.dart';

class DashboardViewModel extends BaseViewModel {

  final BottomNavbarService _bottomBarService = locator<BottomNavbarService>();

  void onItemSelected(int i){
    notifyListeners();
  }

  PersistentTabController getController(){
  return _bottomBarService.controller;
  }

}
