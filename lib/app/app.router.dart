// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i20;
import 'package:flutter/material.dart';
import 'package:netflix_clone/enums/movie_category.dart' as _i23;
import 'package:netflix_clone/models/movie.dart' as _i22;
import 'package:netflix_clone/models/profile.dart' as _i21;
import 'package:netflix_clone/ui/views/add_profile/add_profile_view.dart'
    as _i15;
import 'package:netflix_clone/ui/views/coming_soon/coming_soon_view.dart'
    as _i12;
import 'package:netflix_clone/ui/views/dashboard/dashboard_view.dart' as _i9;
import 'package:netflix_clone/ui/views/edit_profile/edit_profile_view.dart'
    as _i7;
import 'package:netflix_clone/ui/views/forgot_pass/forgot_pass_view.dart'
    as _i16;
import 'package:netflix_clone/ui/views/home/home_view.dart' as _i8;
import 'package:netflix_clone/ui/views/login/login_view.dart' as _i3;
import 'package:netflix_clone/ui/views/more/more_view.dart' as _i14;
import 'package:netflix_clone/ui/views/movie_details_screen/movie_details_screen_view.dart'
    as _i13;
import 'package:netflix_clone/ui/views/my_account/my_account_view.dart' as _i19;
import 'package:netflix_clone/ui/views/mylist/mylist_view.dart' as _i17;
import 'package:netflix_clone/ui/views/on_boarding/on_boarding_view.dart'
    as _i5;
import 'package:netflix_clone/ui/views/search/search_view.dart' as _i11;
import 'package:netflix_clone/ui/views/select_profile/select_profile_view.dart'
    as _i6;
import 'package:netflix_clone/ui/views/signup/signup_view.dart' as _i4;
import 'package:netflix_clone/ui/views/specific_category/specific_category_view.dart'
    as _i18;
import 'package:netflix_clone/ui/views/startup/startup_view.dart' as _i2;
import 'package:netflix_clone/ui/views/video_player_screen/video_player_screen_view.dart'
    as _i10;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i24;

class Routes {
  static const startupView = '/';

  static const loginView = '/login-view';

  static const signupView = '/signup-view';

  static const onBoardingView = '/on-boarding-view';

  static const selectProfileView = '/select-profile-view';

  static const editProfileView = '/edit-profile-view';

  static const homeView = '/home-view';

  static const dashboardView = '/dashboard-view';

  static const videoPlayerScreenView = '/video-player-screen-view';

  static const searchView = '/search-view';

  static const comingSoonView = '/coming-soon-view';

  static const movieDetailsScreenView = '/movie-details-screen-view';

  static const moreView = '/more-view';

  static const addProfileView = '/add-profile-view';

  static const forgotPassView = '/forgot-pass-view';

  static const mylistView = '/mylist-view';

  static const specificCategoryView = '/specific-category-view';

  static const myAccountView = '/my-account-view';

