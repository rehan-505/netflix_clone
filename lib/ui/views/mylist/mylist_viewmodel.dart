import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:netflix_clone/services/firebase_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../models/movie.dart';
import '../../../services/current_user_service.dart';

class MylistViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();

  final FirebaseService _firebaseService = locator<FirebaseService>();

  final CurrentUserService _userService = locator<CurrentUserService>();


  void navigateToDetailsPage(Movie movie){
    _navigationService.navigateTo(Routes.movieDetailsScreenView,arguments: MovieDetailsScreenViewArguments(movie: movie,showAppBarActions: false));
  }

  Future<DocumentSnapshot<Map<String,dynamic>>> getMovie(int index){
    return _firebaseService.getMovie(_userService.currentProfile!.moviesList[index]);
  }

  int getCurrentMoviesLength(){
    return _userService.currentProfile!.moviesList.length;
  }

}
