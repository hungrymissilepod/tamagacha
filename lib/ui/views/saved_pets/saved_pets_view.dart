import 'package:flutter/material.dart';
import 'package:flutter_app_template/models/pet.dart';
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
        title: Text('My Pets'),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          pet.isGif
              ? Flexible(
                  flex: 2,
                  child: GifView.asset(
                    "assets/pets/gifs/${pet.file}.gif",
                    height: 100,
                    width: 100,
                  ),
                )
              : Flexible(
                  flex: 2,
                  child: Image.asset(
                    'assets/pets/${pet.file}.png',
                    height: 100,
                    width: 100,
                  )),
          Flexible(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet.name,
                ),
                Text(
                  'Rarity: ${pet.rarity}',
                ),
                Text('Hunger: ${hungerPercentage}%'),
                LinearPercentIndicator(
                  percent: hunger.clamp(0.0, 1.0),
                  progressColor: hungerBarColor(hunger),
                  backgroundColor: Colors.grey[200],
                  lineHeight: 10,
                  barRadius: Radius.circular(10),
                  padding: EdgeInsets.zero,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () => viewModel.feedPet(pet),
                      child: Text(
                        'Feed',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => viewModel.deletePet(pet),
                      child: Text(
                        'Put down',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
