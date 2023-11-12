import 'dart:math';

import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/services/hive_service.dart';
import 'package:flutter_app_template/services/user_service.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends ReactiveViewModel {
  final UserService _userService = locator<UserService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];

  final Random random = Random();

  Future<void> addCoinsCheat() async {
    await _userService.addCredits(spinCost);
  }

  Future<void> addRandomCoinsCheat() async {
    int r = random.nextInt(999);
    await _userService.addCredits(r);
  }
}
