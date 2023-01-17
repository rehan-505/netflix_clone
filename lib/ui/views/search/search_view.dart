
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/ui/common/app_colors.dart';
import 'package:netflix_clone/ui/views/search/search_results_component.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_styles.dart';
import '../../shared_widgets/custom_app_bar.dart';
import 'search_viewmodel.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.nonReactive(
      viewModelBuilder: () => SearchViewModel(),
      onModelReady: (model){
        model.focusNode.requestFocus();
      },
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppBar(title: "Search",profileImgPath: model.getProfileImg(),),
        backgroundColor: kcBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            5.verticalSpace,
            TextFormField(

              controller: model.textEditingController,
              onChanged: model.onChanged,
              focusNode: model.focusNode,
              cursorColor: Colors.white,
              decoration: InputDecoration(

                prefixIcon:  Icon(Icons.search, color: Colors.white.withOpacity(0.7),),
                filled: true,
                fillColor: Colors.grey[800],
                hintText: "Search for a show,movie etc.",
                hintStyle: normalStyleLowOpacity.copyWith(fontSize: 13.sp),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,

              ),
            ),
            20.verticalSpace,
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Text("Top Searches",style: subheadingStyle.copyWith(fontWeight: FontWeight.w600,),),
            ),
            20.verticalSpace,
            StreamBuilder(
                stream: model.stream,
                builder: (context,AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot){

              if(snapshot.connectionState==ConnectionState.waiting || !(snapshot.hasData)){
                // print("has data: ${snapshot.hasData}");
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                    ),
                  ),
                );
              }

              model.fillList(snapshot.data!.docs);
              return const SearchResultBody();

            })
          ],
        ),
      ),
    );
  }

}




