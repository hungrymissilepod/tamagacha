import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
// import 'package:flutter_gif/flutter_gif.dart';
import 'package:gif_view/gif_view.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_app_template/ui/common/app_colors.dart';
import 'package:flutter_app_template/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  final int startingIndex;
  const HomeView({Key? key, required this.startingIndex}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpaceLarge,
                Column(
                  children: [
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
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class PetItem extends StatelessWidget {
  PetItem({super.key, required this.pet});

  Pet pet;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          pet.isGif
              ? Flexible(
                  child: GifView.asset(
                    "assets/pets/gifs/${pet.file}.gif",
                    frameRate: 60,
                  ),
                )
              : Flexible(child: Image.asset('assets/pets/${pet.file}.png')),
          Text(pet.name),
        ],
      ),
    );
  }
}
