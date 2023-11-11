// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_app_template/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:ui' as _i9;

import 'package:dio/dio.dart' as _i2;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter_app_template/models/pet.dart' as _i14;
import 'package:flutter_app_template/models/pets.dart' as _i4;
import 'package:flutter_app_template/services/authentication_service.dart'
    as _i10;
import 'package:flutter_app_template/services/dio_service.dart' as _i11;
import 'package:flutter_app_template/services/health_service.dart' as _i15;
import 'package:flutter_app_template/services/hive_service.dart' as _i12;
import 'package:flutter_app_template/services/user_service.dart' as _i13;
import 'package:health/health.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;
import 'package:uuid/uuid.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponse_0<T> extends _i1.SmartFake implements _i2.Response<T> {
  _FakeResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUuid_1 extends _i1.SmartFake implements _i3.Uuid {
  _FakeUuid_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePets_2 extends _i1.SmartFake implements _i4.Pets {
  _FakePets_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHealthFactory_3 extends _i1.SmartFake implements _i5.HealthFactory {
  _FakeHealthFactory_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i6.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i7.GlobalKey<_i7.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i7.GlobalKey<_i7.NavigatorState>?);
  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i6.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<T?>? navigateWithTransition<T>(
    _i7.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i7.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i6.Transition? transitionClass,
    _i6.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? replaceWithTransition<T>(
    _i7.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i7.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i6.Transition? transitionClass,
    _i6.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void popUntil(
    _i7.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i7.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? navigateToView<T>(
    _i7.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i7.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i6.Transition? transition,
    _i6.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i7.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? clearStackAndShowView<T>(
    _i7.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? clearTillFirstAndShowView<T>(
    _i7.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
  @override
  _i8.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i7.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i6.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i6.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<_i6.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i8.Future<_i6.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i6.SheetResponse<dynamic>?>.value(),
      ) as _i8.Future<_i6.SheetResponse<dynamic>?>);
  @override
  _i8.Future<_i6.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i9.Color? barrierColor = const _i9.Color(2315255808),
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i8.Future<_i6.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i8.Future<_i6.SheetResponse<T>?>.value(),
      ) as _i8.Future<_i6.SheetResponse<T>?>);
  @override
  void completeSheet(_i6.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i6.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i6.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i7.Widget Function(
      _i7.BuildContext,
      _i6.DialogRequest<dynamic>,
      dynamic Function(_i6.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<_i6.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i9.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i9.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i6.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i8.Future<_i6.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i6.DialogResponse<dynamic>?>.value(),
      ) as _i8.Future<_i6.DialogResponse<dynamic>?>);
  @override
  _i8.Future<_i6.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i9.Color? barrierColor = const _i9.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    bool? useSafeArea = true,
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #useSafeArea: useSafeArea,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i8.Future<_i6.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i8.Future<_i6.DialogResponse<T>?>.value(),
      ) as _i8.Future<_i6.DialogResponse<T>?>);
  @override
  _i8.Future<_i6.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    _i9.Color? cancelTitleColor,
    String? confirmationTitle = r'Ok',
    _i9.Color? confirmationTitleColor,
    bool? barrierDismissible = false,
    _i6.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #confirmationTitle: confirmationTitle,
            #confirmationTitleColor: confirmationTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i8.Future<_i6.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i6.DialogResponse<dynamic>?>.value(),
      ) as _i8.Future<_i6.DialogResponse<dynamic>?>);
  @override
  void completeDialog(_i6.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AuthenticationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationService extends _i1.Mock
    implements _i10.AuthenticationService {
  @override
  bool userLoggedIn() => (super.noSuchMethod(
        Invocation.method(
          #userLoggedIn,
          [],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}

/// A class which mocks [DioService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDioService extends _i1.Mock implements _i11.DioService {
  @override
  _i8.Future<_i2.Response<dynamic>> get(
    String? url, {
    Map<String, dynamic>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#parameters: parameters},
        ),
        returnValue:
            _i8.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #get,
            [url],
            {#parameters: parameters},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #get,
            [url],
            {#parameters: parameters},
          ),
        )),
      ) as _i8.Future<_i2.Response<dynamic>>);
  @override
  _i8.Future<_i2.Response<dynamic>> post(
    String? url, {
    Map<String, dynamic>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {#parameters: parameters},
        ),
        returnValue:
            _i8.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #post,
            [url],
            {#parameters: parameters},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #post,
            [url],
            {#parameters: parameters},
          ),
        )),
      ) as _i8.Future<_i2.Response<dynamic>>);
  @override
  _i8.Future<_i2.Response<dynamic>> put(
    String? url, {
    Map<String, dynamic>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {#parameters: parameters},
        ),
        returnValue:
            _i8.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #put,
            [url],
            {#parameters: parameters},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #put,
            [url],
            {#parameters: parameters},
          ),
        )),
      ) as _i8.Future<_i2.Response<dynamic>>);
  @override
  _i8.Future<_i2.Response<dynamic>> patch(
    String? url, {
    Map<String, dynamic>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {#parameters: parameters},
        ),
        returnValue:
            _i8.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #patch,
            [url],
            {#parameters: parameters},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.Response<dynamic>>.value(_FakeResponse_0<dynamic>(
          this,
          Invocation.method(
            #patch,
            [url],
            {#parameters: parameters},
          ),
        )),
      ) as _i8.Future<_i2.Response<dynamic>>);
}