  static const all = <String>{
    startupView,
    loginView,
    signupView,
    onBoardingView,
    selectProfileView,
    editProfileView,
    homeView,
    dashboardView,
    videoPlayerScreenView,
    searchView,
    comingSoonView,
    movieDetailsScreenView,
    moreView,
    addProfileView,
    forgotPassView,
    mylistView,
    specificCategoryView,
    myAccountView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i4.SignupView,
    ),
    _i1.RouteDef(
      Routes.onBoardingView,
      page: _i5.OnBoardingView,
    ),
    _i1.RouteDef(
      Routes.selectProfileView,
      page: _i6.SelectProfileView,
    ),
    _i1.RouteDef(
      Routes.editProfileView,
      page: _i7.EditProfileView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i8.HomeView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i9.DashboardView,
    ),
    _i1.RouteDef(
      Routes.videoPlayerScreenView,
      page: _i10.VideoPlayerScreenView,
    ),
    _i1.RouteDef(
      Routes.searchView,
      page: _i11.SearchView,
    ),
    _i1.RouteDef(
      Routes.comingSoonView,
      page: _i12.ComingSoonView,
    ),
    _i1.RouteDef(
      Routes.movieDetailsScreenView,
      page: _i13.MovieDetailsScreenView,
    ),
    _i1.RouteDef(
      Routes.moreView,
      page: _i14.MoreView,
    ),
    _i1.RouteDef(
      Routes.addProfileView,
      page: _i15.AddProfileView,
    ),
    _i1.RouteDef(
      Routes.forgotPassView,
      page: _i16.ForgotPassView,
    ),
    _i1.RouteDef(
      Routes.mylistView,
      page: _i17.MylistView,
    ),
    _i1.RouteDef(
      Routes.specificCategoryView,
      page: _i18.SpecificCategoryView,
    ),
    _i1.RouteDef(
      Routes.myAccountView,
      page: _i19.MyAccountView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
        settings: data,
      );
    },
    _i4.SignupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.SignupView(),
        settings: data,
      );
    },
    _i5.OnBoardingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.OnBoardingView(),
        settings: data,
      );
    },
    _i6.SelectProfileView: (data) {
      final args = data.getArgs<SelectProfileViewArguments>(
        orElse: () => const SelectProfileViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i6.SelectProfileView(
            key: args.key, onlyEditClickedView: args.onlyEditClickedView),
        settings: data,
      );
    },
    _i7.EditProfileView: (data) {
      final args = data.getArgs<EditProfileViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.EditProfileView(key: args.key, profile: args.profile),
        settings: data,
      );
    },
    _i8.HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.HomeView(),
        settings: data,
      );
    },
    _i9.DashboardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.DashboardView(),
        settings: data,
      );
    },
    _i10.VideoPlayerScreenView: (data) {
      final args = data.getArgs<VideoPlayerScreenViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i10.VideoPlayerScreenView(
            key: args.key, movieLink: args.movieLink),
        settings: data,
      );
    },
    _i11.SearchView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.SearchView(),
        settings: data,
      );
    },
    _i12.ComingSoonView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.ComingSoonView(),
        settings: data,
      );
    },
    _i13.MovieDetailsScreenView: (data) {
      final args = data.getArgs<MovieDetailsScreenViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i13.MovieDetailsScreenView(
            key: args.key,
            movie: args.movie,
            showAppBarActions: args.showAppBarActions),
        settings: data,
      );
    },
    _i14.MoreView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.MoreView(),
        settings: data,
      );
    },
    _i15.AddProfileView: (data) {
      final args = data.getArgs<AddProfileViewArguments>(
        orElse: () => const AddProfileViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i15.AddProfileView(
            key: args.key, nextRoute: args.nextRoute, backIcon: args.backIcon),
        settings: data,
      );
    },
    _i16.ForgotPassView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.ForgotPassView(),
        settings: data,
      );
    },
    _i17.MylistView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.MylistView(),
        settings: data,
      );
    },
    _i18.SpecificCategoryView: (data) {
      final args = data.getArgs<SpecificCategoryViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i18.SpecificCategoryView(
            key: args.key,
            movieCategory: args.movieCategory,
            movies: args.movies),
        settings: data,
      );
    },
    _i19.MyAccountView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.MyAccountView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class SelectProfileViewArguments {
  const SelectProfileViewArguments({
    this.key,
    this.onlyEditClickedView = false,
  });

  final _i20.Key? key;

  final bool onlyEditClickedView;
}

class EditProfileViewArguments {
  const EditProfileViewArguments({
    this.key,
    required this.profile,
  });

  final _i20.Key? key;

  final _i21.Profile profile;
}

class VideoPlayerScreenViewArguments {
  const VideoPlayerScreenViewArguments({
    this.key,
    required this.movieLink,
  });

  final _i20.Key? key;

  final String movieLink;
}

