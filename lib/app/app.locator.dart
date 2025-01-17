// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';

import '../services/auth_service.dart';
import '../services/bottom_navbar_service.dart';
import '../services/current_user_service.dart';
import '../services/download_service.dart';
import '../services/firebase_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => CurrentUserService());
  locator.registerLazySingleton(() => DownloadService());
  locator.registerLazySingleton(() => BottomNavbarService());
  locator.registerLazySingleton(() => FirebaseService());
}
