import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/ui/views/home/home_viewmodel.dart';

import '../../../models/movie.dart';
import '../../common/app_styles.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(this.movie, this.parentContext, {Key? key, required this.model}) : super(key: key);

  final Movie movie;
  final HomeViewModel model;
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          )
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      movie.imgUrl,
                      height: 120.h,
                      width: 80.w,
                      fit: BoxFit.cover,
                    )),
                10.horizontalSpace,
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(movie.title, style: heading3Style,),
                        5.verticalSpace,
                        Row(
                          children: [
                            Text(movie.releaseDate.year.toString(), style: captionStyleGrey,),
                            10.horizontalSpace,
                            Text("${movie.ageRating.toString()}+",style: captionStyleGrey,),
                            10.horizontalSpace,
                            Text( movie.isSeason ? "New Episodes" : "New Release",style: captionStyleGrey,),
                          ],
                        ),
                        5.verticalSpace,
                        Text("${movie.des} "*20, style: captionStyleGrey.copyWith(color: Colors.white,),)
                      ],
                    )
                ),
              ],
            ),
            25.verticalSpace,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSmallCircleButton(Icons.play_arrow, "Play" ,bgColor: Colors.white,iconColor: Colors.black),
                  _buildSmallCircleButton(Icons.download, "Download"),
                  _buildSmallCircleButton(model.userService.movieExistsInProfileList(movie.id) ? Icons.check : Icons.add, "My List",onTap: (){
                    model.handleAddToListClicked(movie);
                  }),
                  _buildSmallCircleButton(Icons.share_outlined, "Share"),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            InkWell(
              onTap: (){
                model.detailsAndInfoTapped(movie,parentContext);
              },
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.white,),
                  10.horizontalSpace,
                  const Text("Details & Info"),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios,color: Colors.white)
                ],
              ),
            ),
            20.verticalSpace
          ],
        ),
      ),
    );
  }

  Widget _buildSmallCircleButton(IconData iconData,String title,{Color? bgColor,Color? iconColor,void Function()? onTap}){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(5.r),
            decoration:  BoxDecoration(
              color: bgColor ?? Colors.grey.withOpacity(0.2) ,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: iconColor ?? Colors.white,),
          ),
        ),
        4.verticalSpace,
        Text(title, style: captionStyleGrey.copyWith(fontWeight: FontWeight.w100),)
      ],
    );
  }

}
