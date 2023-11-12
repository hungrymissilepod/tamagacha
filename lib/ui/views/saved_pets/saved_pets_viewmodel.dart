import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/services/user_pets_service.dart';
import 'package:stacked/stacked.dart';

class SavedPetsViewModel extends ReactiveViewModel {
  final UserPetsService _userPetsService = locator<UserPetsService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_userPetsService];

  List<Pet> get userPets => _userPetsService.pets.pets;

  Future<void> deletePet(Pet pet) async {
    await _userPetsService.deletePet(pet.uuid!);
    notifyListeners();
  }

  Future<void> feedPet(Pet pet) async {
    await _userPetsService.feedPet(pet.uuid!);
    notifyListeners();
  }
}
