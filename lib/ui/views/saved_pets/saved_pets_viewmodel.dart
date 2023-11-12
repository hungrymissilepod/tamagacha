import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/services/hive_service.dart';
import 'package:flutter_app_template/services/user_pets_service.dart';
import 'package:flutter_app_template/services/user_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stacked/stacked.dart';

class SavedPetsViewModel extends ReactiveViewModel {
  final UserService _userService = locator<UserService>();
  final UserPetsService _userPetsService = locator<UserPetsService>();
  final AudioPlayer player = AudioPlayer();

  @override
  List<ListenableServiceMixin> get listenableServices => [_userPetsService];

  List<Pet> get userPets => _userPetsService.pets.pets;

  bool get canFeed => _userService.canFeed();

  Future<void> deletePet(Pet pet, int value) async {
    player.setAsset('assets/audio/sell.mp3');
    player.play();
    await _userPetsService.deletePet(pet.uuid!);
    await _userService.addCredits(value);
    notifyListeners();
  }

  Future<void> feedPet(Pet pet) async {
    player.setAsset('assets/audio/eat.mp3');
    player.play();
    await _userPetsService.feedPet(pet.uuid!);
    await _userService.removeCredits(foodCost);
    notifyListeners();
  }
}
