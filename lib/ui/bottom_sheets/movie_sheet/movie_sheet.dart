import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/movie.dart';
import '../../common/app_styles.dart';

class MovieBottomSheet extends StatelessWidget {
  const MovieBottomSheet(this.movie, this.parentContext, {Key? key,
    required this.onAddToListPressed, required this.onPlayPressed, required this.onDownloadPressed, required this.downloadPressed, required this.movieAddedToList, required this.onDetailsAndInfoTap}) : super(key: key);

  final Movie movie;
  final BuildContext parentContext;
  final void Function() onAddToListPressed;
  final void Function() onPlayPressed;
  final void Function() onDownloadPressed;
  final void Function() onDetailsAndInfoTap;
  final bool downloadPressed;
  final bool movieAddedToList;





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
                  _buildSmallCircleButton(Icons.play_arrow, "Play" ,bgColor: Colors.white,iconColor: Colors.black,onTap: onPlayPressed),
                  _buildSmallCircleButton(downloadPressed ? Icons.check : Icons.download, "Download",onTap: onDownloadPressed),
                  _buildSmallCircleButton(movieAddedToList ? Icons.check : Icons.add, "My List",onTap: onAddToListPressed),
                  _buildSmallCircleButton(Icons.share_outlined, "Share"),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            InkWell(
              onTap: onDetailsAndInfoTap,
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
