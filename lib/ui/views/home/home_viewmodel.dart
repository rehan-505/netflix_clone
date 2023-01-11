import 'package:netflix_clone/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {

  final BottomSheetService bottomSheetService = locator<BottomSheetService>();

  void showBottomSheet(){
    bottomSheetService.showBottomSheet(title: "Hello",);

  }
}
