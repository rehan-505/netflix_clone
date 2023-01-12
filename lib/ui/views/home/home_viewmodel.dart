import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';
import '../../../models/movie.dart';

class HomeViewModel extends StreamViewModel {


  final List<Movie> _movies = [];
  late Movie posterMovie;



  @override
  // TODO: implement stream
  Stream<QuerySnapshot<Map<String,dynamic>>> get stream => FirebaseFirestore.instance.collection('movies').snapshots();

  void fillList(List<QueryDocumentSnapshot<Map<String,dynamic>>> docs){
    _movies.clear();
    for (var element in docs) {
      _movies.add(Movie.fromJson(element.data()));
    }

    print("total movies: ${_movies.length}");

    posterMovie = _movies.where((element) => element.id=='poster').first;

    _movies.removeWhere((element) => element.releaseDate.isAfter(DateTime.now()));
    _movies.removeWhere((element) => element.id=='poster');


  }

  List<Movie> get getMovies  => _movies;

}
