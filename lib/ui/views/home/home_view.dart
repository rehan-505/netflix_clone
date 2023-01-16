import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/enums/movie_category.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/ui/shared_widgets/custom_app_bar.dart';
import 'package:netflix_clone/utils/extensions.dart';
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
      onModelReady: (m){
        m.initializeDownload();
      },
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
                  InkWell(
                    onTap: (){
                      _showCategories(context,model);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Categories"),
                        20.horizontalSpace,
                        const Icon(Icons.arrow_drop_down_outlined, color: Colors.white,),
                      ],
                    ),
                  ),
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
              _buildCategoryHorizontalList("Trending Now", context, model.getFilteredMovies.sublist(0,model.getFilteredMovies.length~/2),model: model ),
              StreamBuilder(
                  stream: model.userStream,
                  builder: (context,AsyncSnapshot<DocumentSnapshot<Map<String,dynamic>>> snapshot){
                    if(!(snapshot.hasData) || snapshot.connectionState==ConnectionState.waiting){
                      // model.userService.getMyListMoviesFromProfile(profile, model);
                      return _buildCategoryHorizontalList("My List", context, model.userService.getMyListMovies(model.getFilteredMovies),model: model );
                    }

                return _buildCategoryHorizontalList("My List", context, model.getUpdatedMyList(snapshot.data!),model: model );
              }),
              _buildCategoryHorizontalList("Award Winning", context,model.getFilteredMovies.sublist(model.getFilteredMovies.length~/2,model.getFilteredMovies.length),model: model),
              _buildCategoryHorizontalList("Top Movies", context,model.getFilteredMovies.where((element) => !(element.isSeason)).toList(),reverse: true,model: model),
              _buildCategoryHorizontalList("Top TV Shows", context,model.getFilteredMovies.where((element) => (element.isSeason)).toList(),reverse: true,model: model),

            ],
          );
        }),
      ),
    );
  }


  void _showCategories(BuildContext context, HomeViewModel model) async{

    await showGeneralDialog(
      useRootNavigator: true,
      context: context,
      barrierColor: Colors.black45.withOpacity(0.75), // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Scaffold(
          backgroundColor: Colors.black12.withOpacity(0.6),
          body: SizedBox(
            // color: Colors.red,
            height: 1.sh,
            width: 1.sw,
            child: Align(
              alignment: Alignment.center,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),

                shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: MovieCategory.values.length,
                  itemBuilder: (context,index){
                    String categoryName = MovieCategory.values[index].name.toCapitalize();
                    return Center(child: Padding(
                      padding:  EdgeInsets.only(bottom: 16.h),
                      child: GestureDetector(
                          onTap: (){
                            model.navigateToCategoryScreen(MovieCategory.values[index]);
                          },
                          child: Text(categoryName,style: subheadingStyle,)),
                    ));
                  }),
            ),
          ),
          floatingActionButton: Padding(
            padding:  EdgeInsets.only(bottom: 25.h),
            child: FloatingActionButton(
                onPressed: (){
              model.navigateBack();
            },
              backgroundColor: Colors.white,
              child: const Icon(Icons.clear, color: Colors.black,),

            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }

  Widget _buildMainPoster(BuildContext context,Movie movie,HomeViewModel model) {
    return AspectRatio(
      aspectRatio: 0.67,
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
                color: Colors.transparent,
              ),
              width: 1.sw,

              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const PosterMovieAddIcon(),
                    InkWell(
                      onTap: () {
                        model.playVideo(model.posterMovie);
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
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        onTap: (){
                          model.detailsAndInfoTapped(movie, context,fromPoster: true);
                        }
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHorizontalList(String categoryName, BuildContext context, List<Movie> movies, {bool reverse = false, required HomeViewModel model}) {

    if(movies.isEmpty){
      return const SizedBox();
    }

    // print("into build category");
    return Padding(
      padding:  EdgeInsets.only(bottom: 30.h),
      child: Column(
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
                      await showBottomSheet(context,movie,model);

                      // await model.uploadMovies();

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
      ),
    );
  }

  Widget _buildSmallButton(IconData iconData, String title,
      {EdgeInsets padding = EdgeInsets.zero, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext screenContext,Movie movie,HomeViewModel model) async{
    await showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.r))),
      useRootNavigator: true,
      isScrollControlled: true,
      elevation: 0.35.sh,
        context: screenContext,
        builder: (context){
          return  ViewModelBuilder<HomeViewModel>.reactive(
           viewModelBuilder: () =>model,
          builder: (context,model,_){
            return CustomBottomSheet(
              movie,screenContext,
              onPlayPressed: (){model.playVideo(movie,popSheet: true,context: context);},
              downloadPressed: model.downloadPressed,
              movieAddedToList: model.userService.movieExistsInProfileList(movie.id),
              onAddToListPressed: (){
                model.handleAddToListClicked(movie);
              },
              onDownloadPressed: (){model.downloadMovie(movie);

                }, onDetailsAndInfoTap: () {
              model.detailsAndInfoTapped(movie,screenContext);
            },
            );
          },
           disposeViewModel: false,


         );
    });

    model.makeDownloadPressedFalse();
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
        ),
        5.verticalSpace,
        Text(
          "My List",
          style: captionStyle11,
        )
      ],
    );
  }
}
