import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone/app/app.locator.dart';
import 'package:netflix_clone/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../utils/global_functions.dart';
import '../../common/app_colors.dart';
import '../../common/app_styles.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(1.sw, 100.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: Colors.black12,
                title: Row(
                  children: [
                    buildNLogo(),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/images/svg/search.svg",
                      height: 25.h,
                    ),
                    30.horizontalSpace,
                    ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: Image.asset(
                          "assets/images/profile_avatars/blue.png",
                          scale: 12.r,
                        )),
                  ],
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  const Text("Categories"),
                  20.horizontalSpace,
                  const Icon(Icons.arrow_drop_down_outlined, color: Colors.white,),
                  20.horizontalSpace,
                ],
              ),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildMainPoster(),

            _buildCategoryHorizontalList("Trending Now",model, context),
            30.verticalSpace,
            _buildCategoryHorizontalList("Trending Now",model, context),
            30.verticalSpace,
            _buildCategoryHorizontalList("Trending Now",model, context),
          ],
        ),
      ),
    );
  }

  Widget _buildMainPoster() {
    return AspectRatio(
      aspectRatio: 0.66,
      child: Container(
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              // margin: EdgeInsets.only(bottom: 65.h),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/posters/crown1.png",
                  ),
                  fit: BoxFit.fitWidth,
                  alignment: FractionalOffset.topCenter,
                ),
              ),
              // child: Image.asset("", fit: BoxFit.fitWidth,width: 1.sw,)
            ),
            Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.8, 0.99],
                          colors: [Colors.transparent, Colors.black])),
                )),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                width: 1.sw,
                // decoration: const BoxDecoration(color: Colors.transparent),

                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSmallButton(Icons.add, "My List"),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(6.w, 3.h, 12.w, 3.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: false
                              ? const CircularProgressIndicator(
                            valueColor:
                            AlwaysStoppedAnimation(kcPrimaryColor),
                          )
                              : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                // color:Colors.green ,
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 30.w,
                                  )),
                              5.horizontalSpace,
                              Container(
                                child: Text(
                                  "Play",
                                  style: blackStyle15Bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _buildSmallButton(Icons.info_outline, "Info",
                          padding: EdgeInsets.symmetric(vertical: 2.h))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryHorizontalList(String categoryName, HomeViewModel model, BuildContext context) {
    // print("into build category");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            categoryName,
            style: heading3Style,
          ),
        ),
        10.verticalSpace,
        SizedBox(
          height: 150.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){

                    // final navigationService = locator<NavigationService>();
                    // navigationService.navigateToVideoPlayerScreenView();
                    showBottomSheet(context);
                    // model.showBottomSheet();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          "assets/images/mini_poster/img_1.png",
                          height: 100.h,
                          width: 100.h,
                          fit: BoxFit.cover,
                        )),
                  ),
                );
              }),
        ),
      ],
    );
  }

  _buildSmallButton(IconData iconData, String title,
      {EdgeInsets padding = EdgeInsets.zero}) {
    return Column(
      children: [
        Padding(
          padding: padding,
          child: Icon(
            iconData,
            color: Colors.white,
            size: 28.h,
          ),
        ),
        5.verticalSpace,
        Text(
          title,
          style: captionStyle11,
        )
      ],
    );
  }

  void showBottomSheet(BuildContext context){
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.r))),
      useRootNavigator: true,
      isScrollControlled: true,
      elevation: 0.35.sh,
        context: context,
        builder: (context){
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          )
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(
                        "assets/images/mini_poster/img_1.png",
                        height: 120.h,
                        width: 80.w,
                        fit: BoxFit.cover,
                      )),
                  10.horizontalSpace,
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("1899", style: heading3Style,),
                          5.verticalSpace,
                          Row(
                            children: [
                              Text("2022", style: captionStyleGrey,),
                              10.horizontalSpace,
                              Text("16+",style: captionStyleGrey,),
                              10.horizontalSpace,
                              Text("18 Episodes",style: captionStyleGrey,),
                            ],
                          ),
                         5.verticalSpace,
                          Text("dummy "*20, style: captionStyleGrey.copyWith(color: Colors.white),)
                        ],
                      )
                   ),
                ],
              ),
              25.verticalSpace,
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSmallCircleButton(Icons.play_arrow, "Play" ,bgColor: Colors.white,iconColor: Colors.black),
                    _buildSmallCircleButton(Icons.download, "Download"),
                    _buildSmallCircleButton(Icons.check, "My List"),
                    _buildSmallCircleButton(Icons.share_outlined, "Share"),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.white,),
                  10.horizontalSpace,
                  const Text("Details & Info"),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios,color: Colors.white)
                ],
              ),
              20.verticalSpace
            ],
          ),
        ),
      );
    });
  }

  Widget _buildSmallCircleButton(IconData iconData,String title,{Color? bgColor,Color? iconColor}){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(5.r),
          decoration:  BoxDecoration(
            color: bgColor ?? Colors.grey.withOpacity(0.2) ,
            shape: BoxShape.circle,
          ),
          child: Icon(iconData, color: iconColor ?? Colors.white,),
        ),
        4.verticalSpace,
        Text(title, style: captionStyleGrey.copyWith(fontWeight: FontWeight.w100),)
      ],
    );
  }


}
