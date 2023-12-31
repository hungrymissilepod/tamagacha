import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_template/app/app.bottomsheets.dart';
import 'package:flutter_app_template/app/app.dialogs.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/app/app.router.dart';
import 'package:flutter_app_template/services/health_service.dart';
import 'package:flutter_app_template/services/user_pets_service.dart';
import 'package:flutter_app_template/services/user_service.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:permission_handler/permission_handler.dart';

/*
TODO:
- pets can gain EXP and level up?
- add more pets and gifs

IMPROVEMENTS:
- Add refresh button to refetch user step data
- Add debouncer to fetch user step data every 30 seconds?
- Add debouncer to check pet health every 60 minutes
*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  if (Platform.isAndroid) {
    await Permission.activityRecognition.request();
    await Permission.location.request();
  }
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  final UserPetsService userPetsService = locator<UserPetsService>();
  final HealthService healthService = locator<HealthService>();
  final UserService userService = locator<UserService>();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return FGBGNotifier(
      onEvent: (FGBGType value) async {
        if (value == FGBGType.foreground) {
          print(value.toString());
          await healthService.fetchStepData();
          await userService.updateBaseLevelSteps(healthService.lifeTimeSteps);
          await userPetsService.checkPetHealth();
        }
      },
      child: MaterialApp(
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
      ),
    );
  }
}
