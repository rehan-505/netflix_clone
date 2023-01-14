import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/ui/shared_widgets/custom_app_bar.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/app_styles.dart';
import 'bottom_sheet.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(1.sw, 100.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(title: "",profileImgPath: model.userService.currentProfile!.assetImg,showSearchIcon: true,showLogo: true),
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
              _buildMainPoster(context, model.posterMovie,model),
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

  Widget _buildMainPoster(BuildContext context,Movie movie,HomeViewModel model) {
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
                    children:  [
                      const PosterMovieAddIcon(),
                      // _buildSmallButton(Icons.add, "My List"),
                      InkWell(
                        onTap: () {
                          model.playVideo();
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

          // return CustomBottomSheet(movie,screenContext, model: null,);


          return  ViewModelBuilder<HomeViewModel>.reactive(
           viewModelBuilder: () =>model,
          builder: (context,model,_){
            return CustomBottomSheet(movie,screenContext, model: model,);
          },
           disposeViewModel: false,


         );



    });
  }



}

class PosterMovieAddIcon extends ViewModelWidget<HomeViewModel> {
  const PosterMovieAddIcon({Key? key}) : super(key: key,reactive: true);

  @override
  Widget build(BuildContext context,HomeViewModel viewModel) {
    return Column(
      children: [

        InkWell(
          onTap: (){
            viewModel.handleAddToListClicked(viewModel.posterMovie);

          },
          child:             Icon(
            viewModel.userService.movieExistsInProfileList(viewModel.posterMovie.id) ?
            Icons.check : Icons.add,
            color: Colors.white,
            size: 28.h,
          ),
        )


        ,
        5.verticalSpace,
        Text(
          "My List",
          style: captionStyle11,
        )
      ],
    );
  }
}
