import 'package:flutter_app_template/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:flutter_app_template/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:flutter_app_template/ui/views/home/home_view.dart';
import 'package:flutter_app_template/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_app_template/ui/views/counter/counter_view.dart';
import 'package:flutter_app_template/ui/views/login/login_view.dart';
import 'package:flutter_app_template/services/authentication_service.dart';
import 'package:flutter_app_template/services/dio_service.dart';
import 'package:flutter_app_template/services/hive_service.dart';
import 'package:flutter_app_template/services/user_service.dart';
import 'package:flutter_app_template/ui/views/scan/scan_view.dart';
import 'package:flutter_app_template/ui/views/saved_pets/saved_pets_view.dart';
import 'package:flutter_app_template/services/health_service.dart';
import 'package:flutter_app_template/services/user_pets_service.dart';
import 'package:flutter_app_template/ui/views/settings/settings_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CounterView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: ScanView),
    MaterialRoute(page: SavedPetsView),
    MaterialRoute(page: SettingsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: DioService),
    LazySingleton(classType: HiveService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: HealthService),
    LazySingleton(classType: UserPetsService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
