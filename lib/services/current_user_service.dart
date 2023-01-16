
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:netflix_clone/app/app.locator.dart';
import 'package:netflix_clone/models/app_user.dart';
import 'package:netflix_clone/models/profile.dart';
import 'package:netflix_clone/services/firebase_service.dart';

import '../models/movie.dart';

class CurrentUserService {
  AppUser? _myUser;
  Profile? currentProfile;
  final FirebaseService _firebaseService = locator<FirebaseService>();

  AppUser? get myUser => _myUser;


  Future<void> loadCurrentUser() async{
    try{
      _myUser = await _firebaseService.getCurrentUserFromDb();
    }
    catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
  }


  Future<bool> currentUserExistsInDB() async{
    return (await _firebaseService.currentUserExistsInDB()) ?? false;
  }

  Future<void> updateCurrentUser(AppUser user) async{
    _myUser = user;
    await _firebaseService.updateUser(user);
  }

  Future<void> addProfile(Profile profile) async{
    myUser!.profiles.add(profile);
    await _firebaseService.addProfile(profile);
    if(myUser!.profiles.length==1){
      currentProfile=myUser!.profiles[0];
    }
  }

  Future<void> deleteProfile(Profile profile) async{
    myUser!.profiles.removeWhere((element) => element.id==profile.id);
    await _firebaseService.updateProfilesInDB(_myUser!.profiles);
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
    await _firebaseService.updateProfilesInDB(myUser!.profiles);
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
  }

  void clearUserData()async{
    _myUser = null;
    currentProfile = null;
    return;
  }

}
