import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/bottom_navbar_service.dart';

class DashboardViewModel extends BaseViewModel {

  final BottomNavbarService _bottomBarService = locator<BottomNavbarService>();

  BottomNavbarService get bottomBarService => _bottomBarService;
  void onItemSelected(int i){
    notifyListeners();
  }

}
