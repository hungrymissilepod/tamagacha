import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/ui/views/saved_pets/saved_pets_view.dart';
import 'package:flutter_app_template/ui/views/scan/scan_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gif_view/gif_view.dart';
import 'package:stacked/stacked.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.selectedPage,
        onTap: viewModel.onBottomNavBarTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: FaIcon(
                FontAwesomeIcons.qrcode,
              ),
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: FaIcon(
                FontAwesomeIcons.paw,
              ),
            ),
            label: 'Pets',
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          controller: viewModel.pageController,
          onPageChanged: viewModel.onPageChanged,
          children: <Widget>[
            ScanView(),
            SavedPetsView(),
          ],
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
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: rarityColor(pet.rarity).withOpacity(0.5),
            width: 3,
          ),
          vertical: BorderSide(
            color: rarityColor(pet.rarity).withOpacity(0.5),
            width: 3,
          ),
        ),
        color: rarityColor(pet.rarity).withOpacity(0.5),
      ),
      child: Container(
        margin: const EdgeInsets.all(14),
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
            const SizedBox(height: 10),
            Text(
              pet.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

      // child: DecoratedBox(
      //   decoration: BoxDecoration(
      //     border: Border.symmetric(
      //       horizontal: BorderSide(
      //         color: style.borderColor,
      //         width: style.borderWidth / 2,
      //       ),
      //       vertical: BorderSide(
      //         color: style.borderColor,
      //         width: style.borderWidth / 4,
      //       ),
      //     ),
      //     color: style.color,
      //   ),
      //   child: Center(
      //     child: DefaultTextStyle(
      //       textAlign: style.textAlign,
      //       style: style.textStyle,
