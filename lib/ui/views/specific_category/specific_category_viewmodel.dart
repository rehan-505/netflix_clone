import 'package:netflix_clone/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../enums/movie_category.dart';
import '../../../models/movie.dart';

class SpecificCategoryViewModel extends BaseViewModel {
  SpecificCategoryViewModel({
    required this.movieCategory,
    required this.movies,
  });

  final MovieCategory movieCategory;
  final List<Movie> movies;
  final NavigationService _navigationService = locator<NavigationService>();


  void navigateToDetailsPage(Movie movie){
    _navigationService.navigateTo(Routes.movieDetailsScreenView,arguments: MovieDetailsScreenViewArguments(movie: movie,showAppBarActions: false));

  }
}
