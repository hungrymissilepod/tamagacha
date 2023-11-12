import 'package:flutter/material.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/services/hive_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gif_view/gif_view.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_app_template/services/user_service.dart';
import 'package:flutter_app_template/services/user_pets_service.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'saved_pets_viewmodel.dart';

class SavedPetsView extends StackedView<SavedPetsViewModel> {
  const SavedPetsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SavedPetsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Pets ${viewModel.userPets.length}/$maxPets'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: viewModel.userPets.map((e) => SavedPetCard(pet: e)).toList(),
          ),
        ),
      ),
    );
  }

  @override
  SavedPetsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SavedPetsViewModel();
}

class SavedPetCard extends ViewModelWidget<SavedPetsViewModel> {
  const SavedPetCard({required this.pet, super.key});

  final Pet pet;

  Color hungerBarColor(double hunger) {
    if (hunger <= 0.2) {
      return Colors.red;
    }
    if (hunger <= 0.5) {
      return Colors.orange;
    }
    return Colors.green;
  }

  @override
  Widget build(BuildContext context, SavedPetsViewModel viewModel) {
    double hunger = pet.hunger?.toPrecision(2) ?? 0.0;
    int hungerPercentage = (hunger * 100).toInt();
    return Card(
      color: Colors.grey[300],
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 10),
          Flexible(flex: 2, child: PetIcon(pet: pet)),
          SizedBox(width: 10),
          Flexible(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  pet.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '${pet.rarity.capitalize()}',
                  style: TextStyle(
                    color: rarityColor(pet.rarity),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                Text('Status: ${pet.status()}'),
                SizedBox(height: 5),
                LinearPercentIndicator(
                  percent: hunger.clamp(0.0, 1.0),
                  progressColor: hungerBarColor(hunger),
                  backgroundColor: Colors.grey[200],
                  lineHeight: 10,
                  barRadius: Radius.circular(10),
                  padding: EdgeInsets.zero,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FeedButton(
                      onPressed: () => viewModel.feedPet(pet),
                      canFeed: viewModel.canFeed && pet.hunger! < 1.0 && pet.hunger! != 0.0,
                    ),
                    SellButton(
                      onPressed: () => viewModel.deletePet(pet, pet.sellValue()),
                      sellValue: pet.sellValue(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

class FeedButton extends StatelessWidget {
  const FeedButton({super.key, required this.onPressed, required this.canFeed});

  final Function()? onPressed;
  final bool canFeed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (canFeed) {
          onPressed?.call();
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Feed',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: canFeed ? Colors.blue : Colors.grey,
            ),
          ),
          SizedBox(width: 5),
          FaIcon(
            FontAwesomeIcons.burger,
            size: 16,
            color: canFeed ? Colors.blue : Colors.grey,
          )
        ],
      ),
    );
  }
}

class SellButton extends StatelessWidget {
  const SellButton({super.key, required this.onPressed, required this.sellValue});

  final Function()? onPressed;
  final int sellValue;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed?.call();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sell',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(width: 5),
          FaIcon(FontAwesomeIcons.coins, size: 16, color: Colors.red),
          SizedBox(width: 5),
          Text(
            '$sellValue',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class PetIcon extends StatelessWidget {
  const PetIcon({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: rarityColor(pet.rarity).withOpacity(0.5),
          child: pet.isGif
              ? GifView.asset(
                  "assets/pets/gifs/${pet.file}.gif",
                  height: 100,
                  width: 100,
                )
              : Image.asset(
                  'assets/pets/${pet.file}.png',
                  height: 100,
                  width: 100,
                ),
        ),
        Visibility(
          visible: pet.hunger! <= 0.0,
          child: FaIcon(
            FontAwesomeIcons.skullCrossbones,
            size: 70,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
