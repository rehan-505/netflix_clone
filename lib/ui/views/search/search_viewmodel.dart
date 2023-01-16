import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../models/movie.dart';
import '../../../services/current_user_service.dart';

class SearchViewModel extends StreamViewModel {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  FocusNode get focusNode => _focusNode;
  TextEditingController get textEditingController => _textEditingController;
  String searchText = '';


  final CurrentUserService userService = locator<CurrentUserService>();

  final List<Movie> _movies = [];
  List<Movie> _searchResultMovies = [];


  // List<Movie> get movies => _movies;
  List<Movie> get searchResultMovies => _searchResultMovies;



  @override
  // TODO: implement stream
  Stream<QuerySnapshot<Map<String,dynamic>>> get stream => FirebaseFirestore.instance.collection('movies').snapshots();

  void fillList(List<QueryDocumentSnapshot<Map<String,dynamic>>> docs) async{
    _movies.clear();
    for (var element in docs) {
      _movies.add(Movie.fromJson(element.data()));
    }
    _movies.removeWhere((element) => element.releaseDate.isAfter(DateTime.now()));
    fillSearchResultMovies();

  }

  void onChanged(String value){
    fillSearchResultMovies();
    searchText = textEditingController.text;
    notifyListeners();
  }

  void fillSearchResultMovies(){
    if(_textEditingController.text.isEmpty){
      _searchResultMovies = List<Movie>.from(_movies);
      return;
    }
    else {
      if(textEditingController.text.length < searchText.length){
        _searchResultMovies = List<Movie>.from(_movies.where((element) => element.title.toLowerCase().contains(_textEditingController.text.toLowerCase())));
      }
      else{
        _searchResultMovies.removeWhere((element) => !(element.title.toLowerCase().contains(_textEditingController.text.toLowerCase())));
      }
    }
  }

}
