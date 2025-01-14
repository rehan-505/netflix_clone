import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'video_player_screen_viewmodel.dart';

class VideoPlayerScreenView extends StatelessWidget {
  const VideoPlayerScreenView({Key? key, required this.movieLink}) : super(key: key);
  final String movieLink;


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VideoPlayerScreenViewModel>.reactive(
      viewModelBuilder: () => VideoPlayerScreenViewModel(movieLink),
      onModelReady: (model) async{
        await model.initState();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: model.isBusy ? const Center(child: CircularProgressIndicator()) : Chewie(
          controller: model.chewieController!,
        ),
      ),
    );
  }
}
