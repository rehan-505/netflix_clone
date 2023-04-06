import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavbarService {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  PersistentTabController get controller => _controller;

  void jumpToSearch(){
    controller.jumpToTab(2);
  }


  void jumpToMoreView(){
    controller.jumpToTab(3);
  }

  void jumpToHome(){
    controller.jumpToTab(0);
  }


}
