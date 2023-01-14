import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'video_player_screen_viewmodel.dart';

class VideoPlayerScreenView extends StatelessWidget {
  const VideoPlayerScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VideoPlayerScreenViewModel>.reactive(
      viewModelBuilder: () => VideoPlayerScreenViewModel(),
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