class MovieDetailsScreenViewArguments {
  const MovieDetailsScreenViewArguments({
    this.key,
    required this.movie,
    this.showAppBarActions = true,
  });

  final _i20.Key? key;

  final _i22.Movie movie;

  final bool showAppBarActions;
}

class AddProfileViewArguments {
  const AddProfileViewArguments({
    this.key,
    this.nextRoute,
    this.backIcon = false,
  });

  final _i20.Key? key;

  final String? nextRoute;

  final bool backIcon;
}

class SpecificCategoryViewArguments {
  const SpecificCategoryViewArguments({
    this.key,
    required this.movieCategory,
    required this.movies,
  });

  final _i20.Key? key;

  final _i23.MovieCategory movieCategory;

  final List<_i22.Movie> movies;
}

extension NavigatorStateExtension on _i24.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnBoardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onBoardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSelectProfileView({
    _i20.Key? key,
    bool onlyEditClickedView = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.selectProfileView,
        arguments: SelectProfileViewArguments(
            key: key, onlyEditClickedView: onlyEditClickedView),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditProfileView({
    _i20.Key? key,
    required _i21.Profile profile,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editProfileView,
        arguments: EditProfileViewArguments(key: key, profile: profile),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVideoPlayerScreenView({
    _i20.Key? key,
    required String movieLink,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.videoPlayerScreenView,
        arguments:
            VideoPlayerScreenViewArguments(key: key, movieLink: movieLink),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.searchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToComingSoonView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.comingSoonView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMovieDetailsScreenView({
    _i20.Key? key,
    required _i22.Movie movie,
    bool showAppBarActions = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.movieDetailsScreenView,
        arguments: MovieDetailsScreenViewArguments(
            key: key, movie: movie, showAppBarActions: showAppBarActions),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMoreView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.moreView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddProfileView({
    _i20.Key? key,
    String? nextRoute,
    bool backIcon = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addProfileView,
        arguments: AddProfileViewArguments(
            key: key, nextRoute: nextRoute, backIcon: backIcon),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPassView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPassView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMylistView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mylistView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSpecificCategoryView({
    _i20.Key? key,
    required _i23.MovieCategory movieCategory,
    required List<_i22.Movie> movies,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.specificCategoryView,
        arguments: SpecificCategoryViewArguments(
            key: key, movieCategory: movieCategory, movies: movies),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.myAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnBoardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onBoardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSelectProfileView({
    _i20.Key? key,
    bool onlyEditClickedView = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.selectProfileView,
        arguments: SelectProfileViewArguments(
            key: key, onlyEditClickedView: onlyEditClickedView),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditProfileView({
    _i20.Key? key,
    required _i21.Profile profile,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editProfileView,
        arguments: EditProfileViewArguments(key: key, profile: profile),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVideoPlayerScreenView({
    _i20.Key? key,
    required String movieLink,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.videoPlayerScreenView,
        arguments:
            VideoPlayerScreenViewArguments(key: key, movieLink: movieLink),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.searchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithComingSoonView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.comingSoonView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMovieDetailsScreenView({
    _i20.Key? key,
    required _i22.Movie movie,
    bool showAppBarActions = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.movieDetailsScreenView,
        arguments: MovieDetailsScreenViewArguments(
            key: key, movie: movie, showAppBarActions: showAppBarActions),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMoreView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.moreView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddProfileView({
    _i20.Key? key,
    String? nextRoute,
    bool backIcon = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addProfileView,
        arguments: AddProfileViewArguments(
            key: key, nextRoute: nextRoute, backIcon: backIcon),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPassView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotPassView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMylistView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mylistView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSpecificCategoryView({
    _i20.Key? key,
    required _i23.MovieCategory movieCategory,
    required List<_i22.Movie> movies,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.specificCategoryView,
        arguments: SpecificCategoryViewArguments(
            key: key, movieCategory: movieCategory, movies: movies),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.myAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
