import 'dart:async';

import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/services/health_service.dart';
import 'package:flutter_app_template/services/hive_service.dart';
import 'package:flutter_app_template/services/user_pets_service.dart';
import 'package:flutter_app_template/services/user_service.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:health/health.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stacked/stacked.dart';
import 'package:is_first_run/is_first_run.dart';

class ScanViewModel extends ReactiveViewModel {
  final UserService _userService = locator<UserService>();
  final UserPetsService _userPetsService = locator<UserPetsService>();
  final HealthService _healthService = locator<HealthService>();

  final AudioPlayer player = AudioPlayer();

  int get credits => _userService.credits;
  int get steps => _healthService.steps;
  int get lifeTimeSteps => _healthService.lifeTimeSteps;

  bool get canSpinWheel => _userService.canSpinWheel();

  Future<void> addCreditsCheat() async {
    await _userService.addCredits(spinCost);
    rebuildUi();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];

  List<Pet> get allPets => _userService.allPets.pets ?? <Pet>[];

  String scannedCode = '';
  String chosenOne = '';

  StreamController<int> controller = StreamController<int>();

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    scannedCode = barcodeScanRes;
    notifyListeners();
  }

  spinWheel() async {
    player.setAsset('assets/audio/fortune.mp3');
    player.play();

    List<Pet> randomPets = getRandomPets();

    chosenOne = randomChoice(randomPets.map((e) => e.name), randomPets.map((e) => e.weight));

    int? index = allPets.indexWhere((element) => element.name == chosenOne);
    if (index != -1) {
      controller.add(index);
    }
    await _userPetsService.savePet(Pet.clone(allPets[index]));
    await _userService.removeCredits(spinCost);
    rebuildUi();
  }

  List<Pet> getRandomPets() {
    return (allPets.toList()..shuffle()).take(10).toList();
  }
}
