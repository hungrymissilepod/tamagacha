import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/services/hive_service.dart';
import 'package:flutter_app_template/ui/common/ui_helpers.dart';
import 'package:flutter_app_template/ui/views/home/home_view.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stacked/stacked.dart';

import 'scan_viewmodel.dart';

class ScanView extends StackedView<ScanViewModel> {
  const ScanView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ScanViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
        actions: [IconButton(onPressed: () => viewModel.onSettingsTapped(), icon: Icon(Icons.settings))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Coins: ${viewModel.credits}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    SizedBox(width: 5),
                    FaIcon(
                      FontAwesomeIcons.coins,
                      size: 30,
                    )
                  ],
                ),
                Text(
                  'Today\'s steps: ${viewModel.steps}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Try your luck!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 20),
                FortuneBar(
                  rotationCount: 20,
                  animateFirst: false,
                  duration: Duration(milliseconds: 7800),
                  onAnimationEnd: () {
                    print("you got a: ${viewModel.chosenOne}!");
                  },
                  height: 140,
                  selected: viewModel.controller.stream,
                  items: [
                    for (var i in viewModel.allPets)
                      FortuneItem(
                          style: FortuneItemStyle(color: rarityColor(i.rarity)),
                          child: PetItem(
                            pet: i,
                          )),
                  ],
                ),
                SizedBox(height: 20),
                MaterialButton(
                  disabledColor: Colors.grey,
                  color: Colors.black,
                  onPressed: viewModel.canSpinWheel
                      ? () {
                          viewModel.spinWheel();
                        }
                      : null,
                  child: Text(
                    'Spin: -${spinCost} Coins',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Scan QR code for a free pet!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  disabledColor: Colors.grey,
                  color: Colors.black,
                  onPressed: viewModel.canScanQRCode
                      ? () {
                          viewModel.scanQR();
                        }
                      : null,
                  child: Text(
                    'Scan',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  ScanViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ScanViewModel();
}
