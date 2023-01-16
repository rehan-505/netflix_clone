
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/app/app.locator.dart';
import 'package:netflix_clone/app/app.router.dart';
import 'package:netflix_clone/enums/movie_category.dart';
import 'package:netflix_clone/models/app_user.dart';
import 'package:netflix_clone/services/download_service.dart';
import 'package:netflix_clone/services/firebase_service.dart';
import 'package:netflix_clone/ui/views/movie_details_screen/movie_details_screen_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../models/movie.dart';
import '../../../services/current_user_service.dart';

class HomeViewModel extends StreamViewModel {

  final NavigationService _navigationService = locator<NavigationService>();

  final List<Movie> _filteredMovies = [];
  final List<Movie> _releasedMovies = [];
  late Movie _posterMovie;

  bool downloadPressed = false;

  Movie get posterMovie => _posterMovie;

  final CurrentUserService _userService = locator<CurrentUserService>();

  CurrentUserService get userService => _userService;

  final DownloadService _downloadService = locator<DownloadService>();
  final FirebaseService _firebaseService = locator<FirebaseService>();


  ///for my list
  Stream<DocumentSnapshot<Map<String,dynamic>>> get userStream => _firebaseService.getCurrentUserStream();


  @override
  Stream<QuerySnapshot<Map<String,dynamic>>> get stream => _firebaseService.getMoviesStream();

  void fillList(List<QueryDocumentSnapshot<Map<String,dynamic>>> docs){
    _filteredMovies.clear();
    _releasedMovies.clear();
    for (var element in docs) {
      _filteredMovies.add(Movie.fromJson(element.data()));
      _releasedMovies.add(Movie.fromJson(element.data()));


    }

    _posterMovie = _filteredMovies.where((element) => element.id=='poster').first;

    _filteredMovies.removeWhere((element) => element.releaseDate.isAfter(DateTime.now()));
    _releasedMovies.removeWhere((element) => element.releaseDate.isAfter(DateTime.now()));

    _filteredMovies.removeWhere((element) => element.id=='poster');

  }

  List<Movie> get getFilteredMovies  => _filteredMovies;
  List<Movie> get getReleasedMovies  => _releasedMovies;


  void detailsAndInfoTapped(Movie movie,BuildContext context,{bool fromPoster = false}){
    if(!fromPoster){
      _navigationService.back();
    }

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return MovieDetailsScreenView(movie: movie);
    }));

  }

  bool uploaded = false;

  // uploadMovies() async{
  //   if(uploaded){
  //     return;
  //   }
  //   uploaded = true;
  //
  //   for (int i=0; i<_releasedMovies.length; i++){
  //     Movie movie = _releasedMovies[i];
  //     if(movie.category == MovieCategory.action.name){
  //       await FirebaseFirestore.instance.collection("movies")
  //           .doc(movie.id)
  //           .update({
  //         "videoUrl": "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/VID_20230116_154853.mp4?alt=media&token=6c649092-9ce2-455f-a8db-11163f8c6eb5"
  //       });
  //     }
  //   }
  //
  // }

  void navigateBack(){
    _navigationService.back();
  }

  void navigateToCategoryScreen(MovieCategory movieCategory){
    navigateBack();
    _navigationService.navigateToSpecificCategoryView(movieCategory: movieCategory, movies: _releasedMovies.where((element) => element.category==movieCategory.name).toList());
  }

  List<Movie> getUpdatedMyList(DocumentSnapshot<Map<String,dynamic>> snapshot){
    AppUser appUser = AppUser.fromJson(snapshot.data()!);
    return _userService.getMyListMoviesFromUser(appUser, _releasedMovies);
  }

  void playVideo(Movie movie,{bool popSheet = false, BuildContext? context}){
    if(popSheet){
      Navigator.pop(context!);
    }
    _navigationService.navigateToVideoPlayerScreenView(movieLink: movie.videoUrl);
  }

  void handleAddToListClicked(Movie movie){
    if(userService.movieExistsInProfileList(movie.id)){
      _removeMovieFromProfile(movie.id);
    }
    else{
      _addMovieToProfile(movie.id);
    }
  }

  void initializeDownload(){
    _downloadService.initialize();
  }

  Future downloadMovie(Movie movie) async{

    if(!downloadPressed){
      downloadPressed = true;
      _downloadService.downloadMovie(movie.videoUrl,fileName: movie.title);
      notifyListeners();
    }

  }

  void makeDownloadPressedFalse(){
    downloadPressed = false;
  }

  void _addMovieToProfile(String id){
    _userService.addMovieToProfile(id);
    notifyListeners();
  }

  void _removeMovieFromProfile(String id){
    _userService.removeMovieFromProfile(id);
    notifyListeners();
  }

  @override
  void dispose() {

    _downloadService.dispose();
    super.dispose();
  }

}
