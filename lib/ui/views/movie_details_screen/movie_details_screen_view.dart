import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'movie_details_screen_viewmodel.dart';

class MovieDetailsScreenView extends StatelessWidget {
  const MovieDetailsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieDetailsScreenViewModel>.reactive(
      viewModelBuilder: () => MovieDetailsScreenViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.black12,
          title: Row(
            children: [
              const Icon(Icons.arrow_back),
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
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 0.4.sh,
                  width: 1.sw,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/posters/carole_and_tuesday.jpg"),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover

                    ),
                  ),
                  // child: Image.asset("assets/images/mini_poster/stranger_things.png", fit: BoxFit.cover,)

              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Stranger Things", style: headlineStyle,),
                    7.verticalSpace,
                    Row(
                      children: [
                        Text("2007", style: captionStyleGrey.copyWith(color: Colors.white.withOpacity(0.8)),),
                        10.horizontalSpace,
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.r),
                            decoration: BoxDecoration(
                              color: Colors.grey[900]
                            ),
                            child: Text("13+",style: captionStyleGrey)),
                        10.horizontalSpace,
                        Text("2h 42m",style: captionStyleGrey),
                        10.horizontalSpace,
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.r),
                          decoration:  BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(2.r)
                          ),
                          child: Text("HD", style: captionStyleGrey.copyWith(color: Colors.grey[900], fontSize: 10.sp, fontWeight: FontWeight.w800),),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){}, child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.play_arrow,color: Colors.black,),
                          Text("Play", style: TextStyle(color: Colors.black),)

                        ],
                      ),
                        style: ElevatedButton.styleFrom(  backgroundColor: Colors.grey[100],
                            fixedSize: Size(double.infinity, 50.h)


                        ),


                      ),
                    ),
                    10.verticalSpace,
                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton(onPressed: (){}, child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.download),
                          Text("Download", style: TextStyle(color: Colors.white.withOpacity(0.8)),)

                        ],
                      ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[900],
                          fixedSize: Size(double.infinity, 50.h)
                        ),

                      ),
                    ),
                    20.verticalSpace,
                    Text("dummy "*40),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
