import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/app/app.locator.dart';
import 'package:netflix_clone/ui/common/app_colors.dart';
import 'package:netflix_clone/ui/views/dashboard/dashboard_view.dart';
import 'package:netflix_clone/ui/views/movie_details_screen/movie_details_screen_view.dart';
import 'package:netflix_clone/ui/views/my_account/my_account_view.dart';
import 'package:netflix_clone/ui/views/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/app.router.dart';

void main() async{


  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return ScreenUtilInit(
        designSize: const Size(392.727272, 825.4545),
        minTextAdapt: true,
        splitScreenMode: true,

        builder: (context,c){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              bottomSheetTheme: BottomSheetThemeData(
                  backgroundColor: Colors.grey[900],
              ),
              primarySwatch: Colors.red,
              primaryColor: kcPrimaryColor,
              backgroundColor: kcBackgroundColor,
              focusColor: kcPrimaryColor,
              textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.white,displayColor: Colors.white),
            ),
            // home: const OnBoardingView(),
            // initialRoute: Routes.onBoardingView,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            // home: MyAccountView(),
            // home: const StartupView(),
          );
        });
  }
}
