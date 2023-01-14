import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreenViewModel extends BaseViewModel {

  final videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');


  ChewieController? chewieController;

  Future initState() async{
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

    // TODO: implement dispose
    super.dispose();
  }





}
