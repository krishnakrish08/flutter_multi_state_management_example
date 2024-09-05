import 'package:flutter/material.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/models/counter_model.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/models/settings_model.dart';
import 'package:flutter_multiple_state_managements_in_one/inherited_provider_bloc/models/user_model.dart';

class AppModel extends InheritedModel<String> {
  final CounterModel counterModel;
  final UserModel userModel;
  final SettingsModel settingsModel;

  const AppModel({
    super.key,
    required this.counterModel,
    required this.userModel,
    required this.settingsModel,
    required super.child,
  });

  @override
  bool updateShouldNotify(AppModel oldWidget) {
    return counterModel != oldWidget.counterModel ||
        userModel != oldWidget.userModel ||
        settingsModel != oldWidget.settingsModel;
  }

  @override
  bool updateShouldNotifyDependent(
      AppModel oldWidget, Set<String> dependencies) {
    if (dependencies.contains('counter') &&
        counterModel != oldWidget.counterModel) {
      return true;
    }

    if (dependencies.contains('user') && userModel != oldWidget.userModel) {
      return true;
    }

    if (dependencies.contains('settings') &&
        settingsModel != oldWidget.settingsModel) {
      return true;
    }

    return false;
  }

  static AppModel? of(BuildContext context, {String aspect = ''}) {
    return InheritedModel.inheritFrom<AppModel>(context, aspect: aspect);
  }
}
