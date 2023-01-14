import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/app/app.locator.dart';
import 'package:netflix_clone/app/app.router.dart';
import 'package:netflix_clone/ui/views/movie_details_screen/movie_details_screen_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../models/movie.dart';
import '../../../services/current_user_service.dart';

class HomeViewModel extends StreamViewModel {

  final NavigationService _navigationService = locator<NavigationService>();

  final List<Movie> _movies = [];
  late Movie _posterMovie;

  Movie get posterMovie => _posterMovie;

  final CurrentUserService _userService = locator<CurrentUserService>();

  CurrentUserService get userService => _userService;

  @override
  Stream<QuerySnapshot<Map<String,dynamic>>> get stream => FirebaseFirestore.instance.collection('movies').snapshots();

  void fillList(List<QueryDocumentSnapshot<Map<String,dynamic>>> docs){
    _movies.clear();
    for (var element in docs) {
      _movies.add(Movie.fromJson(element.data()));
    }

    _posterMovie = _movies.where((element) => element.id=='poster').first;

    _movies.removeWhere((element) => element.releaseDate.isAfter(DateTime.now()));
    _movies.removeWhere((element) => element.id=='poster');


  }

  List<Movie> get getMovies  => _movies;

  void detailsAndInfoTapped(Movie movie,BuildContext context){
    _navigationService.back();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return MovieDetailsScreenView(movie: movie);
    }));
    // _navigationService.navigateTo(Routes.movieDetailsScreenView,arguments: MovieDetailsScreenViewArguments(movie: movie) );

  }

  void playVideo(){
    _navigationService.navigateTo(Routes.videoPlayerScreenView);
  }

  void handleAddToListClicked(Movie movie){
    if(userService.movieExistsInProfileList(movie.id)){
      _removeMovieFromProfile(movie.id);
    }
    else{
      _addMovieToProfile(movie.id);
    }
  }

  void _addMovieToProfile(String id){
    _userService.addMovieToProfile(id);
    notifyListeners();
  }

  void _removeMovieFromProfile(String id){
    _userService.removeMovieFromProfile(id);
    notifyListeners();
  }


}
