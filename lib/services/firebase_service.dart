import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:netflix_clone/models/app_user.dart';
import 'package:netflix_clone/utils/firestore_collections.dart';

import '../models/profile.dart';

class FirebaseService {

  final FirebaseFirestore _firebaseRef = FirebaseFirestore.instance;

  User? getCurrentUser(){
    return FirebaseAuth.instance.currentUser;
  }

  Future<AppUser?> getCurrentUserFromDb()async{
    try{
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance
              .collection(MyCollections.users)
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get();
      return AppUser.fromJson(documentSnapshot.data()!);
    }
    catch(e){
      if (kDebugMode) {
        print(e);
        rethrow;

      }
    }
    return null;

  }

  Stream<QuerySnapshot<Map<String,dynamic>>> getMoviesStream(){
    return _firebaseRef.collection(MyCollections.movies).snapshots();
  }

  Future<DocumentSnapshot<Map<String,dynamic>>> getMovie(String id) async{
   return await FirebaseFirestore.instance.collection('movies').doc(id).get();
  }

  Stream<DocumentSnapshot<Map<String,dynamic>>> getCurrentUserStream(){
    return _firebaseRef.collection(MyCollections.users).doc(getCurrentUser()!.uid).snapshots();
  }

  Future<bool?> currentUserExistsInDB() async{
    try{
      return (await FirebaseFirestore.instance
              .collection(MyCollections.users)
              .doc(getCurrentUser()!.uid)
              .get())
          .exists;
    }
    catch(e){
      if (kDebugMode) {
        print(e);
        rethrow;

      }
    }
    return null;

  }


  Future<void> updateUser(AppUser user) async{
    try{
      await FirebaseFirestore.instance
          .collection(MyCollections.users)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(user.toJson());
    }
    catch(e){
      if (kDebugMode) {
        print(e);
        rethrow;

      }
    }

  }

  Future<void> addProfile(Profile profile) async{
    try{

      List temp = [profile.toJson()];
      await FirebaseFirestore.instance
          .collection(MyCollections.users)
          .doc(getCurrentUser()!.uid)
          .update({'profiles': FieldValue.arrayUnion(temp)});

    }
    catch(e){
      if (kDebugMode) {
        print(e);
        rethrow;
      }
    }
  }


  Future<void> updateProfilesInDB(List<Profile> profiles) async{
    try{
      await FirebaseFirestore.instance
          .collection(MyCollections.users)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"profiles": profiles.map((e) => e.toJson()).toList()});
    }
    catch(e){
      if (kDebugMode) {
        print(e);
        rethrow;

      }
    }

  }


}
