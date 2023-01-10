import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  void onItemSelected(int i){
    notifyListeners();
  }

}
