import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_clone/ui/common/app_colors.dart';
import '../../../utils/global_functions.dart';

import '../../app/app.locator.dart';
import '../../services/bottom_navbar_service.dart';
import '../common/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, this.onBackPressed, required this.title, this.profileImgPath, this.showSearchIcon = false,  this.showLogo=false, this.automaticallyImplyLeading = false}) : super(key: key);

  final void Function()? onBackPressed;
  final String title;
  final String? profileImgPath;
  final bool showSearchIcon;
  final bool showLogo;
  final bool automaticallyImplyLeading;

  final BottomNavbarService _bottomBarService = locator<BottomNavbarService>();


  @override
  Widget build(BuildContext context) {
    return AppBar(

      elevation: 0,
      backgroundColor: showLogo ? Colors.transparent: kcBackgroundColor,
      title: Text(title,style: heading3Style,),
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: [

        showSearchIcon ? GestureDetector(
          onTap: _onSearchTaped,
          child: SvgPicture.asset(
            "assets/images/svg/search.svg",
            height: 25.h,
          ),
        ) : const SizedBox(),

        10.horizontalSpace,

        profileImgPath != null ?
        GestureDetector(
          onTap: (){
            _onProfileTaped();
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: Image.asset(
                profileImgPath!,
                scale: 8.r,
              )),
        ) : const SizedBox(),

      ],
      leading: showLogo ? Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          20.horizontalSpace,
          buildNLogo(height: 40.h, width: 25.h),
        ],
      ) : onBackPressed!=null ? GestureDetector(
      onTap: onBackPressed,
          child: const Icon(Icons.arrow_back)) : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  _onSearchTaped(){

    _bottomBarService.jumpToSearch();
  }

  _onProfileTaped(){
    _bottomBarService.jumpToMoreView();
  }
}
