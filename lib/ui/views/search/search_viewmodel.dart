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


  final CurrentUserService userService = locator<CurrentUserService>();

  final List<Movie> _movies = [];

  List<Movie> get movies => _movies;


  @override
  // TODO: implement stream
  Stream<QuerySnapshot<Map<String,dynamic>>> get stream => FirebaseFirestore.instance.collection('movies').snapshots();

  void fillList(List<QueryDocumentSnapshot<Map<String,dynamic>>> docs) async{
    _movies.clear();
    for (var element in docs) {
      _movies.add(Movie.fromJson(element.data()));
    }

    _movies.removeWhere((element) => element.releaseDate.isAfter(DateTime.now()));
    _movies.removeWhere((element) => element.id=='poster');


  }

  void onChanged(String value){
    notifyListeners();
  }

}
