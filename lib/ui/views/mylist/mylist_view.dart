import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../models/movie.dart';
import '../../shared_widgets/custom_app_bar.dart';
import 'mylist_viewmodel.dart';

class MylistView extends StatelessWidget {
  const MylistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MylistViewModel>.reactive(
      viewModelBuilder: () => MylistViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppBar(title: "My List",automaticallyImplyLeading: true,),
        backgroundColor: Theme.of(context).backgroundColor,
        body: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            itemCount: model.getCurrentMoviesLength(),
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7.r,
                crossAxisSpacing: 10.w

            ),
            itemBuilder: (context,index){

              return FutureBuilder(
                future: model.getMovie(index),
                builder: (context,AsyncSnapshot<DocumentSnapshot<Map<String,dynamic>>> snapshot) {

                  if(!(snapshot.hasData) || snapshot.connectionState==ConnectionState.waiting){
                    return SizedBox(
                      height: 0.3.h,
                      width: 0.3.sw,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  Movie movie = Movie.fromJson(snapshot.data!.data()!);
                  
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
              );
            }
        ),
      ),
    );
  }
}