/// A class which mocks [HiveService].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveService extends _i1.Mock implements _i12.HiveService {
  @override
  _i8.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> write(
    String? key,
    dynamic value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #write,
          [
            key,
            value,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<dynamic> read(
    String? key, {
    dynamic defaultValue,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [key],
          {#defaultValue: defaultValue},
        ),
        returnValue: _i8.Future<dynamic>.value(),
        returnValueForMissingStub: _i8.Future<dynamic>.value(),
      ) as _i8.Future<dynamic>);
  @override
  _i8.Future<void> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [UserService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserService extends _i1.Mock implements _i13.UserService {
  @override
  _i3.Uuid get uuid => (super.noSuchMethod(
        Invocation.getter(#uuid),
        returnValue: _FakeUuid_1(
          this,
          Invocation.getter(#uuid),
        ),
        returnValueForMissingStub: _FakeUuid_1(
          this,
          Invocation.getter(#uuid),
        ),
      ) as _i3.Uuid);
  @override
  _i4.Pets get pets => (super.noSuchMethod(
        Invocation.getter(#pets),
        returnValue: _FakePets_2(
          this,
          Invocation.getter(#pets),
        ),
        returnValueForMissingStub: _FakePets_2(
          this,
          Invocation.getter(#pets),
        ),
      ) as _i4.Pets);
  @override
  set pets(_i4.Pets? _pets) => super.noSuchMethod(
        Invocation.setter(
          #pets,
          _pets,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Pets get allPets => (super.noSuchMethod(
        Invocation.getter(#allPets),
        returnValue: _FakePets_2(
          this,
          Invocation.getter(#allPets),
        ),
        returnValueForMissingStub: _FakePets_2(
          this,
          Invocation.getter(#allPets),
        ),
      ) as _i4.Pets);
  @override
  set allPets(_i4.Pets? _allPets) => super.noSuchMethod(
        Invocation.setter(
          #allPets,
          _allPets,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get credits => (super.noSuchMethod(
        Invocation.getter(#credits),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set credits(int? _credits) => super.noSuchMethod(
        Invocation.setter(
          #credits,
          _credits,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get listenersCount => (super.noSuchMethod(
        Invocation.getter(#listenersCount),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  void addCredits(int? num) => super.noSuchMethod(
        Invocation.method(
          #addCredits,
          [num],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeCredits(int? num) => super.noSuchMethod(
        Invocation.method(
          #removeCredits,
          [num],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<void> calculateInitialSteps(int? lifeTimeSteps) =>
      (super.noSuchMethod(
        Invocation.method(
          #calculateInitialSteps,
          [lifeTimeSteps],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> updateBaseLevelSteps(int? currentStepsLifeTimeSteps) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateBaseLevelSteps,
          [currentStepsLifeTimeSteps],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> load() => (super.noSuchMethod(
        Invocation.method(
          #load,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> savePet(_i14.Pet? pet) => (super.noSuchMethod(
        Invocation.method(
          #savePet,
          [pet],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<void> deletePet(_i14.Pet? pet) => (super.noSuchMethod(
        Invocation.method(
          #deletePet,
          [pet],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  bool canSpinWheel() => (super.noSuchMethod(
        Invocation.method(
          #canSpinWheel,
          [],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void listenToReactiveValues(List<dynamic>? reactiveValues) =>
      super.noSuchMethod(
        Invocation.method(
          #listenToReactiveValues,
          [reactiveValues],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [HealthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockHealthService extends _i1.Mock implements _i15.HealthService {
  @override
  _i5.HealthFactory get health => (super.noSuchMethod(
        Invocation.getter(#health),
        returnValue: _FakeHealthFactory_3(
          this,
          Invocation.getter(#health),
        ),
        returnValueForMissingStub: _FakeHealthFactory_3(
          this,
          Invocation.getter(#health),
        ),
      ) as _i5.HealthFactory);
  @override
  set health(_i5.HealthFactory? _health) => super.noSuchMethod(
        Invocation.setter(
          #health,
          _health,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get steps => (super.noSuchMethod(
        Invocation.getter(#steps),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set steps(int? _steps) => super.noSuchMethod(
        Invocation.setter(
          #steps,
          _steps,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get lifeTimeSteps => (super.noSuchMethod(
        Invocation.getter(#lifeTimeSteps),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set lifeTimeSteps(int? _lifeTimeSteps) => super.noSuchMethod(
        Invocation.setter(
          #lifeTimeSteps,
          _lifeTimeSteps,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}
