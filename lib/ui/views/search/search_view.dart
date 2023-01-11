import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'search_viewmodel.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(),
      onModelReady: (model){
        model.focusNode.requestFocus();
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black12,
          title: Row(
            children: [
              // const Icon(Icons.arrow_back),
              const Spacer(),
              ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Image.asset(
                    "assets/images/profile_avatars/blue.png",
                    scale: 12.r,
                  )),
            ],
          ),
        ),
        backgroundColor: kcBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            5.verticalSpace,
            TextFormField(
              focusNode: model.focusNode,
              cursorColor: Colors.white,
              decoration: InputDecoration(

                prefixIcon:  Icon(Icons.search, color: Colors.white.withOpacity(0.7),),
                filled: true,
                fillColor: Colors.grey[800],
                hintText: "Search for a show,movie etc.",
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 13.sp),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,

              ),
            ),
            20.verticalSpace,
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Text("Top Searches",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 20.sp),),
            ),
            20.verticalSpace,
            Expanded(child: ListView.builder(itemBuilder: (context,index){
              return _buildSearchResultTile();
            }))

          ],
        ),
      ),
    );
  }

  Widget _buildSearchResultTile(){
    return Container(
      margin: EdgeInsets.only(bottom: 4.h),
      color: Colors.grey[900],
      child: Row(
        children: [
          Image.asset(
            "assets/images/mini_poster/img_1.png",
            height: 80.h,
            width: 120.w,
            fit: BoxFit.cover,
          ),
          13.horizontalSpace,
          const Text("The Notebook",
            // style: TextStyle(fontSize: 16.sp),
          ),
          const Spacer(),
          Icon(Icons.play_circle_outline_rounded, color: Colors.white, size: 30.w,),
          15.horizontalSpace,

        ],
      ),
    );
  }
}