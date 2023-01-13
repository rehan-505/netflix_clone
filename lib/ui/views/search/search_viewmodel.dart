import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/current_user_service.dart';

class SearchViewModel extends BaseViewModel {
  FocusNode focusNode = FocusNode();

  final CurrentUserService userService = locator<CurrentUserService>();


}
