import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../models/movie.dart';
import '../../../services/current_user_service.dart';

class MylistViewModel extends BaseViewModel {
  late final List<Movie> _movies;

  final NavigationService _navigationService = locator<NavigationService>();
  final CurrentUserService _userService = locator<CurrentUserService>();

  CurrentUserService get userService => _userService;




  void navigateToDetailsPage(Movie movie){
    _navigationService.navigateTo(Routes.movieDetailsScreenView,arguments: MovieDetailsScreenViewArguments(movie: movie,showAppBarActions: false));
  }

  // void fillList(){
  //   _movies = _userService.get;
  // }
}
