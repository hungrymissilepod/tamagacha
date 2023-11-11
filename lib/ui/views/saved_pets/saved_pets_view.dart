import 'package:flutter/material.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:gif_view/gif_view.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_app_template/services/user_service.dart';

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

  @override
  Widget build(BuildContext context, SavedPetsViewModel viewModel) {
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
                    frameRate: 60,
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
                Text('Hunger: ${pet.hunger?.toPrecision(2)}'),
                LinearProgressIndicator(
                  value: pet.hunger?.toPrecision(2) ?? 0.0,
                ),
                TextButton(
                  onPressed: () {},
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
          ),
        ],
      ),
    );
  }
}
