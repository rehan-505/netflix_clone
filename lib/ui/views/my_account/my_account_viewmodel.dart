import 'package:netflix_clone/services/firebase_service.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import '../../../app/app.locator.dart';

class MyAccountViewModel extends BaseViewModel {
  final FirebaseService _firebaseService = locator<FirebaseService>();


  String getJoiningDate(){
    DateTime dateTime = _firebaseService.getCurrentUser()!.metadata.creationTime!;
    String date = DateFormat("MMM ").format(dateTime);
    date = "$date ${dateTime.year}";
    return date;
  }

  String getEmail(){
    return _firebaseService.getCurrentUser()!.email!;
  }
}
