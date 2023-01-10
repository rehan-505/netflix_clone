import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/ui/views/home/home_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:stacked/stacked.dart';

import '../slivers.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, model, child) => PersistentTabView(
        context,
        controller: model.controller,
        onItemSelected: model.onItemSelected,


        screens: const [
          HomeView(),
          Scaffold(),
          Scaffold(),
          Scaffold(),

        ],
        items: [
          _buildNavBarItem(iconData1: Icons.home, iconData2: Icons.home_outlined, title: "Home", index: 0,model: model),
          _buildNavBarItem(iconData1: Icons.video_collection, iconData2: Icons.video_collection_outlined, title: "New and Hot", index: 1,model: model),
          _buildNavBarItem(iconData1: Icons.search, iconData2: Icons.search, title: "Search", index: 2,model: model),
          _buildNavBarItem(iconData1: Icons.download_for_offline, iconData2: Icons.download_for_offline_outlined, title: "Downloads", index: 3,model: model),
        ],
        confineInSafeArea: true,
        backgroundColor: Colors.black87, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.simple,
        // Choose the nav bar style with this property.
      ),
    );
  }

  PersistentBottomNavBarItem _buildNavBarItem({required IconData iconData1, required IconData iconData2, required String title, required int index, required DashboardViewModel model }){
    return PersistentBottomNavBarItem(
      icon: Icon(index == model.controller.index ? iconData1 : iconData2),
      title: title, activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.grey,
      textStyle: TextStyle(color: Colors.white,fontSize: 10.sp)

    );
  }
}
