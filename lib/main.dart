import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/app/app.locator.dart';
import 'package:netflix_clone/ui/common/app_colors.dart';
import 'package:netflix_clone/ui/setup/setup_bottom_sheet_ui.dart';
import 'package:netflix_clone/ui/setup/setup_dialog_ui.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/app.router.dart';

void main() async{


  setupLocator();
  // setupDialogUi();
  // setupBottomSheetUi();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


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
            theme: Theme.of(context).copyWith(

              primaryColor: kcPrimaryColor,
              backgroundColor: kcBackgroundColor,

              focusColor: kcPrimaryColor,
              textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
              ),
            ),
            initialRoute: Routes.loginView,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
          );
        });
  }
}

