import 'package:flutter/material.dart';
import 'package:flutter_app_template/services/hive_service.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cheats'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
              TextButton(
                child: Text('+${spinCost} coins'),
                onPressed: () => viewModel.addCoinsCheat(),
              ),
              TextButton(
                child: Text('+random coins'),
                onPressed: () => viewModel.addRandomCoinsCheat(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
