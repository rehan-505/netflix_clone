import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/current_user_service.dart';

class MovieDetailsScreenViewModel extends BaseViewModel {
  final Movie _movie;

  MovieDetailsScreenViewModel(this._movie);

  Movie get movie => _movie;

  final CurrentUserService _userService = locator<CurrentUserService>();

  CurrentUserService get userService => _userService;


  void onBackPressed(BuildContext context){
    Navigator.pop(context);
  }

}
