import 'package:flutter/material.dart';
import 'package:netflix_clone/ui/views/coming_soon/coming_soon_view.dart';
import 'package:netflix_clone/ui/views/home/home_view.dart';
import 'package:netflix_clone/ui/views/more/more_view.dart';
import 'package:netflix_clone/ui/views/search/search_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_styles.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, model, child) => PersistentTabView(
        context,
        controller: model.bottomBarService.controller,
        onItemSelected: model.onItemSelected,

        screens: const [
          HomeView(),
          ComingSoonView(),
          SearchView(),
          MoreView(),

        ],
        items: [
          _buildNavBarItem(iconData1: Icons.home, iconData2: Icons.home_outlined, title: "Home", index: 0,model: model),
          _buildNavBarItem(iconData1: Icons.video_collection, iconData2: Icons.video_collection_outlined, title: "New and Hot", index: 1,model: model),
          _buildNavBarItem(iconData1: Icons.search, iconData2: Icons.search, title: "Search", index: 2,model: model),
          _buildNavBarItem(iconData1: Icons.menu, iconData2: Icons.menu_outlined, title: "More", index: 3,model: model),
        ],
        confineInSafeArea: true,
        backgroundColor: Colors.black87,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.simple,
      ),
    );
  }

  PersistentBottomNavBarItem _buildNavBarItem({required IconData iconData1, required IconData iconData2, required String title, required int index, required DashboardViewModel model }){
    return PersistentBottomNavBarItem(
      icon: Icon(index == model.bottomBarService.controller.index ? iconData1 : iconData2),
      title: title, activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.grey,
      textStyle: captionStyle10

    );
  }
}
