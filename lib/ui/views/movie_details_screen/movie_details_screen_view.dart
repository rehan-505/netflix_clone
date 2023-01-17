import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/ui/common/app_styles.dart';
import 'package:netflix_clone/ui/shared_widgets/custom_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'movie_details_screen_viewmodel.dart';

class MovieDetailsScreenView extends StatelessWidget {
  const MovieDetailsScreenView({Key? key, required this.movie, this.showAppBarActions = true}) : super(key: key);
  final Movie movie;
  final bool showAppBarActions;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieDetailsScreenViewModel>.reactive(
      viewModelBuilder: () => MovieDetailsScreenViewModel(movie),
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppBar(title: "",onBackPressed: (){
          model.onBackPressed(context);
          },
            showSearchIcon: showAppBarActions ,
            profileImgPath: showAppBarActions ? model.getProfileImg() : null
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 0.4.sh,
                  width: 1.sw,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(model.movie.imgUrl),
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
                    Text(model.movie.title, style: headlineStyle,),
                    7.verticalSpace,
                    Row(
                      children: [
                        Text(model.movie.releaseDate.year.toString(), style: captionStyleGrey.copyWith(color: Colors.white.withOpacity(0.8)),),
                        10.horizontalSpace,
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.r),
                            decoration: BoxDecoration(
                              color: Colors.grey[900]
                            ),
                            child: Text("${movie.ageRating}+",style: captionStyleGrey)),
                        10.horizontalSpace,
                        Text("${movie.length} minutes",style: captionStyleGrey),
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
                        onPressed: model.playMovie, child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children:  [
                          const Icon(Icons.play_arrow,color: Colors.black,),
                          5.horizontalSpace,
                          Text("Play", style: buttonHeadingStyle.copyWith(color: Colors.black,fontWeight: FontWeight.bold),)

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

                      child: ElevatedButton(
                        onPressed: model.downloadMovie,
                        child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon( model.downloadPressed ? Icons.check : Icons.download),
                          5.horizontalSpace,
                          Text("Download", style: buttonHeadingStyle.copyWith(letterSpacing: 0),)

                        ],
                      ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[900],
                          fixedSize: Size(double.infinity, 50.h)
                        ),

                      ),
                    ),
                    20.verticalSpace,
                    Text("${movie.des} "*40),
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
