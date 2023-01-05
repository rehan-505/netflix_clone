import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  ///returns success status
  Future<bool> signInWithEmailAndPass(String email,String pass) async{

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);

    return FirebaseAuth.instance.currentUser!=null;

  }


  Future<bool> signUpWithEmailAndPass(String email,String pass, {String? name}) async{

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass);
    return FirebaseAuth.instance.currentUser!=null;

  }

  Future<bool> sendResetEmail(String email) async{

    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    return true;

  }

  bool isCurrentUserLogin() => FirebaseAuth.instance.currentUser!=null;


}
