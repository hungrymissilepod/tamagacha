import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/models/pet.dart';
import 'package:flutter_app_template/services/user_service.dart';
import 'package:stacked/stacked.dart';

class SavedPetsViewModel extends BaseViewModel {
  final UserService _userService = locator<UserService>();

  List<Pet> get userPets => _userService.pets.pets;

  void deletePet(Pet pet) {
    _userService.deletePet(pet);
    notifyListeners();
  }
}
