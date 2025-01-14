import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreenViewModel extends BaseViewModel {

  late final VideoPlayerController videoPlayerController;

  VideoPlayerScreenViewModel(this.movieLink);
  final String movieLink;

  ChewieController? chewieController;

  Future initState() async{
    videoPlayerController = VideoPlayerController.network(movieLink);
    await runBusyFuture(initializeSettings());
  }


  Future initializeSettings() async{
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    await videoPlayerController.initialize();
    chewieController = ChewieController(

      useRootNavigator: false,

      allowFullScreen: false,
      fullScreenByDefault: true,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight],
      videoPlayerController: videoPlayerController,

      autoPlay: true,
      looping: true,
    );

  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    chewieController?.dispose();
    videoPlayerController.dispose();

    super.dispose();
  }


}
