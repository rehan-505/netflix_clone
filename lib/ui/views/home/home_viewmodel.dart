import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:netflix_clone/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

import '../../../enums/movie_category.dart';
import '../../../models/movie.dart';

class HomeViewModel extends StreamViewModel {

  bool uploading = false;

  Movie? _movie;


  @override
  // TODO: implement stream
  Stream<DocumentSnapshot<Map<String,dynamic>>> get stream => FirebaseFirestore.instance.collection('movies').doc('poster').snapshots();

  void setMovie(Map<String,dynamic> map){
    _movie = Movie.fromJson(map);
  }

  Movie? get getMovie  => _movie;

}
