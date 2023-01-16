import 'package:flutter/material.dart';
import 'package:netflix_clone/app/app.router.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/current_user_service.dart';
import '../../../services/download_service.dart';

class MovieDetailsScreenViewModel extends BaseViewModel {
  final Movie _movie;
  bool downloadPressed = false;
  final NavigationService _navigationService = locator<NavigationService>();

  MovieDetailsScreenViewModel(this._movie);

  Movie get movie => _movie;

  final DownloadService _downloadService = locator<DownloadService>();

  final CurrentUserService _userService = locator<CurrentUserService>();

  CurrentUserService get userService => _userService;


  void onBackPressed(BuildContext context){
    Navigator.pop(context);
  }

  Future downloadMovie() async{

    if(!downloadPressed){
      downloadPressed = true;
      _downloadService.downloadMovie(movie.videoUrl,fileName: movie.title);
      notifyListeners();
    }

  }

  void playMovie(){
    _navigationService.navigateToVideoPlayerScreenView(movieLink: movie.videoUrl);
  }

}
