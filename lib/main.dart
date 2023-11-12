import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_template/app/app.bottomsheets.dart';
import 'package:flutter_app_template/app/app.dialogs.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:permission_handler/permission_handler.dart';

/*
TODO:

- display pet rarity in saved pets view cards
- pets hunger needs to decrease over a specified time (30 minutes?)
- need to keep track of last time pets hunger was checked. check again each 30 minutes and each time app is opened and foregrounded. just like how we check the steps
- if a pet's hunger reaches 0 they die. Show a dialog to user telling them that their pet died and remove their pet
- Show dialog when user gets a new pet. Allow user to name pet and save it's given name
- pets can gain EXP and level up?
- users need to scan a QR code in order to get a pet (can skip this in DEV mode)
- add sound effects to; spinning the wheel, landing on an item, pet levels up, etc.


IMPROVEMENTS:
- Add refresh button to refetch user step data
- Add debouncer to fetch user step data every 30 seconds
- Add listener for when app is foregrounded, then fetch user step data
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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
