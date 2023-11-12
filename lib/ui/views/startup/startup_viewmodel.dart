import 'package:flutter_app_template/app/app.logger.dart';
import 'package:flutter_app_template/services/authentication_service.dart';
import 'package:flutter_app_template/services/health_service.dart';
import 'package:flutter_app_template/services/hive_service.dart';
import 'package:flutter_app_template/services/user_pets_service.dart';
import 'package:flutter_app_template/services/user_service.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_app_template/app/app.locator.dart';
import 'package:flutter_app_template/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();
  final HiveService _hiveService = locator<HiveService>();
  final UserService _userService = locator<UserService>();
  final UserPetsService _userPetsService = locator<UserPetsService>();
  final HealthService _healthService = locator<HealthService>();
  final _logger = getLogger('StartupViewModel');

  Future runStartupLogic() async {
    await Future.wait([
      _hiveService.init(),
      _healthService.init(),
    ]);

    await _userService.load();

    bool firstRun = await IsFirstRun.isFirstRun();
    if (firstRun) {
      await _userService.addCredits(spinCost);
      await _userService.calculateInitialSteps(_healthService.lifeTimeSteps);
    } else {
      /// update base level steps and check if user earned any credits
      await _userService.updateBaseLevelSteps(_healthService.lifeTimeSteps);
    }

    await _userPetsService.checkPetHealth();

    // 2. Check if the user is logged in
    if (_authenticationService.userLoggedIn()) {
      _logger.i('User is logged in');
      // 3. Navigate to HomeView
      _navigationService.replaceWith(Routes.homeView,
          arguments: const HomeViewArguments(startingIndex: 111));
    } else {
      _logger.i('User is NOT logged in');
      // 4. Or navigate to LoginView
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
