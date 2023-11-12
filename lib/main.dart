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

- display pet rarity in saved pets view cards
- if a pet's hunger reaches 0 they die. Show a dialog to user telling them that their pet died and remove their pet
- Show dialog when user gets a new pet. Allow user to name pet and save it's given name
- pets can gain EXP and level up?
- users need to scan a QR code in order to get a pet
- clean up the scan view UI
- add more pets and gifs
- show a dialog when spinning the wheel that will display the wheel and then the pet the user gets afterwards
- when we spin the wheel, randomise which pets will be in the pot (only have a few rare ones to make them more rare)
- user should be able to sell their pet while it is still ALIVE
  - remove the Put Down button
  - if pet is dead then replace the sell button for a remove button
  - the pet's worth is based on its rarity and it's health/hunger level
- display to the user when they have a full inventory of pets
- add sound effects to; spinning the wheel, landing on an item, pet levels up, etc.


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
