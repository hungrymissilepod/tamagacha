import 'package:flutter/material.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/ui/common/ui_helpers.dart';
import 'package:flutter_app_template/ui/views/home/home_view.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            verticalSpaceLarge,
            Column(
              children: [
                Text('Steps: ${viewModel.steps}'),
                // Text('Pedestrian event: ${viewModel.status}'),
                const Text(
                  'Scan QR code',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                verticalSpaceMedium,
                MaterialButton(
                  color: Colors.black,
                  onPressed: viewModel.scanQR,
                  child: Text(
                    'Scan',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            FortuneBar(
              animateFirst: false,
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
            verticalSpaceMedium,
            MaterialButton(
              color: Colors.black,
              onPressed: viewModel.spinWheel,
              child: Text(
                'Spin',
                style: const TextStyle(color: Colors.white),
              ),
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

  // @override
  // void onViewModelReady(ScanViewModel viewModel) => viewModel.initPlatformState();
}
