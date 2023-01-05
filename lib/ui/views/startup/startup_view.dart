import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:netflix_clone/ui/common/ui_helpers.dart';

import '../../common/app_colors.dart';
import 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcBackgroundColor,
        body: Center(
          child: Lottie.asset('assets/animations/netflix-logo-animation.json',repeat: false),
        ),
      ),
      onModelReady: (model) => SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => model.runStartupLogic()),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}

