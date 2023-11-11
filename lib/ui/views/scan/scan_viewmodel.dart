import 'dart:async';

import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/services/user_service.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:health/health.dart';
import 'package:stacked/stacked.dart';

class ScanViewModel extends BaseViewModel {
  final UserService _userService = locator<UserService>();

  late HealthFactory health;
  String steps = '?';

  ScanViewModel() {
    health = HealthFactory(useHealthConnectIfAvailable: true);

    requestSteps();
  }

  Future<void> requestSteps() async {
    var types = [
      HealthDataType.STEPS,
    ];
    // requesting access to the data types before reading them
    bool requested = await health.requestAuthorization(types);

    var now = DateTime.now();

    // fetch health data from the last 24 hours
    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(now.subtract(Duration(days: 1)), now, types);

    // get the number of steps for today
    var midnight = DateTime(now.year, now.month, now.day);
    int? _steps = await health.getTotalStepsInInterval(midnight, now);
    steps = _steps.toString();
    notifyListeners();
  }

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

  spinWheel() {
    chosenOne = randomChoice(allPets.map((e) => e.name), allPets.map((e) => e.weight));
    print(chosenOne);
    int? index = allPets.indexWhere((element) => element.name == chosenOne);
    if (index != -1) {
      controller.add(index);
    }
    _userService.savePet(Pet.clone(allPets[index]));
  }

  // late Stream<StepCount> stepCountStream;
  // late Stream<PedestrianStatus> pedestrianStatusStream;

  // String status = '?', steps = '?';

  // /// Handle step count changed
  // void onStepCount(StepCount event) {
  //   steps = event.steps.toString();
  //   // int steps = event.steps;

  //   DateTime timeStamp = event.timeStamp;
  //   notifyListeners();
  // }

  // /// Handle status changed
  // void onPedestrianStatusChanged(PedestrianStatus event) {
  //   // String status = event.status;
  //   status = event.status;

  //   DateTime timeStamp = event.timeStamp;
  //   notifyListeners();
  // }

  // /// Handle the error
  // void onPedestrianStatusError(error) {
  //   status = 'Pedestrian Status not available';
  //   notifyListeners();
  // }

  // /// Handle the error
  // void onStepCountError(error) {
  //   steps = 'Step Count not available';
  //   notifyListeners();
  // }

  // Future<void> initPlatformState() async {
  //   // Init streams
  //   pedestrianStatusStream = Pedometer.pedestrianStatusStream;
  //   stepCountStream = Pedometer.stepCountStream;

  //   // Listen to streams and handle errors
  //   stepCountStream.listen(onStepCount).onError(onStepCountError);

  //   pedestrianStatusStream.listen(onPedestrianStatusChanged).onError(onPedestrianStatusError);
  // }
}
