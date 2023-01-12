import 'package:netflix_clone/services/auth_service.dart';
import 'package:netflix_clone/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:netflix_clone/ui/views/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:netflix_clone/ui/views/login/login_view.dart';
import 'package:netflix_clone/ui/views/signup/signup_view.dart';
import 'package:netflix_clone/ui/views/on_boarding/on_boarding_view.dart';
import 'package:netflix_clone/ui/views/select_profile/select_profile_view.dart';
import 'package:netflix_clone/ui/views/edit_profile/edit_profile_view.dart';
import 'package:netflix_clone/ui/views/home/home_view.dart';
import 'package:netflix_clone/ui/views/dashboard/dashboard_view.dart';
import 'package:netflix_clone/ui/views/video_player_screen/video_player_screen_view.dart';
import 'package:netflix_clone/ui/views/search/search_view.dart';
import 'package:netflix_clone/ui/views/coming_soon/coming_soon_view.dart';
import 'package:netflix_clone/ui/views/movie_details_screen/movie_details_screen_view.dart';
import 'package:netflix_clone/ui/views/more/more_view.dart';
// @stacked-import

@StackedApp(routes: [
  MaterialRoute(page: StartupView, initial: true ),
MaterialRoute(page: LoginView),
MaterialRoute(page: SignupView),
MaterialRoute(page: OnBoardingView),
MaterialRoute(page: SelectProfileView),
MaterialRoute(page: EditProfileView),
MaterialRoute(page: HomeView),
MaterialRoute(page: DashboardView),
MaterialRoute(page: VideoPlayerScreenView),
MaterialRoute(page: SearchView),
MaterialRoute(page: ComingSoonView),
MaterialRoute(page: MovieDetailsScreenView),
MaterialRoute(page: MoreView),
// @stacked-route
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: AuthService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: DashboardViewModel)

  // LazySingleton(classType: DialogService),
  // @stacked-service
])
class App {}

