import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/current_user_service.dart';
import '../../../services/firebase_service.dart';

class ComingSoonViewModel extends StreamViewModel {

  final CurrentUserService userService = locator<CurrentUserService>();
  final FirebaseService _firebaseService = locator<FirebaseService>();


  final List<Movie> _movies = [];

  @override
  Stream<QuerySnapshot<Map<String,dynamic>>> get stream => _firebaseService.getMoviesStream();

  void fillList(List<QueryDocumentSnapshot<Map<String,dynamic>>> docs){
    _movies.clear();
    for (var element in docs) {
      _movies.add(Movie.fromJson(element.data()));
      // _movies.first.toJson()
    }

    _movies.removeWhere((element) => element.releaseDate.isBefore(DateTime.now()));
    sortMovies();
  }

  List<Movie> get getMovies  => _movies;

  String getMovieReleaseDate(Movie movie){
    DateTime dateTime = movie.releaseDate;
    String date = DateFormat( "MMMM ").format(dateTime);
    date = "$date ${dateTime.day}";
    return date;
  }

  String getMovieReleaseMonth(Movie movie){
    DateTime dateTime = movie.releaseDate;
    String date = DateFormat("MMM").format(dateTime);
    return date;
  }

  String getMovieReleaseDayNo(Movie movie){
    DateTime dateTime = movie.releaseDate;
    return dateTime.day.toString();

  }


  void sortMovies(){
    _movies.sort((a, b) => a.releaseDate.compareTo(b.releaseDate),);
  }

}
