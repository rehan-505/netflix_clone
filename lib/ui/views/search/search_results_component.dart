import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/ui/views/search/search_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import '../../../models/movie.dart';

class SearchResultBody extends ViewModelWidget<SearchViewModel> {
  const SearchResultBody({Key? key}) : super(key: key,reactive: true,);

  @override
  Widget build(BuildContext context,SearchViewModel viewModel) {
    return Expanded(
        child: ListView.builder(

            itemCount: viewModel.searchResultMovies.length,
            itemBuilder: (context,index){
              return _buildSearchResultTile(viewModel.searchResultMovies[index],viewModel);
            }));
  }

  Widget _buildSearchResultTile(Movie movie,SearchViewModel viewModel){
    return GestureDetector(
      onTap: (){
        viewModel.playVideo(movie);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 4.h),
        color: Colors.grey[900],
        child: Row(
          children: [
            Container(
              height: 80.h,
              width: 120.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(movie.imgUrl),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter
                ),

              ),
            ),
            13.horizontalSpace,
            Text(movie.title,),
            const Spacer(),
            Icon(Icons.play_circle_outline_rounded, color: Colors.white, size: 30.w,),
            15.horizontalSpace,

          ],
        ),
      ),
    );
  }

}
