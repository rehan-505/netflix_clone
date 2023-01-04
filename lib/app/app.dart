import 'package:stacked/stacked_annotations.dart';
import 'package:netflix_clone/ui/views/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:netflix_clone/ui/views/startup/startup_view.dart';
import 'package:netflix_clone/ui/views/splash/splash_view.dart';
// @stacked-import

@StackedApp(routes: [
  MaterialRoute(page: StartupView, ),
MaterialRoute(page: SplashView,initial: true),
// @stacked-route
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: BottomSheetService),
  // @stacked-service
])
class App {}

