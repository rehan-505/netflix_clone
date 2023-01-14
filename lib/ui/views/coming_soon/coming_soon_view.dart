import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/ui/common/app_styles.dart';
import 'package:netflix_clone/ui/shared_widgets/custom_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/svg.dart';
import 'coming_soon_viewmodel.dart';

class ComingSoonView extends StatelessWidget {
  const ComingSoonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ComingSoonViewModel>.nonReactive(
      viewModelBuilder: () => ComingSoonViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: CustomAppBar(title: "New & Hot",profileImgPath: model.userService.currentProfile!.assetImg,),
        body: StreamBuilder(
          stream: model.stream,
          builder: (context,AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot){
            if(snapshot.connectionState==ConnectionState.waiting || !(snapshot.hasData)){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            model.fillList(snapshot.data!.docs);

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Colors.white),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/images/svg/popcorn-svgrepo-com (1).svg",
                          height: 25.h,
                          width: 25.w,
                          fit: BoxFit.cover,
                        ),
                        5.horizontalSpace,
                        Text(
                          "Coming Soon",
                          style: heading3Style.copyWith(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Expanded(
                      child: ListView.builder(
                          itemCount: model.getMovies.length,
                          itemBuilder: (context, index) {

                            Movie movie = model.getMovies[index];

                            return Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Jan",
                                        style: TextStyle(
                                            color: Colors.white.withOpacity(0.8),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      5.verticalSpace,
                                      const Text("20",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                  10.horizontalSpace,
                                  Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(

                                            height: 200.h,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.r),

                                                image: DecorationImage(image: NetworkImage(movie.imgUrl),
                                              alignment: Alignment.topCenter,
                                                fit: BoxFit.cover,
                                              )
                                            ),

                                          ),
                                          // ClipRRect(
                                          //   child: Image.network(
                                          //     movie.imgUrl,
                                          //     height: 200.h,
                                          //     fit: BoxFit.cover,
                                          //     width: double.infinity,
                                          //   ),
                                          // ),
                                          5.verticalSpace,
                                          Row(
                                            children: [
                                              Text(movie.title),
                                              Spacer(),
                                              Icon(
                                                Icons.info_outline_rounded,
                                                color: Colors.white,
                                              ),
                                              0.horizontalSpace
                                            ],
                                          ),
                                          10.verticalSpace,
                                          Text(
                                            "Coming January 20",
                                            style: TextStyle(fontSize: 16.sp),
                                          ),
                                          10.verticalSpace,
                                          Text(
                                            "dummy " * 20,
                                            style: captionStyleGrey,
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            );
                          }))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
