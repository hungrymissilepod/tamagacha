import 'dart:async';

import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

/*
TODO:
- display images and gifs in carousel
- after spinning a wheel we save the pet to user storage
- display user's pets in a list
- display pedometer data on screen
- user can choose to delete a pet
- give user coins based on number of steps taken
- user can give pet food to a pet
- pets can gain EXP and level up
- users need to scan a QR code in order to get a pet (can skip this in DEV mode)
- add sound effects to; spinning the wheel, landing on an item, pet levels up, etc.
*/

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String scannedCode = '';

  List<Item> items = <Item>[
    Item('Harry', 0.8),
    Item('Ron', 0.7),
    Item('Hermonie', 0.4),
    Item('Voldemort', 0.1),
    Item('Dunbledore', 0.2),
  ];

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
    String chosenOne = randomChoice(items.map((e) => e.name), items.map((e) => e.weight));
    print(chosenOne);
    int? index = items.indexWhere((element) => element.name == chosenOne);
    if (index != -1) {
      controller.add(index);
    }
  }
}

class Item {
  Item(this.name, this.weight);

  String name;
  double weight;
}
