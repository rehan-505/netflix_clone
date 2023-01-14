import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

import '../../../app/app.locator.dart';
import '../../../services/current_user_service.dart';

class ComingSoonViewModel extends StreamViewModel {

  final CurrentUserService userService = locator<CurrentUserService>();


  final List<Movie> _movies = [];

  @override
  Stream<QuerySnapshot<Map<String,dynamic>>> get stream => FirebaseFirestore.instance.collection('movies').snapshots();

  void fillList(List<QueryDocumentSnapshot<Map<String,dynamic>>> docs){
    _movies.clear();
    for (var element in docs) {
      _movies.add(Movie.fromJson(element.data()));
      // _movies.first.toJson()
    }

    _movies.removeWhere((element) => element.releaseDate.isBefore(DateTime.now()));
  }

  List<Movie> get getMovies  => _movies;



}
