import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/enums/movie_category.dart';
import 'package:netflix_clone/ui/shared_widgets/custom_app_bar.dart';
import 'package:netflix_clone/utils/extensions.dart';
import 'package:stacked/stacked.dart';

import '../../../models/movie.dart';
import 'specific_category_viewmodel.dart';

class SpecificCategoryView extends StatelessWidget {
  const SpecificCategoryView({Key? key, required this.movieCategory, required this.movies}) : super(key: key);

  final MovieCategory movieCategory;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SpecificCategoryViewModel>.reactive(
      viewModelBuilder: () => SpecificCategoryViewModel(movieCategory: movieCategory,movies: movies),
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppBar(title: movieCategory.name.toCapitalize(),automaticallyImplyLeading: true,),
        backgroundColor: Theme.of(context).backgroundColor,
        body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          itemCount: movies.length,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7.r,
              crossAxisSpacing: 10.w

            ),
            itemBuilder: (context,index){
            Movie movie = movies[index] ;
              return InkWell(
                onTap: () async{
                  model.navigateToDetailsPage(movie);
                  },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      movie.imgUrl,
                      height: 0.3.h,
                      width: 0.3.sw,
                      fit: BoxFit.cover,
                    )),
              );
            }
        ),
      ),
    );
  }
}
