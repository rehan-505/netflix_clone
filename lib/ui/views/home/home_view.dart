import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:stacked/stacked.dart';

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
                          model.userService.currentProfile!.assetImg,
                          scale: 6.r,
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
        body: model.isBusy ? const Center(child: CircularProgressIndicator(),) :
        StreamBuilder(
            stream: model.stream,
            builder: (context,AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot){

              if(snapshot.connectionState==ConnectionState.waiting || !(snapshot.hasData)){
                return const Center(
                  child: CircularProgressIndicator(
                  ),
                );
              }

              model.fillList(snapshot.data!.docs);


          return ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildMainPoster(context, model.posterMovie),
              _buildCategoryHorizontalList("Trending Now", context, model.getMovies.sublist(0,model.getMovies.length~/2),model: model ),
              30.verticalSpace,
              _buildCategoryHorizontalList("Award Winning", context,model.getMovies.sublist(model.getMovies.length~/2,model.getMovies.length),model: model),
              30.verticalSpace,
              _buildCategoryHorizontalList("Top Movies", context,model.getMovies.where((element) => !(element.isSeason)).toList(),reverse: true,model: model),
              30.verticalSpace,
              _buildCategoryHorizontalList("Top TV Shows", context,model.getMovies.where((element) => (element.isSeason)).toList(),reverse: true,model: model),

            ],
          );
        }),
      ),
    );
  }

  Widget _buildMainPoster(BuildContext context,Movie movie) {
    return StreamBuilder(builder: (context,snapshot){
      return AspectRatio(
        aspectRatio: 0.66,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              // margin: EdgeInsets.only(bottom: 65.h),
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    movie.imgUrl,
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
                decoration: const BoxDecoration(
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
                        onTap: () {
                          // PersistentNavBarNavigator.pushNewScreen(
                          //   context,
                          //   screen: MovieDetailsScreenView(),
                          //   withNavBar: true, // OPTIONAL VALUE. True by default.
                          // );
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(6.w, 3.h, 12.w, 3.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.play_arrow,
                                size: 30.w,
                              ),
                              5.horizontalSpace,
                              Text(
                                "Play",
                                style: blackStyle15Bold,
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
      );
    });
  }

  Widget _buildCategoryHorizontalList(String categoryName, BuildContext context, List<Movie> movies, {bool reverse = false, required HomeViewModel model}) {
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
              itemCount: movies.length,
              itemBuilder: (context, index) {

                Movie movie = movies[reverse ? (movies.length-1)-index : index];

                return InkWell(
                  onTap: () async{
                    // await model.uploadMovies();
                    showBottomSheet(context,movie,model);
                    // model.showBottomSheet();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.network(
                          movie.imgUrl,
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

  void showBottomSheet(BuildContext screenContext,Movie movie,HomeViewModel model){
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.r))),
      useRootNavigator: true,
      isScrollControlled: true,
      elevation: 0.35.sh,
        context: screenContext,
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
                      child: Image.network(
                        movie.imgUrl,
                        height: 120.h,
                        width: 80.w,
                        fit: BoxFit.cover,
                      )),
                  10.horizontalSpace,
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(movie.title, style: heading3Style,),
                          5.verticalSpace,
                          Row(
                            children: [
                               Text(movie.releaseDate.year.toString(), style: captionStyleGrey,),
                              10.horizontalSpace,
                               Text("${movie.ageRating.toString()}+",style: captionStyleGrey,),
                              10.horizontalSpace,
                              Text( movie.isSeason ? "New Episodes" : "New Release",style: captionStyleGrey,),
                            ],
                          ),
                         5.verticalSpace,
                          Text("${movie.des} "*20, style: captionStyleGrey.copyWith(color: Colors.white,),)
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
              InkWell(
                onTap: (){
                  model.detailsAndInfoTapped(movie);
                },
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.white,),
                    10.horizontalSpace,
                    const Text("Details & Info"),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios,color: Colors.white)
                  ],
                ),
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
