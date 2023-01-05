import 'package:netflix_clone/services/auth_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:netflix_clone/ui/views/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:netflix_clone/ui/views/startup/startup_view.dart';
import 'package:netflix_clone/ui/views/splash/splash_view.dart';
import 'package:netflix_clone/ui/views/login/login_view.dart';
import 'package:netflix_clone/ui/views/signup/signup_view.dart';
import 'package:netflix_clone/ui/views/on_boarding/on_boarding_view.dart';
// @stacked-import

@StackedApp(routes: [
  MaterialRoute(page: StartupView, initial: true ),
MaterialRoute(page: SplashView,),
MaterialRoute(page: LoginView),
MaterialRoute(page: SignupView),
MaterialRoute(page: OnBoardingView),
// @stacked-route
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: AuthService),
  // LazySingleton(classType: DialogService),
  // LazySingleton(classType: BottomSheetService),
  // @stacked-service
])
class App {}

