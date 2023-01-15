
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:netflix_clone/models/app_user.dart';
import 'package:netflix_clone/models/profile.dart';

import '../models/movie.dart';

class CurrentUserService {
  AppUser? _myUser;
  Profile? currentProfile;

  AppUser? get myUser => _myUser;


  Future<void> loadCurrentUser() async{
    try{
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get();
      _myUser = AppUser.fromJson(documentSnapshot.data()!);
    }
    catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
  }


  Future<bool> currentUserExistsInDB() async{
    return (await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get()).exists;
  }

  Future<void> updateCurrentUser(AppUser user) async{
    _myUser = user;
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set(user.toJson());
  }

  Future<void> addProfile(Profile profile) async{
    try{
      myUser!.profiles.add(profile);
      List temp = [profile.toJson()];

      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'profiles': FieldValue.arrayUnion(temp)});

      if(myUser!.profiles.length==1){
        currentProfile=myUser!.profiles[0];
      }
    }
    catch(e){
      if (kDebugMode) {
        print(e);
        rethrow;

      }
    }
  }

  Future<void> deleteProfile(Profile profile) async{
    try{
      myUser!.profiles.removeWhere((element) => element.id==profile.id);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'profiles': myUser!.profiles.map((e) => e.toJson()).toList()});


    }
    catch(e){
      if (kDebugMode) {
        print(e);
        rethrow;

      }
    }
  }


  String getNewProfileImgPath(){
    return "assets/images/profile_avatars/img_${getAvailableProfileSlot()}.png";
  }

  Future renameProfile(Profile prof) async{

    for (int i=0; i<myUser!.profiles.length; i++) {
      if(myUser!.profiles[i].id==prof.id){
        myUser!.profiles[i] = prof;

        break;
      }
    }

    await updateProfilesInDB();

  }

  Future addMovieToProfile( String movieId) async{
    currentProfile!.moviesList.add(movieId);

    await updateProfilesInDB();

  }


  Future removeMovieFromProfile( String movieId) async{
    currentProfile!.moviesList.remove(movieId);


    for (int i=0; i<myUser!.profiles.length; i++) {
      if(myUser!.profiles[i].id==currentProfile!.id){
        myUser!.profiles[i].moviesList.removeWhere((element) => element==movieId);
        break;
      }
    }

    await updateProfilesInDB();

  }


  Future<void> updateProfilesInDB() async{
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
      "profiles" : myUser!.profiles.map((e) => e.toJson()).toList()
    });
  }

  bool movieExistsInProfileList(String id){
    return currentProfile!.moviesList.contains(id);
  }

  List<Movie> getMyListMovies(List<Movie> allMovies){
    return allMovies.where((Movie element) => currentProfile!.moviesList.contains(element.id.toString())).toList();
  }

  List<Movie> getMyListMoviesFromUser(AppUser user,List<Movie> allMovies){
    Profile profile = user.profiles.where((element) => element.id==currentProfile!.id).first;
    return allMovies.where((Movie element) => profile.moviesList.contains(element.id.toString())).toList();
  }




  void changeCurrentProfile(Profile profile){

    for(int i=0; i<myUser!.profiles.length; i++){
      if(myUser!.profiles[i].id==profile.id){
        currentProfile = myUser!.profiles[i];
        break;
      }
    }

  }

  ///return 1 slot out of total 5 available
  int getAvailableProfileSlot() {
    late String profileId;
    int availableSlot = myUser!.profiles.length;

    ///return smallest free slot
    for(int i=0; i<myUser!.profiles.length;i++){
      profileId = "profile_$i";
      if(!(myUser!.profiles.any((element) => element.id==profileId))){
        availableSlot = i;
        break;
      }
    }

    return availableSlot;
  }


  Future signOut() async{
    await FirebaseAuth.instance.signOut();
    _clearUserData();
  }

  void _clearUserData(){
    _myUser = null;
    currentProfile = null;
    return;
  }

}
