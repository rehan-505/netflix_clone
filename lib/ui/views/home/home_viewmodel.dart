import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:netflix_clone/app/app.locator.dart';
import 'package:netflix_clone/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../models/movie.dart';
import '../../../services/current_user_service.dart';

class HomeViewModel extends StreamViewModel {

  final NavigationService _navigationService = locator<NavigationService>();

  final List<Movie> _movies = [];
  late Movie posterMovie;

  final CurrentUserService userService = locator<CurrentUserService>();


  @override
  Stream<QuerySnapshot<Map<String,dynamic>>> get stream => FirebaseFirestore.instance.collection('movies').snapshots();

  void fillList(List<QueryDocumentSnapshot<Map<String,dynamic>>> docs){
    _movies.clear();
    for (var element in docs) {
      _movies.add(Movie.fromJson(element.data()));
    }

    posterMovie = _movies.where((element) => element.id=='poster').first;

    _movies.removeWhere((element) => element.releaseDate.isAfter(DateTime.now()));
    _movies.removeWhere((element) => element.id=='poster');


  }

  List<Movie> get getMovies  => _movies;

  void detailsAndInfoTapped(Movie movie){
    _navigationService.back();
    _navigationService.navigateTo(Routes.movieDetailsScreenView,arguments: MovieDetailsScreenViewArguments(movie: movie) );

  }

}
