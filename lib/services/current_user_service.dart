
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:netflix_clone/models/app_user.dart';
import 'package:netflix_clone/models/profile.dart';

class CurrentUserService {
  AppUser? myUser;
  Profile? currentProfile;


  Future<void> loadCurrentUser() async{
    try{
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get();
      myUser = AppUser.fromJson(documentSnapshot.data()!);
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
    myUser = user;
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
        currentProfile=profile;
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
    return "assets/images/profile_avatars/img_${myUser!.profiles.length}.png";
  }

  Future renameProfile(Profile prof) async{

    for (int i=0; i<myUser!.profiles.length; i++) {
      if(myUser!.profiles[i].id==prof.id){
        myUser!.profiles[i] = prof;

        break;
      }
    }


    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
      "profiles" : myUser!.profiles.map((e) => e.toJson()).toList()
    });

  }

  ///return 1 slot out of 5
  // int getAvailableProfileSlot() {
  //   for(int i=0; i<5;i++){
  //     if(!(myUser!.profiles[i].id.contains(i.toString()))){
  //       return i;
  //     }
  //   }
  //
  //   return 99;
  // }

}
